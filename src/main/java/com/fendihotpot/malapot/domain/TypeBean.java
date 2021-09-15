package com.fendihotpot.malapot.domain;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

@Entity
@Table(name="TYPE")
public class TypeBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ID")
	private Integer id;
	@Column(name="NAME")
	private String name;
	
	@OneToMany
	@JoinColumn(name="TYPE_ID", referencedColumnName="ID")
	@OrderBy(value="i9sId asc")
	private Set<I9sBean> i9sBeans;
	
	@OneToMany
	@JoinColumn(name="TYPE_ID", referencedColumnName="ID")
	@OrderBy(value="id asc")
	private Set<SetMealBean> setMealBeans;

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

	public Set<I9sBean> getI9sBeans() {
		return i9sBeans;
	}

	public void setI9sBeans(Set<I9sBean> i9sBeans) {
		this.i9sBeans = i9sBeans;
	}

	@Override
	public String toString() {
		return "TypeBean [id=" + id + ", name=" + name + "]";
	}

	public Set<SetMealBean> getSetMealBeans() {
		return setMealBeans;
	}

	public void setSetMealBeans(Set<SetMealBean> setMealBeans) {
		this.setMealBeans = setMealBeans;
	}
	
}
