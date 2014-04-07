/**
 * 
 */
package com.radius.invoicing.ibatis.model;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 采购订单列表
 */
public class PurchaseOrderGrd extends ExtInfo {

	private String  purchaseOrderId="";//采购订货单编号
	private String  goodsId="";//商品编号
	private String  goodsName="";//商品名称
	private Integer specId;//规格编码
	private String  unit;//包装单位(规格)
	private Integer priceUnit;//包装单位单价
	private String  equivalentUnit;//折合单位
	private Integer priceEu;//折合单位单价
	private Integer quantityEuPerUnit;//包装单位折合数量
	private Integer quantityUnit;//数量
	private Integer quantityEu;//折合数量
	private Integer  amount=null;//金额
	private String  memo="";//商品备注
	private String  status;//状态
	
	
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public String getEquivalentUnit() {
		return equivalentUnit;
	}
	public void setEquivalentUnit(String equivalentUnit) {
		this.equivalentUnit = equivalentUnit;
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
	public Integer getPriceEu() {
		return priceEu;
	}
	public void setPriceEu(Integer priceEu) {
		this.priceEu = priceEu;
	}
	public Integer getPriceUnit() {
		return priceUnit;
	}
	public void setPriceUnit(Integer priceUnit) {
		this.priceUnit = priceUnit;
	}
	public String getPurchaseOrderId() {
		return purchaseOrderId;
	}
	public void setPurchaseOrderId(String purchaseOrderId) {
		this.purchaseOrderId = purchaseOrderId;
	}
	public Integer getQuantityEu() {
		return quantityEu;
	}
	public void setQuantityEu(Integer quantityEu) {
		this.quantityEu = quantityEu;
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
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	
	

	
	
}
