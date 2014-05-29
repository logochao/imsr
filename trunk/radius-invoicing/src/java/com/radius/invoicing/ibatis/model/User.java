/**
 * 
 */
package com.radius.invoicing.ibatis.model;

import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.radius.base.BaseEntity;
import com.radius.base.utils.JsonDateSerializer;

/**
 * 系统用户表
 * @author Administrator
 * @table "rs_user"
 */
public class User extends BaseEntity{

	private   Integer    id;//编号(自增列主键)
	private   String     userId;//用户编号 不能出现重复类似主键的功能，必须检查是否存在相关
	private   String     loginAcc;//登陆名
	private   String     password;//密码
	private   String     staffId;//员工编号
	private   String     userDescription;//用户说明
	private   Integer    accountStatus;//帐号状态
	private   String     memo;//描述
	private   String     loginIp;//登录IP
	
	private   Date     	 lastLoginTime;//最近登录时间
	
	
	public Integer getAccountStatus() {
		return accountStatus;
	}
	public void setAccountStatus(Integer accountStatus) {
		this.accountStatus = accountStatus;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@JsonSerialize(using=JsonDateSerializer.class)
	public Date getLastLoginTime() {
		return lastLoginTime;
	}
	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	public String getLoginAcc() {
		return loginAcc;
	}
	public void setLoginAcc(String loginAcc) {
		this.loginAcc = loginAcc;
	}
	public String getLoginIp() {
		return loginIp;
	}
	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getStaffId() {
		return staffId;
	}
	public void setStaffId(String staffId) {
		this.staffId = staffId;
	}
	public String getUserDescription() {
		return userDescription;
	}
	public void setUserDescription(String userDescription) {
		this.userDescription = userDescription;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
}
