package com.radius.invoicing.ibatis.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.invoicing.ibatis.dao.PurchaseOrderGrdDao;
import com.radius.invoicing.ibatis.model.PurchaseOrderGrd;


/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 采购订单DAO
 */
@Repository
public class PurchaseOrderGrdDaoImpl extends BaseIbatisDaoImpl<PurchaseOrderGrd> implements PurchaseOrderGrdDao{

	private final String SQLMAPNAMESPACE="purchaseOrderGrdSqlMap."; 
	
	/**
	 * 根据主键获取采购订单商品信息
	 * @param purchaseOrderId
	 * @param goodsId
	 * @return
	 */
	public PurchaseOrderGrd getPurchaseOrderGrdByPrimaryKey(String purchaseOrderId,String goodsId){
		Map<String, String> params =new HashMap<String, String>();
		params.put("purchaseOrderId", purchaseOrderId);
		params.put("goodsId", goodsId);
		
		return this.getObjectByCondition(params, SQLMAPNAMESPACE+"getPurchaseOrderGrdByPk");
	}
	
	
	/**
	 * 根据条件查询采购订单信息
	 * @param purchaseOrderGrd
	 * @return
	 */
	public List<PurchaseOrderGrd> getPurchaseOrderGrd(PurchaseOrderGrd purchaseOrderGrd){
		return this.getListObject(purchaseOrderGrd, SQLMAPNAMESPACE+"getPurchaseOrderGrd");
	}
	
	/**
	 * 保存采购订单商品信息
	 * @param purchaseOrderGrd
	 */
	public void insertPurchaseOrderGrd(PurchaseOrderGrd purchaseOrderGrd){
		this.insertObject(purchaseOrderGrd, SQLMAPNAMESPACE+"insert");
	}
	
	/**
	 * 批量保存采购订单商品信息
	 * @param list
	 */
	public void batchInsertPurchaseOrderGrd(List<PurchaseOrderGrd> list){
		this.batchInsertListObject(list,SQLMAPNAMESPACE+"insert");
	}
	
	
	
	/**
	 * 通过主键更新采购订单信息
	 * @param purchaseOrderGrd
	 * @return
	 */
	public boolean updatePurchaseOrderGrdByPrimaryKey(PurchaseOrderGrd purchaseOrderGrd){
		return this.updateObject(purchaseOrderGrd, SQLMAPNAMESPACE+"updatePurchaseOrderGrdByPK")==1;
	}
	
	/**
	 * 批量跟新采购订单信息
	 * @param list
	 */
	public void batchUpdatePurchaseOrderGrd(List<PurchaseOrderGrd> list){
		this.updateListObject(list, SQLMAPNAMESPACE+"updatePurchaseOrderGrdByPK");
	}
	
	/**
	 * 删除采购订单信息
	 * @param purchaseOrderGrd
	 * @return
	 */
	public boolean deletePurchaseOrderGrd(PurchaseOrderGrd purchaseOrderGrd){
		return this.deleteObject(purchaseOrderGrd, SQLMAPNAMESPACE+"deletePurchaseOrderGrd")==1;
	}
	
	/**
	 * 批量删除采购订单信息
	 * @param list
	 */
	public void  batchDeletePurchaseOrderGrd(List<PurchaseOrderGrd> list){
		this.batchDeleteListObject(list, SQLMAPNAMESPACE+"deletePurchaseOrderGrd");
	}
	
	/**
	 * 根据主键删除采购订单
	 * @param purchaseOrderId
	 * @param goodsId
	 * @return
	 */
	public boolean deletePurchaseOrderGrdByPrimaryKey(String purchaseOrderId,String goodsId){
		Map<String, String> params =new HashMap<String, String>();
		params.put("purchaseOrderId", purchaseOrderId);
		params.put("goodsId", goodsId);
		return this.deleteObject(params, SQLMAPNAMESPACE+"deletePurchaseOrderGrdByPK")==1;
	}
}
