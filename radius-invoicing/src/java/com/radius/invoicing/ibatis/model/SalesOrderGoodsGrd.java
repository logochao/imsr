package com.radius.invoicing.ibatis.model;


/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 销售订单商品列表
 */
public class SalesOrderGoodsGrd extends ExtInfo {

   private String 		orderId="";//销售订货单编号
   private String 		goodsId="";//商品编号
   private String 		goodsName="";//商品名称
   private Integer 		specId;//规格编码
   private Integer 		unit;//包装单位(规格)
   private Integer 		priceUnit;//包装单位单价
   private Integer 		equivalentUnit;//折合单位
   private Integer 		priceEu;//折合单位单价
   private Integer 		quantityEuPerUnit;//包装单位折合数量
   private Integer 		quantityUnit;//数量
   private Integer 		quantityEu;//折合数量
   private Integer 		amount;//金额
   private String   	upperAmount="";//大写金额
   private String  		memo="";//商品备注
   private String 		status="";//状态
	   
	   
	public SalesOrderGoodsGrd() {
	}
	   
	public SalesOrderGoodsGrd(String orderId, String goodsId) {
		this.orderId = orderId;
		this.goodsId = goodsId;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public Integer getEquivalentUnit() {
		return equivalentUnit;
	}
	public void setEquivalentUnit(Integer equivalentUnit) {
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
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
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
	public Integer getUnit() {
		return unit;
	}
	public void setUnit(Integer unit) {
		this.unit = unit;
	}
	public String getUpperAmount() {
		return upperAmount;
	}
	public void setUpperAmount(String upperAmount) {
		this.upperAmount = upperAmount;
	}
	   
}
