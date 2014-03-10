package com.radius.invoicing.ibatis.model;

import java.util.Date;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 销售订单
 */
public class SalesOrder extends ExtInfo{
	
	
	   private String  salesOrderId="";//销售订货单编号
	   private String  fromSalesOrderId="";//拆分钱的订单号
	   private String  customerId="";//客户编号
	   private String  customerName="";//客户名称
	   private Date  orderedDate=null;//订货日期
	   private Date  deliveryDate=null;//送货日期
	   private String  stats="";//状态
	   private String  tradeAssistant="";//营业员
	   private String  salesManId="";//销售人员
	   private String  fax  ="";//fax
	   private String  deliveryAddress="";//送货地址
	   private String  linkMan="" ;//联系人
	   private String  tel=""    ;//电话
	   private String  customerBillId="" ;//客户订单号
	   private String  deliveryPoint=""  ;//送货地点
	   private String  deliveryStatus="";//送货状态
	   private String  outstoreStatus="";//出库状态
	   private String  paymentedStatus="";//结帐状态
	   private String  deliverOrderId="";//销售送货单编号
	   private String  outstoreOrderId="";//出库单编号
	   private String  goodsQtId="";//商品质检单编号
	   private String  terms=""  ;//条款
	   private Integer  budgetCost=null ;//预算成本
	   private Integer  totalAmount=null;//总金额
	   private Integer  grossMargin=null;//毛利
	   private Integer  totalGoodsAmount=null;//订货总额
	   private String  profitAduit="";//利润审核
	   private Integer  grossMarginProp=null;//毛利率
	   private Integer  budgetGrossMargin=null;//预算毛利
	   private Integer  deliveryAmount=null;//送货总额
	   private Integer  printTimes=null;//打印次数
	   private Date  newestPrintTime=null;//最新打印时间
	   private String  newestPrintAcc="";//最新打印帐号
	   private String  newestPrintRecord="";//最新打印记录
	   private String  auditStatus="";//审核状态
	   private String  memo="";//备注
	   private String  ledgerId="" ;//账套编号
	public String getAuditStatus() {
		return auditStatus;
	}
	public void setAuditStatus(String auditStatus) {
		this.auditStatus = auditStatus;
	}
	public Integer getBudgetCost() {
		return budgetCost;
	}
	public void setBudgetCost(Integer budgetCost) {
		this.budgetCost = budgetCost;
	}
	public Integer getBudgetGrossMargin() {
		return budgetGrossMargin;
	}
	public void setBudgetGrossMargin(Integer budgetGrossMargin) {
		this.budgetGrossMargin = budgetGrossMargin;
	}
	public String getCustomerBillId() {
		return customerBillId;
	}
	public void setCustomerBillId(String customerBillId) {
		this.customerBillId = customerBillId;
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
	public String getDeliverOrderId() {
		return deliverOrderId;
	}
	public void setDeliverOrderId(String deliverOrderId) {
		this.deliverOrderId = deliverOrderId;
	}
	public String getDeliveryAddress() {
		return deliveryAddress;
	}
	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}
	public Integer getDeliveryAmount() {
		return deliveryAmount;
	}
	public void setDeliveryAmount(Integer deliveryAmount) {
		this.deliveryAmount = deliveryAmount;
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
	public String getDeliveryStatus() {
		return deliveryStatus;
	}
	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getGoodsQtId() {
		return goodsQtId;
	}
	public void setGoodsQtId(String goodsQtId) {
		this.goodsQtId = goodsQtId;
	}
	public Integer getGrossMargin() {
		return grossMargin;
	}
	public void setGrossMargin(Integer grossMargin) {
		this.grossMargin = grossMargin;
	}
	public Integer getGrossMarginProp() {
		return grossMarginProp;
	}
	public void setGrossMarginProp(Integer grossMarginProp) {
		this.grossMarginProp = grossMarginProp;
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
	public String getNewestPrintAcc() {
		return newestPrintAcc;
	}
	public void setNewestPrintAcc(String newestPrintAcc) {
		this.newestPrintAcc = newestPrintAcc;
	}
	public String getNewestPrintRecord() {
		return newestPrintRecord;
	}
	public void setNewestPrintRecord(String newestPrintRecord) {
		this.newestPrintRecord = newestPrintRecord;
	}
	public Date getNewestPrintTime() {
		return newestPrintTime;
	}
	public void setNewestPrintTime(Date newestPrintTime) {
		this.newestPrintTime = newestPrintTime;
	}
	public Date getOrderedDate() {
		return orderedDate;
	}
	public void setOrderedDate(Date orderedDate) {
		this.orderedDate = orderedDate;
	}
	public String getOutstoreOrderId() {
		return outstoreOrderId;
	}
	public void setOutstoreOrderId(String outstoreOrderId) {
		this.outstoreOrderId = outstoreOrderId;
	}
	public String getOutstoreStatus() {
		return outstoreStatus;
	}
	public void setOutstoreStatus(String outstoreStatus) {
		this.outstoreStatus = outstoreStatus;
	}
	public String getPaymentedStatus() {
		return paymentedStatus;
	}
	public void setPaymentedStatus(String paymentedStatus) {
		this.paymentedStatus = paymentedStatus;
	}
	public Integer getPrintTimes() {
		return printTimes;
	}
	public void setPrintTimes(Integer printTimes) {
		this.printTimes = printTimes;
	}
	public String getProfitAduit() {
		return profitAduit;
	}
	public void setProfitAduit(String profitAduit) {
		this.profitAduit = profitAduit;
	}
	public String getSalesManId() {
		return salesManId;
	}
	public void setSalesManId(String salesManId) {
		this.salesManId = salesManId;
	}
	public String getSalesOrderId() {
		return salesOrderId;
	}
	public void setSalesOrderId(String salesOrderId) {
		this.salesOrderId = salesOrderId;
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
	public String getTerms() {
		return terms;
	}
	public void setTerms(String terms) {
		this.terms = terms;
	}
	public Integer getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(Integer totalAmount) {
		this.totalAmount = totalAmount;
	}
	public Integer getTotalGoodsAmount() {
		return totalGoodsAmount;
	}
	public void setTotalGoodsAmount(Integer totalGoodsAmount) {
		this.totalGoodsAmount = totalGoodsAmount;
	}
	public String getTradeAssistant() {
		return tradeAssistant;
	}
	public void setTradeAssistant(String tradeAssistant) {
		this.tradeAssistant = tradeAssistant;
	}
	public String getFromSalesOrderId() {
		return fromSalesOrderId;
	}
	public void setFromSalesOrderId(String fromSalesOrderId) {
		this.fromSalesOrderId = fromSalesOrderId;
	}
	   
}
