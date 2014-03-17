package com.radius.invoicing.ibatis.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.invoicing.ibatis.dao.PurchaseOrderDao;
import com.radius.invoicing.ibatis.model.PurchaseOrder;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 采购订单DAO
 */
@Repository
public class PurchaseOrderDaoImpl extends BaseIbatisDaoImpl<PurchaseOrder> implements PurchaseOrderDao {

	private final String SQLMAPNAMESPACE="purchaseOrderSqlMap."; 
	
	/**
	 * 通过采购订单编号获取采购信息
	 * @param purchaseOrderId
	 * @return
	 */
	public PurchaseOrder getPurchaseOrderById(String purchaseOrderId){
		return this.getObjectByCondition(purchaseOrderId, SQLMAPNAMESPACE+"getPurchaseOrderByPk");
	}
	/**
	 * 通过条件查询获取订单信息
	 * @param purchaseOrder
	 * @return
	 */
	public List<PurchaseOrder> getPurchaseOrder(PurchaseOrder purchaseOrder){
		return this.getListObject(purchaseOrder, SQLMAPNAMESPACE+"getPurchaseOrder");
	}
	/**
	 * 保存采购订单信息
	 * @param purchaseOrder
	 */
	public void insertPurchaseOrder(PurchaseOrder purchaseOrder){
		this.insertObject(purchaseOrder, SQLMAPNAMESPACE+"insert");
	}
	/**
	 * 批量保存采购订单信息
	 * @param list
	 */
	public void batchInsertPurchaseOrder(List<PurchaseOrder> list){
		this.batchInsertListObject(list, SQLMAPNAMESPACE+"insert");
	}
	
	/**
	 * 更新采购订单信息
	 * @param purchaseOrder
	 * @return
	 */
	public boolean updatePurchaseOrder(PurchaseOrder purchaseOrder){
		return this.updateObject(purchaseOrder,SQLMAPNAMESPACE+"updatePurchaseOrderByPK")==1;
	}
	
	/**
	 * 批量更新采购订单信息
	 * @param list
	 */
	public void batchUpdatePurchaseOrder(List<PurchaseOrder> list){
		this.updateListObject(list, SQLMAPNAMESPACE+"updatePurchaseOrderByPK");
	}
	
	/**
	 * 删除采购订单信息
	 * @param purchaseOrder
	 * @return
	 */
	public boolean deletePurchaseOrder(PurchaseOrder purchaseOrder){
		return this.deleteObject(purchaseOrder, SQLMAPNAMESPACE+"deletePurchaseOrder")	==1;
	}
	/**
	 * 批量删除采购订单信息
	 * @param list
	 */
	public void batchDeletePurchaseOrder(List<PurchaseOrder> list){
		this.batchDeleteListObject(list, SQLMAPNAMESPACE+"deletePurchaseOrder");
	}
	
	/**
	 * 通过主键删除采购订单信息
	 * @param purchaseOrderId
	 * @return
	 */
	public boolean deletePurchaseOrderById(String purchaseOrderId){
		return this.deleteObject(purchaseOrderId, SQLMAPNAMESPACE+"deletePurchaseOrderByPK")==1;
	}
	
	/**
	 * 更新采购订单状态
	 * @param purchaseOrder
	 * @return
	 */
	public boolean updatePurchaseOrderStatusByPurchaseOrderId(PurchaseOrder purchaseOrder){
		return this.updateObject(purchaseOrder, SQLMAPNAMESPACE+"updateStatusByPurchaseOrderId")==1;
	}
}
