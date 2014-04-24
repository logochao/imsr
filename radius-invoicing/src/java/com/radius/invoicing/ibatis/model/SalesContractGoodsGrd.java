/**
 * 
 */
package com.radius.invoicing.ibatis.model;
/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 销售合同_商品明细
 */
public class SalesContractGoodsGrd extends ExtInfo{

	private String  	contractId="";//合同编号
	private String  	goodsId="";//商品编号
	private String  	goodsName="";//商品名称
	private Integer  	specId=null;//规格编码
	private String  	unit="";//包装单位(规格)
	private Integer  	priceUnit;//包装单位单价
	private String  	equivalentUnit="";//折合单位
	private Integer  	priceEu=null;//折合单位单价
	private Integer  	quantityEuPerUnit=null;//包装单位折合数量
	private Integer  	quantityEu=null;//折合数量
	private Integer  	quantityUnit=null;//数量
	private String 		memo="";//商品备注
	private Integer		settledAmount=null;//已生成订单商品数量
	private Integer  	amount=null;//金额
	private String  	status="";//状态
	private String  	ledgerId="";//账套编号
	
	
	
	
	
	//-----
	private Integer price;//单价
	
	public SalesContractGoodsGrd() {
	}
	
	public SalesContractGoodsGrd(String contractId, String goodsId) {
		this.contractId = contractId;
		this.goodsId = goodsId;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public String getContractId() {
		return contractId;
	}

	public void setContractId(String contractId) {
		this.contractId = contractId;
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

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
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

	public Integer getSettledAmount() {
		return settledAmount;
	}

	public void setSettledAmount(Integer settledAmount) {
		this.settledAmount = settledAmount;
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
