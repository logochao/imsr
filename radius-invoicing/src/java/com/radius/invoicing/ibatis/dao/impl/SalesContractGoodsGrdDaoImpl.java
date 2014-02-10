/**
 * 
 */
package com.radius.invoicing.ibatis.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.invoicing.ibatis.dao.SalesContractGoodsGrdDao;
import com.radius.invoicing.ibatis.model.SalesContractGoodsGrd;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
@Repository
public class SalesContractGoodsGrdDaoImpl extends BaseIbatisDaoImpl<SalesContractGoodsGrd> implements SalesContractGoodsGrdDao{

	private final String SQLMAPNAMESPACE="salesContractGoodsGrdSqlMap.";
	
	/**
	 * 通过主键查询采购商品信息
	 * @param contractId
	 * @param goodsId
	 * @return
	 */
	public SalesContractGoodsGrd getSalesContractGoodsGrdByPk(String contractId,String goodsId){
		Map<String, String> params=new HashMap<String, String>();
		params.put("contractId", contractId);
		params.put("goodsId", goodsId);
		return this.getObjectByCondition(params, SQLMAPNAMESPACE+"getSalesContractGoodsGrdByPk");
	}
	/**
	 * 通过条件查询采购商品信息
	 * @param g
	 * @return
	 */
	public List<SalesContractGoodsGrd> getSalesContractGoodsGrd(SalesContractGoodsGrd g){
		return this.getListObject(g, SQLMAPNAMESPACE+"getSalesContractGoodsGrd");
	}
	
	/**
	 * 保存
	 * @param g
	 */
	public void insertSalesContractGoodsGrd(SalesContractGoodsGrd g){
		this.insertObject(g, SQLMAPNAMESPACE+"insert");
	}
	
	/**
	 * 批量保存
	 * @param list
	 */
	public void batchInsertSalesContractGoodsGrd(List<SalesContractGoodsGrd> list){
		this.batchInsertListObject(list, SQLMAPNAMESPACE+"insert");
	}
	
	/**
	 * 更新
	 * @param g
	 * @return
	 */
	public boolean updateSalesContractGoodsGrdByPK(SalesContractGoodsGrd g){
		return this.updateObject(g, SQLMAPNAMESPACE+"updateSalesContractGoodsGrdByPK")==1;
	}
	/**
	 * 批量更新
	 * @param list
	 */
	public void batchUpdateSalesContractGoodsGrdByPK(List<SalesContractGoodsGrd> list){
		this.updateListObject(list, SQLMAPNAMESPACE+"updateSalesContractGoodsGrdByPK");
	}
	/**
	 * 删除销售商品
	 * @param g
	 */
	public void deleteSalesContractGoodsGrd(SalesContractGoodsGrd g){
		this.deleteObject(g, SQLMAPNAMESPACE+"deleteSalesContractGoodsGrd");
	}
	
	/**
	 * 通过主键删除销售商品信息
	 * @param contractId
	 * @param goodsId
	 */
	public void deleteSalesContractGoodsGrdByPK(String contractId,String goodsId){
		Map<String, String> params=new HashMap<String, String>();
		params.put("contractId", contractId);
		params.put("goodsId", goodsId);
		this.deleteObject(params, SQLMAPNAMESPACE+"deleteSalesContractGoodsGrdByPK");
	}
}
