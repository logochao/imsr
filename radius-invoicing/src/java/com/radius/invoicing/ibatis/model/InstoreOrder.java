package com.radius.invoicing.ibatis.model;

import java.util.Date;


/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 列表_入库_货品 
 */
public class InstoreOrder extends ExtInfo {
	
	private String 		instoreId="";// 入库单号        
	private Date  		instoreDate;//入库日期       
	private Integer 	status;//状态             
	private Integer 	instoreType;//入库类型       
	private String 		instoreObject="";  //入库对象  
	private String 		warehouseAdmin=""; //库管员  
	private String 		certificateNo=""; //凭证单号   
	private String 		certificateType=""; //凭证类型 
	private String 		batchId=""; //批号        
	private String 		operator2=""; //经办人       
	private String 		purchaseOrderId ="";//采购订货单编号
	private String 		supplierId="";//供应商编号       
	private String 		supplierName=""; // 供应商名称  
	private Integer 	price;//单价            
	private Integer 	amount;//金额             
	private Integer 	printTimes;//打印次数        
	private Date		printTime;// 最新打印时间 
	private String 		printAcc ="";//最新打印帐号 
	private String 		printRecord="";//最新打印记录
	private String 		memo="";//备注      
	
	
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public String getBatchId() {
		return batchId;
	}
	public void setBatchId(String batchId) {
		this.batchId = batchId;
	}
	public String getCertificateNo() {
		return certificateNo;
	}
	public void setCertificateNo(String certificateNo) {
		this.certificateNo = certificateNo;
	}
	public String getCertificateType() {
		return certificateType;
	}
	public void setCertificateType(String certificateType) {
		this.certificateType = certificateType;
	}
	public Date getInstoreDate() {
		return instoreDate;
	}
	public void setInstoreDate(Date instoreDate) {
		this.instoreDate = instoreDate;
	}
	public String getInstoreId() {
		return instoreId;
	}
	public void setInstoreId(String instoreId) {
		this.instoreId = instoreId;
	}
	public String getInstoreObject() {
		return instoreObject;
	}
	public void setInstoreObject(String instoreObject) {
		this.instoreObject = instoreObject;
	}
	public Integer getInstoreType() {
		return instoreType;
	}
	public void setInstoreType(Integer instoreType) {
		this.instoreType = instoreType;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getOperator2() {
		return operator2;
	}
	public void setOperator2(String operator2) {
		this.operator2 = operator2;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
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
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
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
	public String getWarehouseAdmin() {
		return warehouseAdmin;
	}
	public void setWarehouseAdmin(String warehouseAdmin) {
		this.warehouseAdmin = warehouseAdmin;
	}

	
	
}
