/**
 * 
 */
package com.radius.invoicing.ibatis.model;

import com.radius.invoicing.enums.SexEnums;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 联系人信息
 */
public class LinkMan extends ExtInfo{

	private Integer 	id;//联系人编号
	private String 		name;//姓名
	private String  	pinyin;//拼音
	private SexEnums  	sex;//性别
	private String  	numbers;//身份证号码
	private String  	mobile1;//手机1
	private String  	mobile2;//手机
	private String  	mobile3;//手机3
	private String  	tel;//电话号码
	private String 		homeTel;
	private String  	address;//通讯地址
	private String  	qq;
	private String  	email;
	private String 		jobDuty;//职务
	private String  	expertise;//职业专长
	private String 		jobTitle;//职称
	private String  	jobContent;//负责工作内容
	private String  	hobbies;//兴趣爱好
	private String  	postCode;//邮编
	private String  	companyId;//任职公司编号
	private String 		companyName;//任职公司名称
	private String  	customerProperty;//公司性质
	private String  	customerIllustrate;//公司说明
	private String  	officeAddress;//办公地址
	private String  	mome;//备注
	private String  	staff;//业务员编号
	
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCompanyId() {
		return companyId;
	}
	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCustomerIllustrate() {
		return customerIllustrate;
	}
	public void setCustomerIllustrate(String customerIllustrate) {
		this.customerIllustrate = customerIllustrate;
	}
	public String getCustomerProperty() {
		return customerProperty;
	}
	public void setCustomerProperty(String customerProperty) {
		this.customerProperty = customerProperty;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getExpertise() {
		return expertise;
	}
	public void setExpertise(String expertise) {
		this.expertise = expertise;
	}
	public String getHobbies() {
		return hobbies;
	}
	public void setHobbies(String hobbies) {
		this.hobbies = hobbies;
	}
	public String getHomeTel() {
		return homeTel;
	}
	public void setHomeTel(String homeTel) {
		this.homeTel = homeTel;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getJobContent() {
		return jobContent;
	}
	public void setJobContent(String jobContent) {
		this.jobContent = jobContent;
	}
	public String getJobDuty() {
		return jobDuty;
	}
	public void setJobDuty(String jobDuty) {
		this.jobDuty = jobDuty;
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	public String getMobile1() {
		return mobile1;
	}
	public void setMobile1(String mobile1) {
		this.mobile1 = mobile1;
	}
	public String getMobile2() {
		return mobile2;
	}
	public void setMobile2(String mobile2) {
		this.mobile2 = mobile2;
	}
	public String getMobile3() {
		return mobile3;
	}
	public void setMobile3(String mobile3) {
		this.mobile3 = mobile3;
	}
	public String getMome() {
		return mome;
	}
	public void setMome(String mome) {
		this.mome = mome;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNumbers() {
		return numbers;
	}
	public void setNumbers(String numbers) {
		this.numbers = numbers;
	}
	public String getOfficeAddress() {
		return officeAddress;
	}
	public void setOfficeAddress(String officeAddress) {
		this.officeAddress = officeAddress;
	}
	public String getPinyin() {
		return pinyin;
	}
	public void setPinyin(String pinyin) {
		this.pinyin = pinyin;
	}
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public SexEnums getSex() {
		return sex;
	}
	public void setSex(SexEnums sex) {
		this.sex = sex;
	}
	public String getStaff() {
		return staff;
	}
	public void setStaff(String staff) {
		this.staff = staff;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
	
	
}
