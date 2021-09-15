package com.fendihotpot.malapot.domain;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

@Entity
@Table(name="SET_MEAL")
public class SetMealBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ID")
	private Integer id;
	@Column(name="NAME")
	private String name;
	@Column(name="PRICE")
	private Integer price;
	@Column(name="TYPE_ID")
	private Integer type;
	@Column(name="PICTURE")
	private String picture;
	
	@ManyToMany(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},
			fetch = FetchType.LAZY)
	@JoinTable(
			name="SET_ITEM",
			joinColumns = @JoinColumn(name="MEAL_ID"), 
			inverseJoinColumns = @JoinColumn(name="I9S_ID")
	)
	
	@OrderBy(value="i9sId asc")
	private Set<I9sBean> i9sBeans;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public Set<I9sBean> getI9sBeans() {
		return i9sBeans;
	}

	public void setI9sBeans(Set<I9sBean> i9sBeans) {
		this.i9sBeans = i9sBeans;
	}

	@Override
	public String toString() {
		return "SetMealBean [id=" + id + ", name=" + name + ", price=" + price + ", type=" + type + ", picture="
				+ picture + "]";
	}

}
