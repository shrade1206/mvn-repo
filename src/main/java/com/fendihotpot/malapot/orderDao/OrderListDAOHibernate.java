package com.fendihotpot.malapot.orderDao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.PersistenceContext;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.fendihotpot.malapot.domain.OrderListBean;

@Repository
public class OrderListDAOHibernate implements OrderListDAO {
	@PersistenceContext
	private Session session;

	
	@Override
	public Integer insert(OrderListBean orderList) {
		if (orderList!=null && orderList.getUserMobile()!=null) {
			return (Integer) session.save(orderList);
		}
		return 0;
	}

	@Override
	public OrderListBean select(Integer orderId) {
		if (orderId!=null && !orderId.equals(0)) {
			return session.get(OrderListBean.class, orderId);
		}
		return null;
	}

	@Override
	public List<OrderListBean> select(String userId, Integer currentPage, Integer pageSize) {
		if (userId!=null && userId.length()>0) {
			String hql = "FROM OrderListBean WHERE userId=:userId ORDER BY order_date DESC";
			List<OrderListBean> orderList = session.createQuery(hql, OrderListBean.class)
					.setParameter("userId", userId)
					.setFirstResult((currentPage - 1) * pageSize)
					.setMaxResults(pageSize)
					.list();
			return orderList;
		}
		return null;
	}

	@Override
	public List<OrderListBean> selectByBranch(String branch, Integer currentPage, Integer pageSize) {
		String hql = "FROM OrderListBean WHERE takeoutStore=:branch ORDER BY order_date DESC";
		List<OrderListBean> orderList = session.createQuery(hql, OrderListBean.class)
				.setParameter("branch", branch)
				.setFirstResult((currentPage - 1) * pageSize)
				.setMaxResults(pageSize)
				.list();
		return orderList;
	}
	
	@Override
	public List<OrderListBean> select(Integer currentPage, Integer pageSize) {
		String hql = "FROM OrderListBean ORDER BY order_date DESC";
		List<OrderListBean> orderList = session.createQuery(hql, OrderListBean.class)
				.setFirstResult((currentPage - 1) * pageSize)
				.setMaxResults(pageSize)
				.list();
		return orderList;
	}

	@Override
	public boolean delect(Integer orderId) {
		if (orderId!=null && !orderId.equals(0)) {
			OrderListBean orderList = session.get(OrderListBean.class, orderId);
			session.delete(orderList);
			return true;
		}
		return false;
	}

	@Override
	public Map<String, List<Map<String, Object>>> selectSales() {
		Map<String, List<Map<String, Object>>> sales = new HashMap<>();
		String hql = "SELECT DATE_FORMAT( o.orderDate, '%Y-%m'), ROUND( SUM(o.totalAmount), 0) FROM OrderListBean o WHERE DATE_FORMAT( o.orderDate, '%Y' )=:year GROUP BY DATE_FORMAT( o.orderDate, '%Y-%m')";
		// 取出年份
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		Integer thisYear = Integer.parseInt(sdf.format(new Date()));
		Integer lastYear = thisYear - 1;
		// 今年各月份業績
		List<Object[]> salesNow = session.createQuery(hql, Object[].class)
				.setParameter("year", thisYear.toString())
				.list();
		Map<String, Object> salesOfNow = null;
		List<Map<String, Object>> salesThisYear = new ArrayList<>();
		sales.put("thisYear", salesThisYear);
		for (Object[] object : salesNow) {
			salesOfNow = new HashMap<>();
			salesOfNow.put("month", (String) object[0]);
			salesOfNow.put("sales", (Long) object[1]);
			salesThisYear.add(salesOfNow);
		}
		// 去年各月份業績
		List<Object[]> salesPast = session.createQuery(hql, Object[].class)
				.setParameter("year", lastYear.toString())
				.list();
		Map<String, Object> salesOfPast = null;
		List<Map<String, Object>> salesLastYear = new ArrayList<>();
		sales.put("lastYear", salesLastYear);
		for (Object[] object : salesPast) {
			salesOfPast = new HashMap<>();
			salesOfPast.put("month", (String) object[0]);
			salesOfPast.put("sales", (Long) object[1]);
			salesLastYear.add(salesOfPast);
		}
		return sales;
	}
	
	@Override
	public Map<String, List<Map<String, Object>>> selectSalesByBranch(String branch) {
		Map<String, List<Map<String, Object>>> sales = new HashMap<>();
		String hql = "SELECT DATE_FORMAT( o.orderDate, '%Y-%m'), ROUND( SUM(o.totalAmount), 0) FROM OrderListBean o WHERE DATE_FORMAT( o.orderDate, '%Y' )=:year AND o.takeoutStore=:branch GROUP BY DATE_FORMAT( o.orderDate, '%Y-%m')";
		// 取出年份
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		Integer thisYear = Integer.parseInt(sdf.format(new Date()));
		Integer lastYear = thisYear - 1;
		// 今年各月份業績
		List<Object[]> salesNow = session.createQuery(hql, Object[].class)
				.setParameter("year", thisYear.toString())
				.setParameter("branch", branch)
				.list();
		Map<String, Object> salesOfNow = null;
		List<Map<String, Object>> salesThisYear = new ArrayList<>();
		sales.put("thisYear", salesThisYear);
		for (Object[] object : salesNow) {
			salesOfNow = new HashMap<>();
			salesOfNow.put("month", (String) object[0]);
			salesOfNow.put("sales", (Long) object[1]);
			salesThisYear.add(salesOfNow);
		}
		// 去年各月份業績
		List<Object[]> salesPast = session.createQuery(hql, Object[].class)
				.setParameter("year", lastYear.toString())
				.setParameter("branch", branch)
				.list();
		Map<String, Object> salesOfPast = null;
		List<Map<String, Object>> salesLastYear = new ArrayList<>();
		sales.put("lastYear", salesLastYear);
		for (Object[] object : salesPast) {
			salesOfPast = new HashMap<>();
			salesOfPast.put("month", (String) object[0]);
			salesOfPast.put("sales", (Long) object[1]);
			salesLastYear.add(salesOfPast);
		}
		return sales;
	}

	@Override
	public Integer totalRows() {
		String hql = "SELECT COUNT(o.id) FROM OrderListBean AS o";
		return session.createQuery(hql, Long.class).uniqueResult().intValue();
	}
	@Override
	public Integer totalRowsByBranch(String branch) {
		String hql = "SELECT COUNT(o.id) FROM OrderListBean AS o WHERE o.takeoutStore=:branch";
		return session.createQuery(hql, Long.class)
				.setParameter("branch", branch)
				.uniqueResult()
				.intValue();
	}
	@Override
	public List<Object[]> salesForBranches() {
		// 今年
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		Integer thisYear = Integer.parseInt(sdf.format(new Date()));
		String hql = "SELECT o.takeoutStore, ROUND( SUM(o.totalAmount), 0) FROM OrderListBean AS o WHERE DATE_FORMAT( o.orderDate, '%Y' )=:year GROUP BY o.takeoutStore";
		return session.createQuery(hql, Object[].class)
				.setParameter("year", thisYear.toString())
				.list();
	}
	
}