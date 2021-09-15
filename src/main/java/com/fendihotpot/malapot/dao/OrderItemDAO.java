package com.fendihotpot.malapot.dao;

import com.fendihotpot.malapot.domain.OrderItemBean;

public interface OrderItemDAO {
	// 新增訂單品項
	public abstract boolean insert(OrderItemBean orderItem);
	// 修改訂單品項，主要應該是修改數量
	public abstract boolean update(OrderItemBean orderItem);
	// 查詢訂單詳細品項內容
	public abstract OrderItemBean select(Integer orderItemId);
	// 刪除訂單品項
	public abstract boolean delete(Integer orderItemId);
}
