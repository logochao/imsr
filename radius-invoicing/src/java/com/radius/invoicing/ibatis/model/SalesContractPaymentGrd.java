/**
 * 
 */
package com.radius.invoicing.ibatis.model;

import java.util.Date;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 销售合同_付款_明细
 */
public class SalesContractPaymentGrd extends ExtInfo{

	private Integer  id=null;//款项编号
	private String  name="";//款项名称
	private String  contractId="";//合同编号
	private String  batch="";//款项批次
	private Integer  amount=null;//金额
	private String  upperAmount="";//大写金额
	private String  receiveType="";//收付款类型
	private Date  	validityDate=null;//款项期限
	private String  stats="";//状态
	private String  memo="";//备注
	private String  ledgerId="";//账套编号
	
	
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public String getBatch() {
		return batch;
	}
	public void setBatch(String batch) {
		this.batch = batch;
	}
	public String getContractId() {
		return contractId;
	}
	public void setContractId(String contractId) {
		this.contractId = contractId;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getLedgerId() {
		return ledgerId;
	}
	public void setLedgerId(String ledgerId) {
		this.ledgerId = ledgerId;
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
	public String getReceiveType() {
		return receiveType;
	}
	public void setReceiveType(String receiveType) {
		this.receiveType = receiveType;
	}
	public String getStats() {
		return stats;
	}
	public void setStats(String stats) {
		this.stats = stats;
	}
	public String getUpperAmount() {
		return upperAmount;
	}
	public void setUpperAmount(String upperAmount) {
		this.upperAmount = upperAmount;
	}
	public Date getValidityDate() {
		return validityDate;
	}
	public void setValidityDate(Date validityDate) {
		this.validityDate = validityDate;
	}
	
	
}
