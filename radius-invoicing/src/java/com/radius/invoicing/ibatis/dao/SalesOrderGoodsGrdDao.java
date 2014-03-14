package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.invoicing.ibatis.model.SalesOrderGoodsGrd;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface SalesOrderGoodsGrdDao {

	/**
	 * 更加主键获取销售订单商品列表
	 * @param orderId
	 * @param goodsId
	 * @return
	 */
	public SalesOrderGoodsGrd getSalesOrderGoodsGrdByPk(String orderId,
			String goodsId);

	/**
	 * 根据条件获取销售订单商品列表
	 * @param salesOrderGoodsGrd
	 * @return
	 */
	public List<SalesOrderGoodsGrd> getSalesOrderGoodsGrd(
			SalesOrderGoodsGrd salesOrderGoodsGrd);

	/**
	 * 保存销售订单商品信息列表
	 * @param salesOrderGoodsGrd
	 */
	public void insertSalesOrderGoodsGrd(SalesOrderGoodsGrd salesOrderGoodsGrd);

	/**
	 * 批量添加销售订单商品信息列表
	 * @param list
	 */
	public void batchInsertSalesOrderGoodsGrd(List<SalesOrderGoodsGrd> list);
	
	/**
	 * 更新销售订单商品列表通过主键
	 * @param salesOrderGoodsGrd
	 */
	public boolean updateSalesOrderGoodsGrdByPK(
			SalesOrderGoodsGrd salesOrderGoodsGrd);

	/**
	 * 根据条件删除相关信息
	 * @param salesOrderGoodsGrd
	 * @return
	 */
	public boolean deleteSalesOrderGoodsGrd(
			SalesOrderGoodsGrd salesOrderGoodsGrd);

	/**
	 * 根据主键删除销售订单商品信息
	 * @param orderId
	 * @param goodsId
	 * @return
	 */
	public boolean deleteSalesOrderGoodsGrdByPK(String orderId, String goodsId);

	/**
	 * 通过主键更新销售订单的状态
	 * @param salesOrderGoodsGrd
	 * @return
	 */
	public boolean updateSalesOrderGoodsGrdStatusByPK(
			SalesOrderGoodsGrd salesOrderGoodsGrd);

}