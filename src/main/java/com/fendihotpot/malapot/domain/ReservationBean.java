package com.fendihotpot.malapot.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "RESERVATION")
public class ReservationBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Integer rId;
	@Column(name = "UID")
	private String uid;
	@Column(name = "PEOPLE")
	private Integer people;
	@Column(name = "DATE")
	private String date;
	@Column(name = "TIME")
	private String time;
	@Column(name = "BRENCH")
	private String brench;
	@Column(name = "RNAME")
	private String rName;
	@Column(name = "EMAIL")
	private String email;
	@Column(name = "MOBLIE")
	private String mobile;

	@Override
	public String toString() {
		return "ReservationBean [rId=" + rId + ", uid=" + uid + ", people=" + people + ", date=" + date + ", time="
				+ time + ", brench=" + brench + ", rName=" + rName + ", email=" + email + ", mobile=" + mobile + "]";
	}

	/**
	 * @return the rId
	 */
	public Integer getrId() {
		return rId;
	}

	/**
	 * @param rId the rId to set
	 */
	public void setrId(Integer rId) {
		this.rId = rId;
	}

	/**
	 * @return the uid
	 */
	public String getUid() {
		return uid;
	}

	/**
	 * @param uid the uid to set
	 */
	public void setUid(String uid) {
		this.uid = uid;
	}

	/**
	 * @return the people
	 */
	public Integer getPeople() {
		return people;
	}

	/**
	 * @param people the people to set
	 */
	public void setPeople(Integer people) {
		this.people = people;
	}

	/**
	 * @return the date
	 */
	public String getDate() {
		return date;
	}

	/**
	 * @param date the date to set
	 */
	public void setDate(String date) {
		this.date = date;
	}

	/**
	 * @return the time
	 */
	public String getTime() {
		return time;
	}

	/**
	 * @param time the time to set
	 */
	public void setTime(String time) {
		this.time = time;
	}

	/**
	 * @return the brench
	 */
	public String getBrench() {
		return brench;
	}

	/**
	 * @param brench the brench to set
	 */
	public void setBrench(String brench) {
		this.brench = brench;
	}

	/**
	 * @return the rName
	 */
	public String getrName() {
		return rName;
	}

	/**
	 * @param rName the rName to set
	 */
	public void setrName(String rName) {
		this.rName = rName;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the mobile
	 */
	public String getMobile() {
		return mobile;
	}

	/**
	 * @param mobile the mobile to set
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

}
