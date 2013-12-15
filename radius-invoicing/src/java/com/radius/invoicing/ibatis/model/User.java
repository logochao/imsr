/**
 * 
 */
package com.radius.invoicing.ibatis.model;

import com.radius.base.BaseEntity;

/**
 * 系统用户表
 * @author Administrator
 * @table "rs_user"
 */
public class User extends BaseEntity{

	/**
	 * 用户编号
	 */
	private String id;
	/**
	 * 用户名
	 */
	private String name;
	/**
	 * 真实名
	 */
	private String realName;
	/**
	 * 密码
	 */
	private String password;
	/**
	 * 手机号
	 */
	private String phone;
	/**
	 * 邮箱
	 */
	private String email;
	/**
	 * 地址
	 */
	private String address;
	/**
	 * 备注
	 */
	private String remark;
	/**
	 * 邮编
	 */
	private String postCode;
	/**
	 * 登录IP
	 */
	private String loginIp;
	/**
	 * 登录时间
	 */
	private String lastLoginTime;
	
	/**
	 * 创建时间
	 */
	private String createTime;
	/**
	 * 创建人
	 */
	private String creater;
	
	
	
	
	public User(String id, String name, String realName, String password, String phone, String email, String address, String remark, String postCode, String loginIp, String lastLoginTime, String createTime, String creater) {
		this.id = id;
		this.name = name;
		this.realName = realName;
		this.password = password;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.remark = remark;
		this.postCode = postCode;
		this.loginIp = loginIp;
		this.lastLoginTime = lastLoginTime;
		this.createTime = createTime;
		this.creater = creater;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCreater() {
		return creater;
	}
	public void setCreater(String creater) {
		this.creater = creater;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLastLoginTime() {
		return lastLoginTime;
	}
	public void setLastLoginTime(String lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	public String getLoginIp() {
		return loginIp;
	}
	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
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
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
	
}
