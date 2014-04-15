/**
 * 
 */
package com.radius.invoicing.ibatis.model;

import com.radius.invoicing.enums.YesOrNoEnums;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 供应商信息
 */
public class Supplier  extends ExtInfo{

	private YesOrNoEnums yesOrNo=null;//是否送货=""
	private String supplierId="";//供应商编号        
	private String shortName="";//供应商简称
	private String supplierName="";//  供应商名称 
	private String linkman="";//  联系人        
	private String contactInfo="";// 联系方式     
	private String tel="";// 电话             
	private String fax="";//  fax           
	private String supplierIllustrate="";//供应商说明
	private String supplierProperty="";//供应商性质
	private String officeAddress="";//办公地址    
	private String postCode="";//邮编       
	private String url="";// 网站             
	private String email="";//    电子邮箱         
	private String marketZone="";//市场区域       
	private String deliveryNot="";//  是否送货
	private String deliveryType="";// 送货方式    
	private String payType="";// 支付方式        
	private String accountBank="";//   开户行  
	private String accountName="";//帐户名      
	private String bankAccno="";// 银行帐号     
	private String taxNo="";//   税号        
	private String voucher="";// 票据类型          
	private Integer goodsBillsdate=null;// 货期
	private Integer minOrderAmount=null;// 起订额
	private String memo="";//   备注        
	private String purchaser="";// 采购员    
	
	
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
	public String getBankAccno() {
		return bankAccno;
	}
	public void setBankAccno(String bankAccno) {
		this.bankAccno = bankAccno;
	}
	public String getContactInfo() {
		return contactInfo;
	}
	public void setContactInfo(String contactInfo) {
		this.contactInfo = contactInfo;
	}
	public String getDeliveryNot() {
		return deliveryNot;
	}
	public void setDeliveryNot(String deliveryNot) {
		this.deliveryNot = deliveryNot;
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
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public Integer getGoodsBillsdate() {
		return goodsBillsdate;
	}
	public void setGoodsBillsdate(Integer goodsBillsdate) {
		this.goodsBillsdate = goodsBillsdate;
	}
	public String getLinkman() {
		return linkman;
	}
	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}
	public String getMarketZone() {
		return marketZone;
	}
	public void setMarketZone(String marketZone) {
		this.marketZone = marketZone;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public Integer getMinOrderAmount() {
		return minOrderAmount;
	}
	public void setMinOrderAmount(Integer minOrderAmount) {
		this.minOrderAmount = minOrderAmount;
	}
	public String getOfficeAddress() {
		return officeAddress;
	}
	public void setOfficeAddress(String officeAddress) {
		this.officeAddress = officeAddress;
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
	public String getPurchaser() {
		return purchaser;
	}
	public void setPurchaser(String purchaser) {
		this.purchaser = purchaser;
	}
	public String getShortName() {
		return shortName;
	}
	public void setShortName(String shortName) {
		this.shortName = shortName;
	}
	public String getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}
	public String getSupplierIllustrate() {
		return supplierIllustrate;
	}
	public void setSupplierIllustrate(String supplierIllustrate) {
		this.supplierIllustrate = supplierIllustrate;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public String getSupplierProperty() {
		return supplierProperty;
	}
	public void setSupplierProperty(String supplierProperty) {
		this.supplierProperty = supplierProperty;
	}
	public String getTaxNo() {
		return taxNo;
	}
	public void setTaxNo(String taxNo) {
		this.taxNo = taxNo;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
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
