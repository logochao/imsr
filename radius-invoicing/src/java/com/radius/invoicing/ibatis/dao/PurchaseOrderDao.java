package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.invoicing.ibatis.model.PurchaseOrder;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface PurchaseOrderDao {

	/**
	 * 通过采购订单编号获取采购信息
	 * @param purchaseOrderId
	 * @return
	 */
	public PurchaseOrder getPurchaseOrderById(String purchaseOrderId);

	/**
	 * 通过条件查询获取订单信息
	 * @param purchaseOrder
	 * @return
	 */
	public List<PurchaseOrder> getPurchaseOrder(PurchaseOrder purchaseOrder);

	/**
	 * 保存采购订单信息
	 * @param purchaseOrder
	 */
	public void insertPurchaseOrder(PurchaseOrder purchaseOrder);

	/**
	 * 批量保存采购订单信息
	 * @param list
	 */
	public void batchInsertPurchaseOrder(List<PurchaseOrder> list);

	/**
	 * 更新采购订单信息
	 * @param purchaseOrder
	 * @return
	 */
	public boolean updatePurchaseOrder(PurchaseOrder purchaseOrder);

	/**
	 * 批量更新采购订单信息
	 * @param list
	 */
	public void batchUpdatePurchaseOrder(List<PurchaseOrder> list);

	/**
	 * 删除采购订单信息
	 * @param purchaseOrder
	 * @return
	 */
	public boolean deletePurchaseOrder(PurchaseOrder purchaseOrder);

	/**
	 * 批量删除采购订单信息
	 * @param list
	 */
	public void batchDeletePurchaseOrder(List<PurchaseOrder> list);

	/**
	 * 通过主键删除采购订单信息
	 * @param purchaseOrderId
	 * @return
	 */
	public boolean deletePurchaseOrderById(String purchaseOrderId);
	
	
	/**
	 * 更新采购订单状态
	 * @param purchaseOrder
	 * @return
	 */
	public boolean updatePurchaseOrderStatusByPurchaseOrderId(PurchaseOrder purchaseOrder);
	
	
	/**
	 * 通过商品编号、采购订单号获取采购订单信息
	 * @param purchaseOrderId
	 * @param goodsIds
	 * @return
	 */
	public List<PurchaseOrder> getPurchaseOrderByGoodsIds(String purchaseOrderId,String goodsIds);

}