/**
 * 
 */
package com.radius.invoicing.ibatis.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.invoicing.ibatis.dao.SalesQuotationGrdDao;
import com.radius.invoicing.ibatis.model.SalesQuotationGrd;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 销售报价商品明细Dao
 */
@Repository
public class SalesQuotationGrdDaoImpl extends BaseIbatisDaoImpl<SalesQuotationGrd> implements SalesQuotationGrdDao{

	private final  String SQLMAPNAMESPACE="salesQuotationGrdSqlMap";
	
	/**
	 * 根据商品编号+销售报价单编号 获取销售报价商品明细
	 * @param grd
	 * @return
	 */
	public SalesQuotationGrd getSaleQuotationGrdByPk(SalesQuotationGrd grd){
		return this.getObjectByCondition(grd, SQLMAPNAMESPACE+".getSaleQuotationGrdByPk");
	}
	
	/**
	 * 根据条件获取销售报价明细
	 * @param grd
	 * @return
	 */
	public List<SalesQuotationGrd> getSaleQuotationGrdByCondition( SalesQuotationGrd grd){
		return this.getListObject(grd, SQLMAPNAMESPACE+".getSaleQuotationGrdByCondition");
	}
	/**
	 * 保存销售报价订单
	 * @param grd
	 */
	public void insertSaleQuotationGrd(SalesQuotationGrd grd){
		this.insertObject(grd, SQLMAPNAMESPACE+".insert");
	}
	
	/**
	 * 批量保存销售报价
	 * @param list
	 */
	public void batchInsertSaleQuotationGrd(List<SalesQuotationGrd> list){
		this.batchInsertListObject(list, SQLMAPNAMESPACE+".insert");
	}
	
	/**
	 * 更新销售报价信息
	 * @param grd
	 * @return
	 */
	public boolean updateSaleQuotationGrdByPk(SalesQuotationGrd grd){
		return this.updateObject(grd, SQLMAPNAMESPACE+".updateSaleQuotationGrdById")==1;
	}
	
	/**
	 * 删除销售报价
	 * @param grd
	 */
	public void deleteSaleQuotationGrd(SalesQuotationGrd grd){
		this.deleteObject(grd, SQLMAPNAMESPACE+".deleteSaleQuotationGrd");
	}
	
	public Integer getSalesQuotationGrdCountByQuotationId(String quotationId){
		return (Integer)this.getSqlMapClientTemplate().queryForObject(SQLMAPNAMESPACE+"getSalesQuotationGrdCountByQuotationId", quotationId);
	}
	
	public void deleteSalesQuotationGrdByQuotationId(String quotationId){
		this.deleteObject(quotationId, SQLMAPNAMESPACE+"deleteSalesQuotationGrdByQuotationId");
	}
}
