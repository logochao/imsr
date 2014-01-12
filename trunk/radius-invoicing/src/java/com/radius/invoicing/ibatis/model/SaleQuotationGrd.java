/**
 * 
 */
package com.radius.invoicing.ibatis.model;

import java.util.Date;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明  销售报价商品明细 
 */
public class SaleQuotationGrd extends ExtInfo{

	private String  quotationId="";//销售报价单编号 
	private String  goodsId="";//商品编号
	private String  goodsName="";//商品名称
	private String  unit="";//包装单位(规格)
	private Integer  priceUnit=null;//包装单位单价
	private String  equivalentUnit="";//折合单位
	private Integer  priceEu=null;//折合单位单价
	private Integer  quantityEuPerUnit=null;//包装单位折合数量
	private Integer  quantityUnit=null;//数量
	private Integer  quantityEu=null;//折合数量
	private Date  madeDate=null;//生产日期
	private Date  validityDate;//有效期至
	private String  ledgerId="";//账套编号
	private String  memo="";//备注
	
	
	public SaleQuotationGrd() {
	}


	public SaleQuotationGrd(String quotationId, String goodsId) {
		super();
		this.quotationId = quotationId;
		this.goodsId = goodsId;
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


	public String getQuotationId() {
		return quotationId;
	}


	public void setQuotationId(String quotationId) {
		this.quotationId = quotationId;
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
	
	
	
}
