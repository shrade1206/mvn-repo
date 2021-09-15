package com.fendihotpot.malapot.domain;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

@Entity
@Table(name="ORDER_LIST")
public class OrderListBean {
	@Id
	@Column(name="ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(name="USER_MOBILE")
	private String userMobile;
	@Column(name="USER_EMAIL")
	private String userEmail;
	@Column(name="TAKEOUT_STORE")
	private String takeoutStore;
	@Column(name="ORDER_DATE")
	private Date orderDate;
	@Column(name="TOTAL_AMOUNT")
	private Integer totalAmount;
	@OneToMany(mappedBy = "orderList", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@OrderBy(value="id asc")
	private Set<OrderItemBean> orderItems;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserMobile() {
		return userMobile;
	}
	public void setUserMobile(String userMobile) {
		this.userMobile = userMobile;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getTakeoutStore() {
		return takeoutStore;
	}
	public void setTakeoutStore(String takeoutStore) {
		this.takeoutStore = takeoutStore;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public Integer getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(Integer totalAmount) {
		this.totalAmount = totalAmount;
	}
	public Set<OrderItemBean> getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(Set<OrderItemBean> orderItems) {
		this.orderItems = orderItems;
	}
	@Override
	public String toString() {
		return "OrderListBean [id=" + id + ", userMobile=" + userMobile + ", userEmail=" + userEmail + ", takeoutStore="
				+ takeoutStore + ", orderDate=" + orderDate + ", totalAmount=" + totalAmount + ", orderItems="
				+ orderItems + "]";
	}


	
}
