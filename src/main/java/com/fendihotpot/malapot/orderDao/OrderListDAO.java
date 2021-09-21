package com.fendihotpot.malapot.orderDao;

import java.util.List;
import java.util.Map;

import com.fendihotpot.malapot.domain.OrderListBean;

public interface OrderListDAO {
	// 新增訂單
	public abstract Integer insert(OrderListBean orderList);
	// 查詢單筆訂單
	public abstract OrderListBean select(Integer orderId);
	// 查看用戶歷史訂單
	public abstract List<OrderListBean> select(String userId, Integer currentPage, Integer pageSize);
	// 查看所有訂單 => 後台管理 一頁10筆
	public abstract List<OrderListBean> select(Integer currentPage, Integer pageSize);
	// 查看分店所有訂單 => 後台管理 一頁10筆
	public abstract List<OrderListBean> selectByBranch(String branch, Integer currentPage, Integer pageSize);
	// 查詢訂單總比數
	public abstract Integer totalRows();
	// 查詢分店訂單總比數
	public abstract Integer totalRowsByBranch(String branch);
	// 刪除訂單，連同訂單品項一起刪除
	public abstract boolean delect(Integer orderId);
	// 查詢今年與去年 每月份的業績
	public abstract Map<String, List<Map<String, Object>>> selectSales();
	// 查詢各分店 今年與去年 每月份的業績
	public abstract Map<String, List<Map<String, Object>>> selectSalesByBranch(String branch);
	// 查詢各分店 今年的業績
	public abstract List<Object[]> salesForBranches();
}
