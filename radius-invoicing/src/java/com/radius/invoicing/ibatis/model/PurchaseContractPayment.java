/**
 * 
 */
package com.radius.invoicing.ibatis.model;
/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 采购合同_付款
 */
public class PurchaseContractPayment extends ExtInfo{

	private String   contractId;//合同编号
	private String   cashType;//币种	
	private Integer  totalAmount;//合同总金额
	private String   upperAmount;//大写金额
	private String   paymentType;//付款方式
	private String   auditedStatus;//审批状态
	
	private String   status ;//状态

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

	public String getContractId() {
		return contractId;
	}

	public void setContractId(String contractId) {
		this.contractId = contractId;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(Integer totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getUpperAmount() {
		return upperAmount;
	}

	public void setUpperAmount(String upperAmount) {
		this.upperAmount = upperAmount;
	}
	
	
	
	
}
