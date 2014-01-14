/**
 * 
 */
package com.radius.invoicing.ibatis.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.invoicing.ibatis.dao.PurchaseContractGoodsGrdDao;
import com.radius.invoicing.ibatis.model.PurchaseContractGoodsGrd;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 采购合同_商品明细Dao
 */
@Repository
public class PurchaseContractGoodsGrdDaoImpl extends BaseIbatisDaoImpl<PurchaseContractGoodsGrd> implements PurchaseContractGoodsGrdDao{

	private final String SQLMAPNAMESPACE="purchaseContractGoodsGrdSqlMap.";
	
	/**
	 * 根据采购合同编号与商品编号相关对象
	 * @param contractId
	 * @param goodsId
	 * @return
	 */
	public PurchaseContractGoodsGrd  getPurchaseContractGoodsGrdByPk(String contractId,String goodsId){
		Map<String, String> params=new HashMap<String, String>();
		params.put("contractId", contractId);
		params.put("goodsId", goodsId);
		return this.getObjectByCondition(params, SQLMAPNAMESPACE+"getPurchaseContractGoodsGrdByPk");
	}
	
	/**
	 * 根据条件进行查询
	 * @param p
	 * @return
	 */
	public List<PurchaseContractGoodsGrd> getPurchaseContractGoodsGrd(PurchaseContractGoodsGrd p){
		return this.getListObject(p, SQLMAPNAMESPACE+"getPurchaseContractGoodsGrd");
	}
	
	/**
	 * 保存采购商品信息
	 * @param p
	 */
	public void insertPurchaseContractGoodsGrd(PurchaseContractGoodsGrd p){
		this.insertObject(p, SQLMAPNAMESPACE+"insert");
	}
	
	/**
	 * 批量保存采购商品信息
	 * @param list
	 */
	public void batchInsertPurchaseContractGoodsGrd(List<PurchaseContractGoodsGrd> list){
		this.batchInsertListObject(list, SQLMAPNAMESPACE+"insert");
	}
	
	/**
	 * 更新商品信息
	 * @param p
	 * @return
	 */
	public boolean updatePurchaseContractGoodsGrdByPK(PurchaseContractGoodsGrd p){
		return this.updateObject(p, SQLMAPNAMESPACE+"updatePurchaseContractGoodsGrdByPK")==1;
	}
	
	/**
	 * 删除采购商品信息
	 * @param p
	 */
	public void deletePurchaseContractGoodsGrd(PurchaseContractGoodsGrd p){
		this.deleteObject(p, SQLMAPNAMESPACE+"deletePurchaseContractGoodsGrd");
	}
	
	/**
	 * 通过主键删除采购商品信息
	 * @param contractId
	 * @param goodsId
	 */
	public void deletePurcheaseContractGoodsGrdByPK(String contractId,String goodsId){
		Map<String, String> params=new HashMap<String, String>();
		params.put("contractId", contractId);
		params.put("goodsId", goodsId);
		this.deleteObject(params, SQLMAPNAMESPACE+"deletePurchaseContractGoodsGrdByPK");
	}
}
