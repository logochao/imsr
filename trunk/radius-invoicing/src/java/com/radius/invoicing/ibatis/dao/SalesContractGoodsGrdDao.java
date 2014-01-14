package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.invoicing.ibatis.model.SalesContractGoodsGrd;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface SalesContractGoodsGrdDao {

	/**
	 * 通过主键查询采购商品信息
	 * @param contractId
	 * @param goodsId
	 * @return
	 */
	public SalesContractGoodsGrd getSalesContractGoodsGrdByPk(
			String contractId, String goodsId);

	/**
	 * 通过条件查询采购商品信息
	 * @param g
	 * @return
	 */
	public List<SalesContractGoodsGrd> getSalesContractGoodsGrd(
			SalesContractGoodsGrd g);

	/**
	 * 保存
	 * @param g
	 */
	public void insertSalesContractGoodsGrd(SalesContractGoodsGrd g);

	/**
	 * 批量保存
	 * @param list
	 */
	public void batchInsertSalesContractGoodsGrd(
			List<SalesContractGoodsGrd> list);

	/**
	 * 更新
	 * @param g
	 * @return
	 */
	public boolean updateSalesContractGoodsGrdByPK(SalesContractGoodsGrd g);

	/**
	 * 删除销售商品
	 * @param g
	 */
	public void deleteSalesContractGoodsGrd(SalesContractGoodsGrd g);

	/**
	 * 通过主键删除销售商品信息
	 * @param contractId
	 * @param goodsId
	 */
	public void deleteSalesContractGoodsGrdByPK(String contractId,
			String goodsId);

}