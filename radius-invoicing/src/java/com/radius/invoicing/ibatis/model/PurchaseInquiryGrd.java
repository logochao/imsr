package com.radius.invoicing.ibatis.model;
/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 采购询价商品列表
 */
public class PurchaseInquiryGrd extends ExtInfo {
	private String  purchaseInquiryId="";//采购询价单号
	private String	goodsId="";//商品编号
	private String	goodsName="";//商品名称
	private Integer	specId;//规格编码
	private Integer	unit;//单位(规格)
	private Integer	quantityUnit;//数量
	private Integer	quantityEuPerUnit;//包装单位折合数量
	private String	status;//状态
	private String	memo="";//备注
	
	public PurchaseInquiryGrd() {
	}
	
	public PurchaseInquiryGrd(String purchaseInquiryId, String goodsId) {
		super();
		this.purchaseInquiryId = purchaseInquiryId;
		this.goodsId = goodsId;
	}
	public String getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getPurchaseInquiryId() {
		return purchaseInquiryId;
	}
	public void setPurchaseInquiryId(String purchaseInquiryId) {
		this.purchaseInquiryId = purchaseInquiryId;
	}
	public Integer getQuantityEuPerUnit() {
		return quantityEuPerUnit;
	}
	public void setQuantityEuPerUnit(Integer quantityEuPerUnit) {
		this.quantityEuPerUnit = quantityEuPerUnit;
	}
	public Integer getQuantityUnit() {
		return quantityUnit;
	}
	public void setQuantityUnit(Integer quantityUnit) {
		this.quantityUnit = quantityUnit;
	}
	public Integer getSpecId() {
		return specId;
	}
	public void setSpecId(Integer specId) {
		this.specId = specId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Integer getUnit() {
		return unit;
	}
	public void setUnit(Integer unit) {
		this.unit = unit;
	}
}
