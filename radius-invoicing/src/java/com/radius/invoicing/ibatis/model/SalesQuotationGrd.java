/**
 * 
 */
package com.radius.invoicing.ibatis.model;

import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.radius.base.utils.JsonDateSerializer;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明  销售报价商品明细 
 */
public class SalesQuotationGrd extends ExtInfo{

	private String		salesQuotationId="";//销售报价单编号
	private String		goodsId="";//商品编号
	private String		goodsName="";//商品名称
	private Integer		specId;//规格编码
	private String		unit="";//包装单位(规格)
	private String		equivalentUnit="";//折合单位
	private Integer		quantityEuPerUnit;//包装单位折合数量
	private String		supplyCashType="";//供应币种
	private Integer		priceUnitSupply;//包装单位供应单价
	private Integer		priceEuSupply;//折合单位供应单价
	private String		salesCashType="";//销售币种
	private Integer		exchRate;//折算汇率
	private Integer		priceEuCustomer;//销售报价
	private Integer		markUpRate;//综合加价率
	private String		memo="";//备注
	private Date		madeDate;//生产日期
	private Date		validityDate;//有效期至
	
	
	public String getEquivalentUnit() {
		return equivalentUnit;
	}
	public void setEquivalentUnit(String equivalentUnit) {
		this.equivalentUnit = equivalentUnit;
	}
	public Integer getExchRate() {
		return exchRate;
	}
	public void setExchRate(Integer exchRate) {
		this.exchRate = exchRate;
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
	@JsonSerialize(using=JsonDateSerializer.class)
	public Date getMadeDate() {
		return madeDate;
	}
	public void setMadeDate(Date madeDate) {
		this.madeDate = madeDate;
	}
	public Integer getMarkUpRate() {
		return markUpRate;
	}
	public void setMarkUpRate(Integer markUpRate) {
		this.markUpRate = markUpRate;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public Integer getPriceEuCustomer() {
		return priceEuCustomer;
	}
	public void setPriceEuCustomer(Integer priceEuCustomer) {
		this.priceEuCustomer = priceEuCustomer;
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
	public String getSalesCashType() {
		return salesCashType;
	}
	public void setSalesCashType(String salesCashType) {
		this.salesCashType = salesCashType;
	}
	public String getSalesQuotationId() {
		return salesQuotationId;
	}
	public void setSalesQuotationId(String salesQuotationId) {
		this.salesQuotationId = salesQuotationId;
	}
	public Integer getSpecId() {
		return specId;
	}
	public void setSpecId(Integer specId) {
		this.specId = specId;
	}
	public String getSupplyCashType() {
		return supplyCashType;
	}
	public void setSupplyCashType(String supplyCashType) {
		this.supplyCashType = supplyCashType;
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
