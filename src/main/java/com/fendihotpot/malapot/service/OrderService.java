package com.fendihotpot.malapot.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fendihotpot.malapot.dao.OrderItemDAO;
import com.fendihotpot.malapot.dao.OrderListDAO;
import com.fendihotpot.malapot.domain.OrderItemBean;
import com.fendihotpot.malapot.domain.OrderListBean;


@Service
@Transactional(rollbackForClassName = "Exception")
public class OrderService {
	@Autowired
	private OrderItemDAO orderItemDao;
	@Autowired
	private OrderListDAO orderListDao;

	private final Integer pageSize = 10;
	
	public boolean insert(OrderListBean orderBean, List<OrderItemBean> orderItems) throws Exception {
		boolean result = false;
		// 新增訂單
		if (orderBean!=null && orderItems!=null) { 
			Integer pk = orderListDao.insert(orderBean);
			// 新增訂單品項
			for (OrderItemBean orderItem : orderItems) {
				orderItem.setOrderId(pk);
				if (!orderItemDao.insert(orderItem)) {
					// 訂單品項新增失敗就rollback
					throw new Exception();
				}
			}
			result = true;
		}
		return result;
	}

	public List<OrderListBean> select(OrderListBean orderList, Integer currentPage) {
		List<OrderListBean> result = null;
		if (orderList!=null) {
			// 用戶查詢所有訂單
			if (orderList.getUserMobile()!=null && orderList.getUserMobile().length()>0 && currentPage!=null) {
				result = orderListDao.select(orderList.getUserMobile(), currentPage, this.pageSize);
			}
			// 用戶查詢一筆訂單詳細資訊
			if (orderList.getId()!=null && !orderList.getId().equals(0)) {
				result = new ArrayList<OrderListBean>();
				result.add(orderListDao.select(orderList.getId()));
			}
			if (orderList.getTakeoutStore()!=null && orderList.getTakeoutStore().length()>0) {
				result = orderListDao.selectByBranch(orderList.getTakeoutStore(), currentPage, this.pageSize);
			}
		} else {
			// 後台查詢所有訂單
			result = orderListDao.select(currentPage, this.pageSize);
		}
		return result;
	}
	
	public Integer totalPage(String branch) {
		Integer result = null;
		if (branch!=null && branch.length()>0) {
			result = (orderListDao.totalRowsByBranch(branch)+this.pageSize-1)/this.pageSize;
		} else {
			result = (orderListDao.totalRows()+this.pageSize-1)/this.pageSize;
		}
		return result;
	}
	
	public boolean delete(OrderListBean orderList, List<OrderItemBean> orderItems) throws Exception {
		boolean result = false;
		// 刪除訂單品項
		if (orderItems!=null && orderList.getId().equals(orderItems.get(0).getOrderId())) {
			for (OrderItemBean orderItem : orderItems) {
				// 有一筆刪除失敗就rollback
				if (!orderItemDao.delete(orderItem.getId())) {
					throw new Exception();
				}
				result = true;
			}
		}
		// 刪除整筆訂單
		if (orderList!=null && orderList.getId()!=null && !orderList.getId().equals(0)) {
			result = orderListDao.delect(orderList.getId());
		}
		return result;
	}
	public Map<String, List<Map<String, Object>>> salesFigure(String branch) {
		Map<String, List<Map<String, Object>>> result = null;
		if (branch!=null) {
			result = orderListDao.selectSalesByBranch(branch);
		} else {
			result = orderListDao.selectSales();
		}
		return result;
	}
	public List<Object[]> salesForBranches() {
		return orderListDao.salesForBranches();
	}
}
