package com.radius.invoicing.ibatis.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.invoicing.ibatis.dao.PurchaseInquiryGrdDao;
import com.radius.invoicing.ibatis.model.PurchaseInquiryGrd;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 销售商品询价列表
 */
@Repository
public class PurchaseInquiryGrdDaoImpl extends BaseIbatisDaoImpl<PurchaseInquiryGrd> implements PurchaseInquiryGrdDao  {

	private final String SQLMAPNAMESPACE="purchaseInquiryGrdSqlMap.";
	
	/**
	 * 通过组合主键查询销售询价列表
	 * @param salesInquiryId
	 * @param goodsId
	 * @return
	 */
	public PurchaseInquiryGrd  getPurchaseInquiryGrd(String purchaseInquiryId,String goodsId){
		Map<String, String> params=new HashMap<String, String>();
		params.put("purchaseInquiryId", purchaseInquiryId);
		params.put("goodsId", goodsId);
		return this.getObjectByCondition(params, SQLMAPNAMESPACE+"getPurchaseInquiryGrdByPk");
	}
	/**
	 * 通过条件查询销售询价列表
	 * @param PurchaseInquiryGrd
	 * @return
	 */
	public List<PurchaseInquiryGrd> getPurchaseInquiryGrdList(PurchaseInquiryGrd PurchaseInquiryGrd){
		return this.getListObject(PurchaseInquiryGrd, SQLMAPNAMESPACE+"getPurchaseInquiryGrd");
	}
	/**
	 * 保存销售询价
	 * @param PurchaseInquiryGrd
	 */
	public void insert(PurchaseInquiryGrd PurchaseInquiryGrd){
		this.insertObject(PurchaseInquiryGrd, SQLMAPNAMESPACE+"insert");
	}
	/**
	 * 批量保存销售询价列表
	 * @param list
	 */
	public void batchInsertPurchaseInquiryGrd(List<PurchaseInquiryGrd> list){
		this.batchInsertListObject(list, SQLMAPNAMESPACE+"insert");
	}
	/**
	 * 更新销售询价列表
	 * @param PurchaseInquiryGrd
	 * @return
	 */
	public boolean updatePurchaseInquiryGrd(PurchaseInquiryGrd PurchaseInquiryGrd){
		return this.updateObject(PurchaseInquiryGrd, SQLMAPNAMESPACE+"updatePurchaseInquiryGrd")==1;
	}
	/**
	 * 批量更新销售询价列表
	 * @param list
	 */
	public void batchUpdataPurchaseInquiryGrd(List<PurchaseInquiryGrd> list){
		this.batchInsertListObject(list,SQLMAPNAMESPACE+"updatePurchaseInquiryGrd");
	}
	/**
	 * 通过组合主键只更新状态
	 * @param PurchaseInquiryGrd
	 * @return
	 */
	public boolean updateStatus(PurchaseInquiryGrd PurchaseInquiryGrd){
		return this.updateObject(PurchaseInquiryGrd, SQLMAPNAMESPACE+"updateStatusByPK")==1;
	}
	/**
	 * 通过组合组件删除销售询价列表
	 * @param salesInquiryId
	 * @param goodsId
	 * @return
	 */
	public boolean deletePurchaseInquiryGrd(String purchaseInquiryId,String goodsId){
		Map<String, String> params=new HashMap<String, String>();
		params.put("purchaseInquiryId", purchaseInquiryId);
		params.put("goodsId", goodsId);
		return this.deleteObject(params, SQLMAPNAMESPACE+"deletePurchaseInquiryGrdByPK")==1;
	}
	/**
	 * 通过条件删除销售询价列表
	 * @param PurchaseInquiryGrd
	 */
	public void deletePurchaseInquiryGrd(PurchaseInquiryGrd PurchaseInquiryGrd){
		this.deleteObject(PurchaseInquiryGrd, SQLMAPNAMESPACE+"deletePurchaseInquiryGrd");
	}
	/**
	 * 
	 * @param salesInquiryId
	 * @return
	 */
	public Integer getPurchaseInquiryGrdCountBySalesInquiryId(String purchaseInquiryId){
		return (Integer)this.getSqlMapClientTemplate().queryForObject(SQLMAPNAMESPACE+"getPurchaseInquiryGrdCountByPurchaseInquiryId", purchaseInquiryId);
	}
	/**
	 * 
	 * @param salesInquiryId
	 * @return
	 */
	public boolean deletePurchaseInquiryGrdByPurchaseInquiryId(String purchaseInquiryId){
		return this.deleteObject(purchaseInquiryId, SQLMAPNAMESPACE+"deletePurchaseInquiryGrdByPurchaseInquiryId")>0;
	}
}
