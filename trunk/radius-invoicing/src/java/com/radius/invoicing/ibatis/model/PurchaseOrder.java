package com.radius.invoicing.ibatis.model;

import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.radius.base.utils.JsonDateSerializer;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 采购订单
 */
public class PurchaseOrder extends ExtInfo {

	private String 	purchaseOrderId="";//采购订货单编号
	private String 	supplierId="";//供货商编号
	private String 	supplierName="";//供货商名称
	private String 	linkMan="";//联系人
	private String 	mobile="";//联系人手机
	private String 	tel="";//电话
	private String 	fax="";//fax
	private String 	salesOrderId="";//销售订货单编号
	private Integer totalAmont;//订货金额
	private Date   	orderedDate;//订货日期
	private Date   	deliveryDate;//送货日期
	private String  deliveryPoint="";//送货地址
	private String 	terms="";//条款
	private String  memo="";//备注
	private String 	status="";//状态
	private Integer consolidatedFlg;//合单标识
	private String 	consolidatedPurchaseOrderId="";//合单后订单号
	private Integer printTimes;//打印次数
	private Date    printTime;//最新打印时间
	private String  printAcc="";//最新打印帐号
	private String  printRecord="";//最新打印记录
	private String 	purchaser="";//采购员
	public Integer getConsolidatedFlg() {
		return consolidatedFlg;
	}
	public void setConsolidatedFlg(Integer consolidatedFlg) {
		this.consolidatedFlg = consolidatedFlg;
	}
	public String getConsolidatedPurchaseOrderId() {
		return consolidatedPurchaseOrderId;
	}
	public void setConsolidatedPurchaseOrderId(String consolidatedPurchaseOrderId) {
		this.consolidatedPurchaseOrderId = consolidatedPurchaseOrderId;
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
	@JsonSerialize(using=JsonDateSerializer.class)
	public Date getOrderedDate() {
		return orderedDate;
	}
	public void setOrderedDate(Date orderedDate) {
		this.orderedDate = orderedDate;
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
	public String getPurchaser() {
		return purchaser;
	}
	public void setPurchaser(String purchaser) {
		this.purchaser = purchaser;
	}
	public String getSalesOrderId() {
		return salesOrderId;
	}
	public void setSalesOrderId(String salesOrderId) {
		this.salesOrderId = salesOrderId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
	public Integer getTotalAmont() {
		return totalAmont;
	}
	public void setTotalAmont(Integer totalAmont) {
		this.totalAmont = totalAmont;
	}
	public String getDeliveryPoint() {
		return deliveryPoint;
	}
	public void setDeliveryPoint(String deliveryPoint) {
		this.deliveryPoint = deliveryPoint;
	}
}
