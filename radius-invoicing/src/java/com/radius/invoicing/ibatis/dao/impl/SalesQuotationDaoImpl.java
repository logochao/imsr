/**
 * 
 */
package com.radius.invoicing.ibatis.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.invoicing.ibatis.dao.SalesQuotationDao;
import com.radius.invoicing.ibatis.model.SalesQuotation;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 销售报价Dao
 */
@Repository
public class SalesQuotationDaoImpl extends BaseIbatisDaoImpl<SalesQuotation> implements SalesQuotationDao{

private final String SQLMAPNAMESPACE="salesQuotationSqlMap.";
	
	public SalesQuotation getSalesQuotationById(String salesQuotationId){
		return this.getObjectByCondition(salesQuotationId, SQLMAPNAMESPACE+"getSalesQuotationByPk");
	}
	
	public List<SalesQuotation> getSalesQuotationList(SalesQuotation salesQuotation){
		return this.getListObject(salesQuotation, SQLMAPNAMESPACE+"getSalesQuotation");
	}
	
	public void insert(SalesQuotation salesQuotation){
		 getSqlMapClientTemplate().insert(SQLMAPNAMESPACE+"insert", salesQuotation);
	}
	
	public void  batchInsert(List<SalesQuotation> list){
		this.batchInsertListObject(list, SQLMAPNAMESPACE+".insert");
	}
	
	public  boolean updateSalesQuotation(SalesQuotation salesQuotation){
		return this.updateObject(salesQuotation, SQLMAPNAMESPACE+"updateSalesQuotationById")==1;
	}
	
	public boolean updateStatusBySalesQuotationId(SalesQuotation salesQuotation){
		return this.updateObject(salesQuotation, SQLMAPNAMESPACE+"updateStatusBySalesQuotationId")==1;
	}
	
	public void batchUpdateSalesQuotation(List<SalesQuotation> list){
		this.batchInsertListObject(list, SQLMAPNAMESPACE+"updateSalesQuotationById");
	}
	
	public void deleteSalesQuotation(SalesQuotation salesQuotation){
		this.deleteObject(salesQuotation, SQLMAPNAMESPACE+"deleteSalesQuotation");
	}
	
	public void deleteSalesQuotation(String salesQuotationId){
		this.deleteObject(salesQuotationId, SQLMAPNAMESPACE+"deleteSalesQuotationByPK");
	}
}
