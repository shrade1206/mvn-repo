package com.fendihotpot.malapot.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="ORDER_ITEM")
public class OrderItemBean {
	@Id
	@Column(name="ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(name="ORDER_ID")
	private Integer orderId;
	@Column(name="ITEM_ID")
	private Integer itemId;
	@Column(name="SET_ID")
	private Integer setId;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(
			name = "ORDER_ID",
			referencedColumnName = "ID",
			insertable = false,
			updatable = false
			)
	private OrderListBean orderList;
	@Column(name="ORDER_QTY")
	private Integer orderQty;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(
			name="ITEM_ID",
			referencedColumnName = "ID",
			insertable = false,
			updatable = false
			)
	private I9sBean i9sBean;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(
			name="SET_ID",
			referencedColumnName = "ID",
			insertable = false,
			updatable = false
			)
	private SetMealBean setMealBeans;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public Integer getItemId() {
		return itemId;
	}
	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}
	public Integer getSetId() {
		return setId;
	}
	public void setSetId(Integer setId) {
		this.setId = setId;
	}
	public OrderListBean getOrderList() {
		return orderList;
	}
	public void setOrderList(OrderListBean orderList) {
		this.orderList = orderList;
	}
	public Integer getOrderQty() {
		return orderQty;
	}
	public void setOrderQty(Integer orderQty) {
		this.orderQty = orderQty;
	}
	public I9sBean getI9sBean() {
		return i9sBean;
	}
	public void setI9sBean(I9sBean i9sBean) {
		this.i9sBean = i9sBean;
	}
	public SetMealBean getSetMealBeans() {
		return setMealBeans;
	}
	public void setSetMealBeans(SetMealBean setMealBeans) {
		this.setMealBeans = setMealBeans;
	}
	@Override
	public String toString() {
		return "OrderItemBean [id=" + id + ", orderId=" + orderId + ", itemId=" + itemId + ", setId=" + setId
				+ ", orderQty=" + orderQty + "]";
	}
	
}
