/**
 * 
 */
package com.radius.invoicing.ibatis.model;

import com.radius.invoicing.enums.YesOrNoEnums;


/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 客户信息
 */
public class Customer extends ExtInfo{

	private String id="";//客户编号
	private String ab="";//客户简称
	private String name="";//客户名称
	private String address="";//地址
	private String linkMan="";//联系人
	private String contactInfo="";//联系方式（存放手机号）
	private String tel1="";//电话1
	private String tel2="";//电话2
	private String tel3="";//电话3
	private String fax1="";//传真1
	private String fax2="";//传真2
	private String fax3="";//传真3
	private String paymentedType="";//结帐方式
	private String customerIllustrate="";//客户说明
	private String customerProperty="";//客户性质
	private String officeAddress="";//办公地址
	private YesOrNoEnums yesOrNo=null;//是否送货 
	private String postCode="";//邮编
	private String salesMan="";//业务员
	private String payType="";//支付类型
	private String deliveryType="";//送货方式
	private String bankAccNo="";//银行帐号
	private String taxNo="";//税号
	private String url="";//网址
	private String email="";//Email
	private String accountBank="";//开户行
	private String accountName="";//帐户名
	private String accountNo="";//帐号
	private String memo="";//备注
	private String paymentedMan="";//结款人
	private String voucher="";//票据
	private Integer goodsBillsDate=null;//货期
	private Integer orderAmount=null;//起订额
	private String ledgerId="";//账套编号
	
	public String getAb() {
		return ab;
	}
	public void setAb(String ab) {
		this.ab = ab;
	}
	public String getAccountBank() {
		return accountBank;
	}
	public void setAccountBank(String accountBank) {
		this.accountBank = accountBank;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getBankAccNo() {
		return bankAccNo;
	}
	public void setBankAccNo(String bankAccNo) {
		this.bankAccNo = bankAccNo;
	}
	public String getContactInfo() {
		return contactInfo;
	}
	public void setContactInfo(String contactInfo) {
		this.contactInfo = contactInfo;
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
	public String getDeliveryType() {
		return deliveryType;
	}
	public void setDeliveryType(String deliveryType) {
		this.deliveryType = deliveryType;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFax1() {
		return fax1;
	}
	public void setFax1(String fax1) {
		this.fax1 = fax1;
	}
	public String getFax2() {
		return fax2;
	}
	public void setFax2(String fax2) {
		this.fax2 = fax2;
	}
	public String getFax3() {
		return fax3;
	}
	public void setFax3(String fax3) {
		this.fax3 = fax3;
	}
	public Integer getGoodsBillsDate() {
		return goodsBillsDate;
	}
	public void setGoodsBillsDate(Integer goodsBillsDate) {
		this.goodsBillsDate = goodsBillsDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLedgerId() {
		return ledgerId;
	}
	public void setLedgerId(String ledgerId) {
		this.ledgerId = ledgerId;
	}
	public String getLinkMan() {
		return linkMan;
	}
	public void setLinkMan(String linkMan) {
		this.linkMan = linkMan;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOfficeAddress() {
		return officeAddress;
	}
	public void setOfficeAddress(String officeAddress) {
		this.officeAddress = officeAddress;
	}
	public Integer getOrderAmount() {
		return orderAmount;
	}
	public void setOrderAmount(Integer orderAmount) {
		this.orderAmount = orderAmount;
	}
	public String getPaymentedMan() {
		return paymentedMan;
	}
	public void setPaymentedMan(String paymentedMan) {
		this.paymentedMan = paymentedMan;
	}
	public String getPaymentedType() {
		return paymentedType;
	}
	public void setPaymentedType(String paymentedType) {
		this.paymentedType = paymentedType;
	}
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	public String getSalesMan() {
		return salesMan;
	}
	public void setSalesMan(String salesMan) {
		this.salesMan = salesMan;
	}
	public String getTaxNo() {
		return taxNo;
	}
	public void setTaxNo(String taxNo) {
		this.taxNo = taxNo;
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getVoucher() {
		return voucher;
	}
	public void setVoucher(String voucher) {
		this.voucher = voucher;
	}
	public YesOrNoEnums getYesOrNo() {
		return yesOrNo;
	}
	public void setYesOrNo(YesOrNoEnums yesOrNo) {
		this.yesOrNo = yesOrNo;
	}
	
	
	
	
}
