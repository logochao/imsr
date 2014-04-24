package com.radius.invoicing.ibatis.model;

import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.radius.base.utils.JsonDateSerializer;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 销售订单
 */
public class SalesOrder extends ExtInfo{
	
	
	   private String  	salesOrderId="";//销售订货单编号
	   private String  	customerId="";//客户编号
	   private String  	customerName="";//客户名称
	   private String  	linkMan="";//联系人
	   private String  	mobile="";//联系人手机
	   private String  	tel="";//电话
	   private String  	fax="";//fax
	   private String  	contractId="";//合同编号
	   private Integer  totalAmount=null;//总金额
	   private String   upperAmount="";//大写金额
	   private Date  	orderedDate=null;//订货日期
	   private Date  	deliveryDate=null;//送货日期
	   private String  	deliveryAddress="";//送货地址
	   private String  	terms="";//条款
	   private String 	memo="";//备注
	   private String  	status="";//状态
	   private Integer 	splitedFlg=null;;//拆单标识
	   private String  	spliteSalesOrderId="";//拆分前的订单号
	   private Integer  printTimes=null;//打印次数
	   private Date  	newestPrintTime=null;//最新打印时间
	   private String  	newestPrintAcc="";//最新打印帐号
	   private String  	newestPrintRecord="";//最新打印记录
	   private String  	salesManId="";//销售人员//业务员
	   
		public String getContractId() {
			return contractId;
		}
		public void setContractId(String contractId) {
			this.contractId = contractId;
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
		public String getDeliveryAddress() {
			return deliveryAddress;
		}
		public void setDeliveryAddress(String deliveryAddress) {
			this.deliveryAddress = deliveryAddress;
		}
		@JsonSerialize(using=JsonDateSerializer.class) 
		public Date getDeliveryDate() {
			return deliveryDate;
		}
		public void setDeliveryDate(Date deliveryDate) {
			this.deliveryDate = deliveryDate;
		}
		public String getFax() {
			return fax;
		}
		public void setFax(String fax) {
			this.fax = fax;
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
		public String getMobile() {
			return mobile;
		}
		public void setMobile(String mobile) {
			this.mobile = mobile;
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
		@JsonSerialize(using=JsonDateSerializer.class) 
		public Date getNewestPrintTime() {
			return newestPrintTime;
		}
		public void setNewestPrintTime(Date newestPrintTime) {
			this.newestPrintTime = newestPrintTime;
		}
		@JsonSerialize(using=JsonDateSerializer.class) 
		public Date getOrderedDate() {
			return orderedDate;
		}
		public void setOrderedDate(Date orderedDate) {
			this.orderedDate = orderedDate;
		}
		public Integer getPrintTimes() {
			return printTimes;
		}
		public void setPrintTimes(Integer printTimes) {
			this.printTimes = printTimes;
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
		public Integer getSplitedFlg() {
			return splitedFlg;
		}
		public void setSplitedFlg(Integer splitedFlg) {
			this.splitedFlg = splitedFlg;
		}
		public String getSpliteSalesOrderId() {
			return spliteSalesOrderId;
		}
		public void setSpliteSalesOrderId(String spliteSalesOrderId) {
			this.spliteSalesOrderId = spliteSalesOrderId;
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
		public String getUpperAmount() {
			return upperAmount;
		}
		public void setUpperAmount(String upperAmount) {
			this.upperAmount = upperAmount;
		}
	   
}
