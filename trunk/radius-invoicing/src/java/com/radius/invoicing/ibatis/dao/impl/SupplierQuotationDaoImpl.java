package com.radius.invoicing.ibatis.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.invoicing.ibatis.dao.SupplierQuotationDao;
import com.radius.invoicing.ibatis.model.SupplierQuotation;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
@Repository
public class SupplierQuotationDaoImpl extends BaseIbatisDaoImpl<SupplierQuotation> implements SupplierQuotationDao{

	private final String SQLMAPNAMESPACE="supplierQuotationSqlMap.";
	
	public SupplierQuotation getSupplierQuotationById(String supplierQuotationId){
		return this.getObjectByCondition(supplierQuotationId, SQLMAPNAMESPACE+"getSupplierQuotationByPk");
	}
	
	public List<SupplierQuotation> getSupplierQuotationList(SupplierQuotation supplierQuotation){
		return this.getListObject(supplierQuotation, SQLMAPNAMESPACE+"getSupplierQuotation");
	}
	
	public void insert(SupplierQuotation supplierQuotation){
		 getSqlMapClientTemplate().insert(SQLMAPNAMESPACE+"insert", supplierQuotation);
	}
	
	public void  batchInsert(List<SupplierQuotation> list){
		this.batchInsertListObject(list, SQLMAPNAMESPACE+".insert");
	}
	
	public  boolean updateSupplierQuotation(SupplierQuotation SupplierQuotation){
		return this.updateObject(SupplierQuotation, SQLMAPNAMESPACE+"updateSupplierQuotationByPK")==1;
	}
	
	public boolean updateStatusBySupplierQuotationId(SupplierQuotation supplierQuotation){
		return this.updateObject(supplierQuotation, SQLMAPNAMESPACE+"updateStatusBySupplierQuotationId")==1;
	}
	
	public void batchUpdateSupplierQuotation(List<SupplierQuotation> list){
		this.batchInsertListObject(list, SQLMAPNAMESPACE+"updateSupplierQuotation");
	}
	
	public void deleteSupplierQuotation(SupplierQuotation supplierQuotation){
		this.deleteObject(supplierQuotation, SQLMAPNAMESPACE+"deleteSupplierQuotation");
	}
	
	public void deleteSupplierQuotation(String supplierQuotationId){
		this.deleteObject(supplierQuotationId, SQLMAPNAMESPACE+"deleteSupplierQuotationByPK");
	}
}
