package com.radius.invoicing.ibatis.model;

import java.util.Date;

public class PurchaseInquiry extends ExtInfo{

	private String 		purchaseInquiryId="";//采购询价单编号
	private String 		supplierId="";//供应商编号
	private String 		supplierName="";//供应商名称
	private Integer 	cashType;//币种
	private String 		address="";//送货地址'
	private String 		man="";//联系人
	private String 		mobile="";//联系人手机
	private String 		tel="";//联系电话
	private String 		fax="";//联系fax
	private Date 		inquiryDate;//询价日期
	private Date 		latestQuotateDate;//最迟报价日期
	private String 		salesman="";//业务员
	private Integer 	status;//状态
	private String 		memo="";//备注
	private Long 		printTimes;//打印次数
	private Date 		printTime;//最新打印时间
	private String 		printRecord="";//最新打印记录
	
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getCashType() {
		return cashType;
	}
	public void setCashType(Integer cashType) {
		this.cashType = cashType;
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
	public Long getPrintTimes() {
		return printTimes;
	}
	public void setPrintTimes(Long printTimes) {
		this.printTimes = printTimes;
	}
	public String getPurchaseInquiryId() {
		return purchaseInquiryId;
	}
	public void setPurchaseInquiryId(String purchaseInquiryId) {
		this.purchaseInquiryId = purchaseInquiryId;
	}
	public String getSalesman() {
		return salesman;
	}
	public void setSalesman(String salesman) {
		this.salesman = salesman;
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
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
}
