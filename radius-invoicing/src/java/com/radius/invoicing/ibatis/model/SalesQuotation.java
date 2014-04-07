/**
 * 
 */
package com.radius.invoicing.ibatis.model;

import java.util.Date;


/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 销售报价
 */
public class SalesQuotation extends ExtInfo{

	private String 		salesQuotationId ;//销售询价单编号
	private String 		customerId;//客户编号
	private String 		customerAb;//客户简称
	private String 		cashType;//币种
	private String 		address;//送货地址
	private String 		man;//联系人
	private String 		mobile;//联系人手机
	private String 		tel;//联系电话
	private String 		fax;//联系fax
	private Date 		inquiryDate;//询价日期
	private Date 		latestQuotateDate;//最迟报价日期
	private String 		salesman;//业务员
	private String      status;//状态
	private String 		auditedStatus;//审批状态
	private String 		memo;//备注
	private Integer 	printTimes;//打印次数
	private Date 		printTime;//最新打印时间
	private String 		printRecord;//最新打印记录
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAuditedStatus() {
		return auditedStatus;
	}
	public void setAuditedStatus(String auditedStatus) {
		this.auditedStatus = auditedStatus;
	}
	public String getCashType() {
		return cashType;
	}
	public void setCashType(String cashType) {
		this.cashType = cashType;
	}
	public String getCustomerAb() {
		return customerAb;
	}
	public void setCustomerAb(String customerAb) {
		this.customerAb = customerAb;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public Date getInquiryDate() {
		return inquiryDate;
	}
	public void setInquiryDate(Date inquiryDate) {
		this.inquiryDate = inquiryDate;
	}
	public Date getLatestQuotateDate() {
		return latestQuotateDate;
	}
	public void setLatestQuotateDate(Date latestQuotateDate) {
		this.latestQuotateDate = latestQuotateDate;
	}
	public String getMan() {
		return man;
	}
	public void setMan(String man) {
		this.man = man;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getPrintRecord() {
		return printRecord;
	}
	public void setPrintRecord(String printRecord) {
		this.printRecord = printRecord;
	}
	public Date getPrintTime() {
		return printTime;
	}
	public void setPrintTime(Date printTime) {
		this.printTime = printTime;
	}
	public Integer getPrintTimes() {
		return printTimes;
	}
	public void setPrintTimes(Integer printTimes) {
		this.printTimes = printTimes;
	}
	public String getSalesman() {
		return salesman;
	}
	public void setSalesman(String salesman) {
		this.salesman = salesman;
	}
	public String getSalesQuotationId() {
		return salesQuotationId;
	}
	public void setSalesQuotationId(String salesQuotationId) {
		this.salesQuotationId = salesQuotationId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
	
	
}
