package com.radius.invoicing.ibatis.model;

import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.radius.base.utils.JsonDateSerializer;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 供应商报价明细
 */
public class SupplierQuotationGrd extends ExtInfo {

	private   String     quotationId="";//供应商报价单编号
	private   String     goodsId="";//商品编号
	private   String     goodsName="";//商品名称
	private   Integer    specId;//规格编码
	private   String     unit="";//包装单位(规格)
	private   String     equivalentUnit="";//折合单位
	private   Integer    quantityEuPerUnit;//包装单位折合数量
	private   String     cashType="";//供应币种
	private   Integer    priceUnitSupply;//包装单位供应单价
	private   Integer    priceEuSupply;//折合单位供应单价
	private   Date     	 validityDate;//有效期至
	private   String     memo="";//备注
	
	public SupplierQuotationGrd() {
	}
	public SupplierQuotationGrd(String quotationId, String goodsId) {
		super();
		this.quotationId = quotationId;
		this.goodsId = goodsId;
	}

	public String getCashType() {
		return cashType;
	}
	public void setCashType(String cashType) {
		this.cashType = cashType;
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
	public Integer getPriceEuSupply() {
		return priceEuSupply;
	}
	public void setPriceEuSupply(Integer priceEuSupply) {
		this.priceEuSupply = priceEuSupply;
	}
	public Integer getPriceUnitSupply() {
		return priceUnitSupply;
	}
	public void setPriceUnitSupply(Integer priceUnitSupply) {
		this.priceUnitSupply = priceUnitSupply;
	}
	public Integer getQuantityEuPerUnit() {
		return quantityEuPerUnit;
	}
	public void setQuantityEuPerUnit(Integer quantityEuPerUnit) {
		this.quantityEuPerUnit = quantityEuPerUnit;
	}
	public String getQuotationId() {
		return quotationId;
	}
	public void setQuotationId(String quotationId) {
		this.quotationId = quotationId;
	}
	public Integer getSpecId() {
		return specId;
	}
	public void setSpecId(Integer specId) {
		this.specId = specId;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	@JsonSerialize(using=JsonDateSerializer.class)
	public Date getValidityDate() {
		return validityDate;
	}
	public void setValidityDate(Date validityDate) {
		this.validityDate = validityDate;
	}
	
	
}
