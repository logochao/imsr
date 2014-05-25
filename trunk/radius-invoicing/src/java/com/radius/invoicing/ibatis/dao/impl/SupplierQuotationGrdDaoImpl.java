package com.radius.invoicing.ibatis.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.invoicing.ibatis.dao.SupplierQuotationGrdDao;
import com.radius.invoicing.ibatis.model.SupplierQuotationGrd;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 销售商品询价列表
 */
@Repository
public class SupplierQuotationGrdDaoImpl extends BaseIbatisDaoImpl<SupplierQuotationGrd> implements SupplierQuotationGrdDao {

	private final String SQLMAPNAMESPACE="supplierQuotationGrdSqlMap.";
	
	/**
	 * 通过组合主键查询销售询价列表
	 * @param salesInquiryId
	 * @param goodsId
	 * @return
	 */
	public SupplierQuotationGrd  getSupplierQuotationGrd(String quotationId,String goodsId){
		Map<String, String> params=new HashMap<String, String>();
		params.put("quotationId", quotationId);
		params.put("goodsId", goodsId);
		return this.getObjectByCondition(params, SQLMAPNAMESPACE+"getSupplierQuotationGrdByPk");
	}
	/**
	 * 通过条件查询销售询价列表
	 * @param SupplierQuotationGrd
	 * @return
	 */
	public List<SupplierQuotationGrd> getSupplierQuotationGrdList(SupplierQuotationGrd supplierQuotationGrd){
		return this.getListObject(supplierQuotationGrd, SQLMAPNAMESPACE+"getSupplierQuotationGrd");
	}
	/**
	 * 保存销售询价
	 * @param SupplierQuotationGrd
	 */
	public void insert(SupplierQuotationGrd supplierQuotationGrd){
		this.insertObject(supplierQuotationGrd, SQLMAPNAMESPACE+"insert");
	}
	/**
	 * 批量保存销售询价列表
	 * @param list
	 */
	public void batchInsertSupplierQuotationGrd(List<SupplierQuotationGrd> list){
		this.batchInsertListObject(list, SQLMAPNAMESPACE+"insert");
	}
	/**
	 * 更新销售询价列表
	 * @param SupplierQuotationGrd
	 * @return
	 */
	public boolean updateSupplierQuotationGrd(SupplierQuotationGrd supplierQuotationGrd){
		return this.updateObject(supplierQuotationGrd, SQLMAPNAMESPACE+"updateSupplierQuotationGrd")==1;
	}
	/**
	 * 批量更新销售询价列表
	 * @param list
	 */
	public void batchUpdataSupplierQuotationGrd(List<SupplierQuotationGrd> list){
		this.batchInsertListObject(list,SQLMAPNAMESPACE+"updateSupplierQuotationGrd");
	}
//	/**
//	 * 通过组合主键只更新状态
//	 * @param SupplierQuotationGrd
//	 * @return
//	 */
//	public boolean updateStatus(SupplierQuotationGrd supplierQuotationGrd){
//		return this.updateObject(supplierQuotationGrd, SQLMAPNAMESPACE+"updateStatusByPK")==1;
//	}
	/**
	 * 通过组合组件删除销售询价列表
	 * @param quotationId
	 * @param goodsId
	 * @return
	 */
	public boolean deleteSupplierQuotationGrd(String quotationId,String goodsId){
		Map<String, String> params=new HashMap<String, String>();
		params.put("quotationId", quotationId);
		params.put("goodsId", goodsId);
		return this.deleteObject(params, SQLMAPNAMESPACE+"deleteSupplierQuotationGrdByPK")==1;
	}
	/**
	 * 通过条件删除销售询价列表
	 * @param SupplierQuotationGrd
	 */
	public void deleteSupplierQuotationGrd(SupplierQuotationGrd supplierQuotationGrd){
		this.deleteObject(supplierQuotationGrd, SQLMAPNAMESPACE+"deleteSupplierQuotationGrd");
	}
	/**
	 * 
	 * @param quotationId
	 * @return
	 */
	public Integer getSupplierQuotationGrdCountByquotationId(String quotationId){
		return (Integer)this.getSqlMapClientTemplate().queryForObject(SQLMAPNAMESPACE+"getSupplierQuotationGrdCountByQuotationId", quotationId);
	}
	/**
	 * 
	 * @param quotationId
	 * @return
	 */
	public boolean deleteSupplierQuotationGrdByquotationId(String quotationId){
		return this.deleteObject(quotationId, SQLMAPNAMESPACE+"deleteSupplierQuotationGrdByQuotationId")>0;
	}
}
