package com.fendihotpot.malapot.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity
@Table(name="INGREDIENTS")
@EntityListeners(AuditingEntityListener.class)
public class I9sBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ID")
	private Integer i9sId;
	
	@Column(name="NAME")
	private String i9sName;
	
	@Column(name="UNIT")
	private String unit;
	
	@Column(name="KCAL")
	private Integer kcal;
	
	@Column(name="PRICE")
	private Integer i9sPrice;
	
	@Column(name="TYPE_ID")
	private Integer i9sType;
	
	@Column(name="PICTURE")
	private String i9sPicture;

	public Integer getI9sId() {
		return i9sId;
	}

	public void setI9sId(Integer i9sId) {
		this.i9sId = i9sId;
	}

	public String getI9sName() {
		return i9sName;
	}

	public void setI9sName(String i9sName) {
		this.i9sName = i9sName;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public Integer getKcal() {
		return kcal;
	}

	public void setKcal(Integer kcal) {
		this.kcal = kcal;
	}

	public Integer getI9sPrice() {
		return i9sPrice;
	}

	public void setI9sPrice(Integer i9sPrice) {
		this.i9sPrice = i9sPrice;
	}

	public Integer getI9sType() {
		return i9sType;
	}

	public void setI9sType(Integer i9sType) {
		this.i9sType = i9sType;
	}

	public String getI9sPicture() {
		return i9sPicture;
	}

	public void setI9sPicture(String i9sPicture) {
		this.i9sPicture = i9sPicture;
	}

	@Override
	public String toString() {
		return "I9sBean [i9sId=" + i9sId + ", i9sName=" + i9sName + ", unit=" + unit + ", kcal=" + kcal + ", i9sPrice="
				+ i9sPrice + ", i9sType=" + i9sType + ", i9sPicture=" + i9sPicture + "]";
	}
	
}
