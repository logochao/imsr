/**
 * 
 */
package com.radius.invoicing.ibatis.model;

import java.util.Date;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 销售合同
 */
public class SalesContract extends ExtInfo{

	private String   id;
	private String   customerId;
	private String   customerName;
	private String   contractFile;
	private Date     effectDate;
	private Date     signTime;
	private String   tradeAssistant;
	private String   salesMan;
	private String   man;
	private String   mobile;
	private String   tel;
	private String   fax;
	private Date	 orderedDate;
	private Date     deliveryDate;
	private String   deliveryPoint;
	private String   contractTerms;
	private Date     printTime;
	private String   printAcc;
	private String   printreCord;
	private String   paymentedStatus;
	private Date     validityDate;
	private String   stats;
	private Integer  printTimes;
	private String   memo;
	private String   ledgerId;
	
	
	public String getContractFile() {
		return contractFile;
	}
	public void setContractFile(String contractFile) {
		this.contractFile = contractFile;
	}
	public String getContractTerms() {
		return contractTerms;
	}
	public void setContractTerms(String contractTerms) {
		this.contractTerms = contractTerms;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public Date getDeliveryDate() {
		return deliveryDate;
	}
	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
	}
	public String getDeliveryPoint() {
		return deliveryPoint;
	}
	public void setDeliveryPoint(String deliveryPoint) {
		this.deliveryPoint = deliveryPoint;
	}
	public Date getEffectDate() {
		return effectDate;
	}
	public void setEffectDate(Date effectDate) {
		this.effectDate = effectDate;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
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
	public Date getOrderedDate() {
		return orderedDate;
	}
	public void setOrderedDate(Date orderedDate) {
		this.orderedDate = orderedDate;
	}
	public String getPaymentedStatus() {
		return paymentedStatus;
	}
	public void setPaymentedStatus(String paymentedStatus) {
		this.paymentedStatus = paymentedStatus;
	}
	public String getPrintAcc() {
		return printAcc;
	}
	public void setPrintAcc(String printAcc) {
		this.printAcc = printAcc;
	}
	public String getPrintreCord() {
		return printreCord;
	}
	public void setPrintreCord(String printreCord) {
		this.printreCord = printreCord;
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
	public String getSalesMan() {
		return salesMan;
	}
	public void setSalesMan(String salesMan) {
		this.salesMan = salesMan;
	}
	public Date getSignTime() {
		return signTime;
	}
	public void setSignTime(Date signTime) {
		this.signTime = signTime;
	}
	public String getStats() {
		return stats;
	}
	public void setStats(String stats) {
		this.stats = stats;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getTradeAssistant() {
		return tradeAssistant;
	}
	public void setTradeAssistant(String tradeAssistant) {
		this.tradeAssistant = tradeAssistant;
	}
	public Date getValidityDate() {
		return validityDate;
	}
	public void setValidityDate(Date validityDate) {
		this.validityDate = validityDate;
	}
	
	
	
}
