package com.radius.invoicing.ibatis.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.invoicing.ibatis.dao.SalesOrderDao;
import com.radius.invoicing.ibatis.model.SalesOrder;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 
 */
@Repository
public class SalesOrderDaoImpl extends BaseIbatisDaoImpl<SalesOrder> implements SalesOrderDao {

	private final String SQLMAPNAMESPACE="salesOrderSqlMap.";
	
	/**
	 * 通过主键获取销售订单信息
	 * @param salesOrderId
	 * @return
	 */
	public SalesOrder getSalesOrderByPk(String salesOrderId){
		return this.getObjectByCondition(salesOrderId, SQLMAPNAMESPACE+"getSalesOrderByPk");
	}
	
	/**
	 * 通过销售订单条件查询获取销售订单信息
	 * @param salesOrder
	 * @return
	 */
	public List<SalesOrder> getSalesOrder(SalesOrder salesOrder){
		return this.getListObject(salesOrder, SQLMAPNAMESPACE+"getSalesOrder");
	}
	
	/**
	 * 保存销售订单
	 * @param salesOrder
	 */
	public void insertSalesOrder(SalesOrder salesOrder){
		this.insertObject(salesOrder, SQLMAPNAMESPACE+"insert");
	}
	
	/**
	 * 批量保存销售订单
	 * @param list
	 */
	public void batchInsertSalesOrders(List<SalesOrder> list){
		this.batchInsertListObject(list, SQLMAPNAMESPACE+"insert");
	}
	
	/**
	 * 通过主键更新销售订单信息
	 * @param salesOrder
	 * @return
	 */
	public boolean updateSalesOrderByPK(SalesOrder salesOrder){
		return this.updateObject(salesOrder, SQLMAPNAMESPACE+"updateSalesOrderByPK")==1;
	}
	/**
	 * 批量更新主键销售订单信息
	 * @param list
	 */
	public void batchUpdateSalesOrderByPK(List<SalesOrder> list){
		this.updateListObject(list, SQLMAPNAMESPACE+"updateSalesOrderByPK");
	} 
	/**
	 * 根据主键删除销售订单信息
	 * @param salesOrderId
	 */
	public void deleteSalesOrderByPK(String salesOrderId){
		this.deleteObject(salesOrderId, SQLMAPNAMESPACE+"deleteSalesOrderByPK");
	}
	/**
	 * 删除销售订单信息
	 * @param salesOrder
	 */
	public void deleteSalesOrder(SalesOrder salesOrder){
		this.deleteObject(salesOrder, SQLMAPNAMESPACE+"deleteSalesOrder");
	}
	/**
	 * 更新销售订单状态通过销售订单号
	 * @param salesOrder
	 */
	public void updateSalesOrderStatusBySalesOrderId(SalesOrder salesOrder){
		this.updateObject(salesOrder, SQLMAPNAMESPACE+"salesOrder");
	}
}
