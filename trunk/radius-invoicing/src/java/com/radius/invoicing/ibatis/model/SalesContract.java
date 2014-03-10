/**
 * 
 */
package com.radius.invoicing.ibatis.model;

import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.radius.base.utils.JsonDateSerializer;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 销售合同
 */
public class SalesContract extends ExtInfo{

	private String   id="";//合同编号
	private String   customerId="";//客户编号
	private String   customerName="";//客户名称
	private String   contractFile="";//合同文件编号
	private Date     effectDate=null;//生效日期
	private Date     signTime=null;//签署日期
	private String   tradeAssistant="";//营业员
	private String   salesMan="";//业务员
	private String   man="";//联系人
	private String   mobile="";//联系人手机
	private String   tel="";//联系电话
	private String   fax="";//联系fax
	private Date	 orderedDate=null;//订货日期
	private Date     deliveryDate=null;//送货日期
	private String   deliveryPoint="";//送货地点
	private String   contractTerms="";//合同条款
	private Date     printTime=null;//最新打印时间
	private String   printAcc="";//最新打印帐号
	private String   printreCord="";//最新打印记录
	private String   paymentedStatus="";//结帐状态
	private Date     validityDate=null;//有效期至
	private String   stats="";//状态
	private Integer  printTimes=null;//打印次数
	private String   memo="";//合同备注
	private String   ledgerId="";//账套编号
	
	//合同金额
	private Integer totalAmount=0;//合同总金额 
	//合同大写金额
	private String upperAmount="";//大小金额
	
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
	@JsonSerialize(using=JsonDateSerializer.class) 
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
	@JsonSerialize(using=JsonDateSerializer.class) 
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