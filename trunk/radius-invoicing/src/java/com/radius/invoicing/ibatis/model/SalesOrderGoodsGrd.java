package com.radius.invoicing.ibatis.model;

import java.util.Date;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 销售订单商品列表
 */
public class SalesOrderGoodsGrd extends ExtInfo {

	   private Integer seriesNo = null ;//序号
	   private String orderId = "";//销售订货单编号
	   private String goodsId = "";//商品编号
	   private String goodsName = "";//商品名称
	   private Integer quantity = null ;//数量
	   private String unit = "";//单位
	   private String barCode = "";//条形码
	   private String model = "";//型号
	   private String property = "";//属性
	   private Integer price  = null;//单价
	   private Integer amount = null ;//金额
	   private String stats = "";//状态
	   private String other = "";//其他
	   private String formate = "";//规格编号
	   private Integer priceKg = null  ;//单价/kg
	   private Integer totalWeight = null  ;//总重量
	   private Integer tax  = null ;//税率
	   private Integer taxAmount = null ;//税额
	   private Integer weigthUnit = null ;//单位重量
	   private Integer priceWeigthUnit = null  ;//单位重量单价
	   private String operator = "";//
	   private Integer weightUnit = null ;//每单位重量
	   private Integer batchNo = null ;//batch_no
	   private Date madeDate = null ;//生产日期
	   private Date validityDate = null ;//有效期至
	   private String  memo="";//商品备注
	   private String  ledgerId="";//账套编号

	
	   
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public String getBarCode() {
		return barCode;
	}
	public void setBarCode(String barCode) {
		this.barCode = barCode;
	}
	public Integer getBatchNo() {
		return batchNo;
	}
	public void setBatchNo(Integer batchNo) {
		this.batchNo = batchNo;
	}
	public String getFormate() {
		return formate;
	}
	public void setFormate(String formate) {
		this.formate = formate;
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
	public String getLedgerId() {
		return ledgerId;
	}
	public void setLedgerId(String ledgerId) {
		this.ledgerId = ledgerId;
	}
	public Date getMadeDate() {
		return madeDate;
	}
	public void setMadeDate(Date madeDate) {
		this.madeDate = madeDate;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getOther() {
		return other;
	}
	public void setOther(String other) {
		this.other = other;
	}
	
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Integer getPriceKg() {
		return priceKg;
	}
	public void setPriceKg(Integer priceKg) {
		this.priceKg = priceKg;
	}
	public Integer getPriceWeigthUnit() {
		return priceWeigthUnit;
	}
	public void setPriceWeigthUnit(Integer priceWeigthUnit) {
		this.priceWeigthUnit = priceWeigthUnit;
	}
	public String getProperty() {
		return property;
	}
	public void setProperty(String property) {
		this.property = property;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Integer getSeriesNo() {
		return seriesNo;
	}
	public void setSeriesNo(Integer seriesNo) {
		this.seriesNo = seriesNo;
	}
	public String getStats() {
		return stats;
	}
	public void setStats(String stats) {
		this.stats = stats;
	}
	public Integer getTax() {
		return tax;
	}
	public void setTax(Integer tax) {
		this.tax = tax;
	}
	public Integer getTaxAmount() {
		return taxAmount;
	}
	public void setTaxAmount(Integer taxAmount) {
		this.taxAmount = taxAmount;
	}
	public Integer getTotalWeight() {
		return totalWeight;
	}
	public void setTotalWeight(Integer totalWeight) {
		this.totalWeight = totalWeight;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public Date getValidityDate() {
		return validityDate;
	}
	public void setValidityDate(Date validityDate) {
		this.validityDate = validityDate;
	}
	public Integer getWeightUnit() {
		return weightUnit;
	}
	public void setWeightUnit(Integer weightUnit) {
		this.weightUnit = weightUnit;
	}
	public Integer getWeigthUnit() {
		return weigthUnit;
	}
	public void setWeigthUnit(Integer weigthUnit) {
		this.weigthUnit = weigthUnit;
	}
	   
	   
	   
	   
	   
}
