/**
 * 
 */
package com.radius.invoicing.ibatis.model;

/**
 * ϵͳ�û���
 * @author Administrator
 * @table "rs_user"
 */
public class User {

	/**
	 * �û����
	 */
	private String id;
	/**
	 * �û���
	 */
	private String name;
	/**
	 * ��ʵ��
	 */
	private String realName;
	/**
	 * ����
	 */
	private String password;
	/**
	 * �ֻ���
	 */
	private String phone;
	/**
	 * ����
	 */
	private String email;
	/**
	 * ��ַ
	 */
	private String address;
	/**
	 * ��ע
	 */
	private String remark;
	/**
	 * �ʱ�
	 */
	private String postCode;
	/**
	 * ��¼IP
	 */
	private String loginIp;
	/**
	 * ��¼ʱ��
	 */
	private String lastLoginTime;
	
	/**
	 * ����ʱ��
	 */
	private String createTime;
	/**
	 * ������
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
