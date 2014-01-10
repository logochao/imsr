/**
 * 
 */
package com.radius.invoicing.ibatis.model;
/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 供应商商品信息
 */
public class SupplierGoods extends ExtInfo{

	private String supplierId="";//供应商编号
	private String goodsId="";//商品编号
	private String ledgerId="";//帐套编号
	
	
	public SupplierGoods() {
	}
	
	
	public SupplierGoods(String supplierId, String goodsId, String ledgerId) {
		this.supplierId = supplierId;
		this.goodsId = goodsId;
		this.ledgerId = ledgerId;
	}

	public String getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}
	public String getLedgerId() {
		return ledgerId;
	}
	public void setLedgerId(String ledgerId) {
		this.ledgerId = ledgerId;
	}
	public String getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}
	
	
	
}
