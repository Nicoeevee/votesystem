package com.yanzhen.entity;

import com.yanzhen.utils.Entity;

import java.util.Date;


public class Admin extends Entity {

	//管理员
	public static Integer TYPE_ADMIN = 0;
	//注册用户
	public static Integer TYPE_REG = 1;

	/**
	 * 
	 */
	private String account;
	/**
	 * 
	 */
	private Integer id;
	/**
	 * 
	 */
	private String name;
	/**
	 * 
	 */
	private String password;
	/**
	 * 
	 */
	private String phone;
	/**
	 * 
	 */
	private String remark;

	private Date now;

	private Integer type;

	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getNow() {
		return now;
	}

	public void setNow(Date now) {
		this.now = now;
	}


	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
}