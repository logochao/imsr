package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.invoicing.ibatis.model.SalesOrder;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface SalesOrderDao {

	/**
	 * 通过主键获取销售订单信息
	 * @param salesOrderId
	 * @return
	 */
	public SalesOrder getSalesOrderByPk(String salesOrderId);

	/**
	 * 通过销售订单条件查询获取销售订单信息
	 * @param salesOrder
	 * @return
	 */
	public List<SalesOrder> getSalesOrder(SalesOrder salesOrder);

	/**
	 * 保存销售订单
	 * @param salesOrder
	 */
	public void insertSalesOrder(SalesOrder salesOrder);

	/**
	 * 批量保存销售订单
	 * @param list
	 */
	public void batchInsertSalesOrders(List<SalesOrder> list);

	/**
	 * 通过主键更新销售订单信息
	 * @param salesOrder
	 * @return
	 */
	public boolean updateSalesOrderByPK(SalesOrder salesOrder);

	/**
	 * 批量更新主键销售订单信息
	 * @param list
	 */
	public void batchUpdateSalesOrderByPK(List<SalesOrder> list);

	/**
	 * 根据主键删除销售订单信息
	 * @param salesOrderId
	 */
	public void deleteSalesOrderByPK(String salesOrderId);

	/**
	 * 删除销售订单信息
	 * @param salesOrder
	 */
	public void deleteSalesOrder(SalesOrder salesOrder);

	/**
	 * 更新销售订单状态通过销售订单号
	 * @param salesOrder
	 */
	public void updateSalesOrderStatusBySalesOrderId(SalesOrder salesOrder);
	
	
	/**
	 * 根据供应商编号获取销售订单信息
	 * @param supplierId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<SalesOrder> getSalesOrderBySupplierId(String supplierId);
	
	
	/**
	 * 通过商品编号获取销售订单信息列表
	 * @param goodsIds
	 * @param salesOrderId
	 * @return
	 */
	public List<SalesOrder> getSalesOrderByGoodsIds(String goodsIds,String salesOrderId);

}