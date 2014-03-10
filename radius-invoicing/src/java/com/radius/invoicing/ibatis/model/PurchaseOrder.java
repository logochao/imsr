package com.radius.invoicing.ibatis.model;

import java.util.Date;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 采购订单
 */
public class PurchaseOrder extends ExtInfo {

	private String purchaseOrderId="";//采购订货单编号
	private String purchaseOrderMergerId="";//合并后的订单号
	private String stats="";//状态
	private Date   orderedDate=null;//订货日期
	private Date   deliveryDate=null;//送货日期
	private String supplierId="";//供货商编号
	private String supplierName="";//供货商名称
	private String tel="";//电话
	private String linkMan="";//联系人
	private String purchaser="";//采购员
	private String terms="";//条款
	private String fax="";//fax
	private String customerBillId="";//客户订单号
	private String deliveryPoint="";//送货地点
	private String qualityStatus="";//质检状态
	private String auditStatus="";//审核状态
	private String instoreStatus="";//入库状态
	private String paymentStatus="";//收货状态
	private String paymentedStatus="";//结帐状态
	private String purchaseReceiveOrderId="";//采购收货单编号
	private String instoreId="";//入库单号
	private String goodsQtId="";//商品质检单编号
	private Integer orderedAmount=null;//订货金额
	private Integer printTimes=null;//打印次数
	private Date    printTime=null;//最新打印时间
	private String  printAcc="";//最新打印帐号
	private String  printRecord="";//最新打印记录
	private String  operator="";//操作员
	private String   ledgerId="";//账套编号
	private String   memo="";//备注
	
	
	public String getAuditStatus() {
		return auditStatus;
	}
	public void setAuditStatus(String auditStatus) {
		this.auditStatus = auditStatus;
	}
	public String getCustomerBillId() {
		return customerBillId;
	}
	public void setCustomerBillId(String customerBillId) {
		this.customerBillId = customerBillId;
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
	public String getInstoreId() {
		return instoreId;
	}
	public void setInstoreId(String instoreId) {
		this.instoreId = instoreId;
	}
	public String getInstoreStatus() {
		return instoreStatus;
	}
	public void setInstoreStatus(String instoreStatus) {
		this.instoreStatus = instoreStatus;
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
	public Integer getOrderedAmount() {
		return orderedAmount;
	}
	public void setOrderedAmount(Integer orderedAmount) {
		this.orderedAmount = orderedAmount;
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
	public String getPaymentStatus() {
		return paymentStatus;
	}
	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
	public String getPrintAcc() {
		return printAcc;
	}
	public void setPrintAcc(String printAcc) {
		this.printAcc = printAcc;
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
	public String getPurchaseOrderId() {
		return purchaseOrderId;
	}
	public void setPurchaseOrderId(String purchaseOrderId) {
		this.purchaseOrderId = purchaseOrderId;
	}
	public String getPurchaseOrderMergerId() {
		return purchaseOrderMergerId;
	}
	public void setPurchaseOrderMergerId(String purchaseOrderMergerId) {
		this.purchaseOrderMergerId = purchaseOrderMergerId;
	}
	public String getPurchaser() {
		return purchaser;
	}
	public void setPurchaser(String purchaser) {
		this.purchaser = purchaser;
	}
	public String getPurchaseReceiveOrderId() {
		return purchaseReceiveOrderId;
	}
	public void setPurchaseReceiveOrderId(String purchaseReceiveOrderId) {
		this.purchaseReceiveOrderId = purchaseReceiveOrderId;
	}
	public String getQualityStatus() {
		return qualityStatus;
	}
	public void setQualityStatus(String qualityStatus) {
		this.qualityStatus = qualityStatus;
	}
	public String getStats() {
		return stats;
	}
	public void setStats(String stats) {
		this.stats = stats;
	}
	public String getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
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
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	
	
	
}
