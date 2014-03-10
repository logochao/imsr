/**
 * 
 */
package com.radius.invoicing.ibatis.model;

import java.util.Date;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 采购订单列表
 */
public class PurchaseOrderGrd extends ExtInfo {

	private String  purchaseOrderId="";//采购订货单编号
	private String  barCode="";//条形码
	private String  goodsId="";//商品编号
	private String  goodsName="";//商品名称
	private Integer  quantity=null;//数量
	private String  unit="";//单位
	private Integer  price=null;//单价
	private Integer  amount=null;//金额
	private String  trueGoodsName="";//真实品名
	private String  originPlace="";//产地
	private String  appearance="";//外观
	private String  formatType="";//规格编号
	private Integer  tax=null;//税率
	private Integer  taxAmount=null;//税额
	private Integer  seriesNo=null;//序号
	private String  model="";//型号
	private String  property="";//属性
	private Integer  weigthPerUnit=null;//单位重量
	private Integer  priceWeigthPerUnit=null;//单位重量单价
	private String  operator="";//
	private Integer  weightPerUnit=null;//每单位重量
	private Integer  batchNo=null;//
	private Date  madeDate=null;//生产日期
	private Date  validityDate=null;//有效期至
	private String  memo="";//
	private String  ledgerId="";//账套编号
	
	
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public String getAppearance() {
		return appearance;
	}
	public void setAppearance(String appearance) {
		this.appearance = appearance;
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
	public String getFormatType() {
		return formatType;
	}
	public void setFormatType(String formatType) {
		this.formatType = formatType;
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
	public String getOriginPlace() {
		return originPlace;
	}
	public void setOriginPlace(String originPlace) {
		this.originPlace = originPlace;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Integer getPriceWeigthPerUnit() {
		return priceWeigthPerUnit;
	}
	public void setPriceWeigthPerUnit(Integer priceWeigthPerUnit) {
		this.priceWeigthPerUnit = priceWeigthPerUnit;
	}
	public String getProperty() {
		return property;
	}
	public void setProperty(String property) {
		this.property = property;
	}
	public String getPurchaseOrderId() {
		return purchaseOrderId;
	}
	public void setPurchaseOrderId(String purchaseOrderId) {
		this.purchaseOrderId = purchaseOrderId;
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
	public String getTrueGoodsName() {
		return trueGoodsName;
	}
	public void setTrueGoodsName(String trueGoodsName) {
		this.trueGoodsName = trueGoodsName;
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
	public Integer getWeightPerUnit() {
		return weightPerUnit;
	}
	public void setWeightPerUnit(Integer weightPerUnit) {
		this.weightPerUnit = weightPerUnit;
	}
	public Integer getWeigthPerUnit() {
		return weigthPerUnit;
	}
	public void setWeigthPerUnit(Integer weigthPerUnit) {
		this.weigthPerUnit = weigthPerUnit;
	}
	
	
	
}
