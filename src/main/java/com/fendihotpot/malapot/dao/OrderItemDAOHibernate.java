package com.fendihotpot.malapot.dao;

import javax.persistence.PersistenceContext;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.fendihotpot.malapot.domain.OrderItemBean;

@Repository
public class OrderItemDAOHibernate implements OrderItemDAO{
	@PersistenceContext
	private Session session;
	
	@Override
	public boolean insert(OrderItemBean orderItem) {
		if (orderItem!=null && orderItem.getOrderId()!=null) {
			Integer pk = (Integer) session.save(orderItem);
			if (pk!=null && !pk.equals(0)) {
				return true;
			}
		}
		return false;
	}

	@Override
	public boolean update(OrderItemBean orderItem) {
		if (orderItem!=null && orderItem.getOrderQty()!=null) {
			try {
				session.update(orderItem);
				return true;
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e.toString());
			}
		}
		return false;
	}

	@Override
	public OrderItemBean select(Integer orderItemId) {
		if (orderItemId!=null && !orderItemId.equals(0)) {
			return session.get(OrderItemBean.class, orderItemId);
		}
		return null;
	}

	@Override
	public boolean delete(Integer orderItemId) {
		if (orderItemId!=null && !orderItemId.equals(0)) {
			OrderItemBean orderItem = session.get(OrderItemBean.class, orderItemId);
			session.delete(orderItem);
			return true;
		}
		return false;
	}

}
