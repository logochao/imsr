package com.radius.invoicing.ibatis.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.invoicing.ibatis.dao.SalesInquiryGrdDao;
import com.radius.invoicing.ibatis.model.SalesInquiryGrd;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 销售商品询价列表
 */
@Repository
public class SalesInquiryGrdDaoImpl extends BaseIbatisDaoImpl<SalesInquiryGrd> implements SalesInquiryGrdDao {

	private final String SQLMAPNAMESPACE="salesInquiryGrdSqlMap.";
	
	/**
	 * 通过组合主键查询销售询价列表
	 * @param salesInquiryId
	 * @param goodsId
	 * @return
	 */
	public SalesInquiryGrd  getSalesInquiryGrd(String salesInquiryId,String goodsId){
		Map<String, String> params=new HashMap<String, String>();
		params.put("salesInquiryId", salesInquiryId);
		params.put("goodsId", goodsId);
		return this.getObjectByCondition(params, SQLMAPNAMESPACE+"getSalesInquiryGrdByPk");
	}
	/**
	 * 通过条件查询销售询价列表
	 * @param salesInquiryGrd
	 * @return
	 */
	public List<SalesInquiryGrd> getSalesInquiryGrdList(SalesInquiryGrd salesInquiryGrd){
		return this.getListObject(salesInquiryGrd, SQLMAPNAMESPACE+"getSalesInquiryGrd");
	}
	/**
	 * 保存销售询价
	 * @param salesInquiryGrd
	 */
	public void insert(SalesInquiryGrd salesInquiryGrd){
		this.insertObject(salesInquiryGrd, SQLMAPNAMESPACE+"insert");
	}
	/**
	 * 批量保存销售询价列表
	 * @param list
	 */
	public void batchInsertSalesInquiryGrd(List<SalesInquiryGrd> list){
		this.batchInsertListObject(list, SQLMAPNAMESPACE+"insert");
	}
	/**
	 * 更新销售询价列表
	 * @param salesInquiryGrd
	 * @return
	 */
	public boolean updateSalesInquiryGrd(SalesInquiryGrd salesInquiryGrd){
		return this.updateObject(salesInquiryGrd, SQLMAPNAMESPACE+"updateSalesInquiryGrd")==1;
	}
	/**
	 * 批量更新销售询价列表
	 * @param list
	 */
	public void batchUpdataSalesInquiryGrd(List<SalesInquiryGrd> list){
		this.batchInsertListObject(list,SQLMAPNAMESPACE+"updateSalesInquiryGrd");
	}
	/**
	 * 通过组合主键只更新状态
	 * @param salesInquiryGrd
	 * @return
	 */
	public boolean updateStatus(SalesInquiryGrd salesInquiryGrd){
		return this.updateObject(salesInquiryGrd, SQLMAPNAMESPACE+"updateStatusByPK")==1;
	}
	/**
	 * 通过组合组件删除销售询价列表
	 * @param salesInquiryId
	 * @param goodsId
	 * @return
	 */
	public boolean deleteSalesInquiryGrd(String salesInquiryId,String goodsId){
		Map<String, String> params=new HashMap<String, String>();
		params.put("salesInquiryId", salesInquiryId);
		params.put("goodsId", goodsId);
		return this.deleteObject(params, SQLMAPNAMESPACE+"deleteSalesInquiryGrdByPK")==1;
	}
	/**
	 * 通过条件删除销售询价列表
	 * @param salesInquiryGrd
	 */
	public void deleteSalesInquiryGrd(SalesInquiryGrd salesInquiryGrd){
		this.deleteObject(salesInquiryGrd, SQLMAPNAMESPACE+"deleteSalesInquiryGrd");
	}
	/**
	 * 
	 * @param salesInquiryId
	 * @return
	 */
	public Integer getSalesInquiryGrdCountBySalesInquiryId(String salesInquiryId){
		return (Integer)this.getSqlMapClientTemplate().queryForObject(SQLMAPNAMESPACE+"getSalesInquiryGrdCountBySalesInquiryId", salesInquiryId);
	}
	/**
	 * 
	 * @param salesInquiryId
	 * @return
	 */
	public boolean deleteSalesInquiryGrdBySalesInquiryId(String salesInquiryId){
		return this.deleteObject(salesInquiryId, SQLMAPNAMESPACE+"deleteSalesInquiryGrdBySalesInquiryId")>0;
	}
}
