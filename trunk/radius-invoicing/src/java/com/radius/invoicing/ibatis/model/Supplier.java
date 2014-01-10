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

	private String id="";//供应商编号
	private String name="";//供应商名称
	private String shortName="";//供应商简称
	private String  nature="";//公司性质
	private String deliveryType="";//送货方式
	private Integer payType=null;//支付方式
	private String marketZone="";//市场区域
	private String  deliveryAddress="";//送货地址
	private String linkMan="";//联系人
	private String contactInfo="";//联系方式
	private String tel1="";//电话1
	private String tel2="";//电话2
	private String tel3="";//电话3
	private String fax1="";//传真1
	private String fax2="";//传真2
	private String fax3="";//传真3
	private Integer paymentedType=null;//结帐方式
	private String supplierNotes="";//
	private String purchaser="";//采购员
	private String officeAddress="";//办公地址
	private YesOrNoEnums yesOrNo=null;//是否送货
	//private String delivery_or_not;//是否送货
	private String postCode="";//邮编
	private String bankAccNo="";//银行帐号
	private String taxNo="";//税号
	private String url="";//网站
	private String email="";//电子邮箱
	private String ledgerId="";//账套编号
	private String memo="";//备注
	
	
	
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
	public String getDeliveryAddress() {
		return deliveryAddress;
	}
	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLinkMan() {
		return linkMan;
	}
	public void setLinkMan(String linkMan) {
		this.linkMan = linkMan;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNature() {
		return nature;
	}
	public void setNature(String nature) {
		this.nature = nature;
	}
	public String getOfficeAddress() {
		return officeAddress;
	}
	public void setOfficeAddress(String officeAddress) {
		this.officeAddress = officeAddress;
	}
	public Integer getPaymentedType() {
		return paymentedType;
	}
	public void setPaymentedType(Integer paymentedType) {
		this.paymentedType = paymentedType;
	}
	public Integer getPayType() {
		return payType;
	}
	public void setPayType(Integer payType) {
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
	public String getSupplierNotes() {
		return supplierNotes;
	}
	public void setSupplierNotes(String supplierNotes) {
		this.supplierNotes = supplierNotes;
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
	public YesOrNoEnums getYesOrNo() {
		return yesOrNo;
	}
	public void setYesOrNo(YesOrNoEnums yesOrNo) {
		this.yesOrNo = yesOrNo;
	}
	public String getLedgerId() {
		return ledgerId;
	}
	public void setLedgerId(String ledgerId) {
		this.ledgerId = ledgerId;
	}

	
	
}
