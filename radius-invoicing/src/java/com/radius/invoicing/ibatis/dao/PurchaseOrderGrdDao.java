package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.invoicing.ibatis.model.PurchaseOrderGrd;

public interface PurchaseOrderGrdDao {

	/**
	 * 根据主键获取采购订单商品信息
	 * @param purchaseOrderId
	 * @param goodsId
	 * @return
	 */
	public PurchaseOrderGrd getPurchaseOrderGrdByPrimaryKey(
			String purchaseOrderId, String goodsId);

	/**
	 * 根据条件查询采购订单信息
	 * @param purchaseOrderGrd
	 * @return
	 */
	public List<PurchaseOrderGrd> getPurchaseOrderGrd(
			PurchaseOrderGrd purchaseOrderGrd);

	/**
	 * 保存采购订单商品信息
	 * @param purchaseOrderGrd
	 */
	public void insertPurchaseOrderGrd(PurchaseOrderGrd purchaseOrderGrd);

	/**
	 * 通过主键更新采购订单信息
	 * @param purchaseOrderGrd
	 * @return
	 */
	public boolean updatePurchaseOrderGrdByPrimaryKey(
			PurchaseOrderGrd purchaseOrderGrd);

	/**
	 * 批量跟新采购订单信息
	 * @param list
	 */
	public void batchUpdatePurchaseOrderGrd(List<PurchaseOrderGrd> list);

	/**
	 * 删除采购订单信息
	 * @param purchaseOrderGrd
	 * @return
	 */
	public boolean deletePurchaseOrderGrd(PurchaseOrderGrd purchaseOrderGrd);

	/**
	 * 批量删除采购订单信息
	 * @param list
	 */
	public void batchDeletePurchaseOrderGrd(List<PurchaseOrderGrd> list);

	/**
	 * 根据主键删除采购订单
	 * @param purchaseOrderId
	 * @param goodsId
	 * @return
	 */
	public boolean deletePurchaseOrderGrdByPrimaryKey(String purchaseOrderId,
			String goodsId);

}