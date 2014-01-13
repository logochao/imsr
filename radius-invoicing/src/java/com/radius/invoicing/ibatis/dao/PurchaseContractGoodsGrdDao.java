package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.invoicing.ibatis.model.PurchaseContractGoodsGrd;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface PurchaseContractGoodsGrdDao {

	/**
	 * 根据采购合同编号与商品编号相关对象
	 * @param contractId
	 * @param goodsId
	 * @return
	 */
	public PurchaseContractGoodsGrd getPurchaseContractGoodsGrdByPk(
			String contractId, String goodsId);

	/**
	 * 根据条件进行查询
	 * @param p
	 * @return
	 */
	public List<PurchaseContractGoodsGrd> getPurchaseContractGoodsGrd(
			PurchaseContractGoodsGrd p);

	/**
	 * 保存采购商品信息
	 * @param p
	 */
	public void insertPurchaseContractGoodsGrd(PurchaseContractGoodsGrd p);

	/**
	 * 批量保存采购商品信息
	 * @param list
	 */
	public void batchInsertPurchaseContractGoodsGrd(
			List<PurchaseContractGoodsGrd> list);

	/**
	 * 更新商品信息
	 * @param p
	 * @return
	 */
	public boolean updatePurchaseContractGoodsGrdByPK(PurchaseContractGoodsGrd p);

	/**
	 * 删除采购商品信息
	 * @param p
	 */
	public void deletePurchaseContractGoodsGrd(PurchaseContractGoodsGrd p);

	/**
	 * 通过主键删除采购商品信息
	 * @param contractId
	 * @param goodsId
	 */
	public void deletePurcheaseContractGoodsGrdByPK(String contractId,
			String goodsId);

}