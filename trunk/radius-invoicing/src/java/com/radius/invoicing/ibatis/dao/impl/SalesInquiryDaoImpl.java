package com.radius.invoicing.ibatis.dao.impl;

import java.util.List;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.invoicing.ibatis.dao.SalesInquiryDao;
import com.radius.invoicing.ibatis.model.SalesInquiry;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public class SalesInquiryDaoImpl extends BaseIbatisDaoImpl<SalesInquiry> implements SalesInquiryDao{

	private final String SQLMAPNAMESPACE="salesInquirySqlMap.";
	
	public SalesInquiry getSalesInquiryById(String salesInquiryId){
		return this.getObjectByCondition(salesInquiryId, SQLMAPNAMESPACE+"getSalesInquiryByPk");
	}
	
	public List<SalesInquiry> getSalesInquiryList(SalesInquiry salesInquiry){
		return this.getListObject(salesInquiry, SQLMAPNAMESPACE+"getSalesInquiry");
	}
	
	public void insert(SalesInquiry salesInquiry){
		 getSqlMapClientTemplate().insert(SQLMAPNAMESPACE+"insert", salesInquiry);
	}
	
	public void  batchInsert(List<SalesInquiry> list){
		this.batchInsertListObject(list, SQLMAPNAMESPACE+".insert");
	}
	
	public  boolean updateSalesInquiry(SalesInquiry salesInquiry){
		return this.updateObject(salesInquiry, SQLMAPNAMESPACE+"updateSalesInquiry")==1;
	}
	
	public boolean updateStatusBySalesInquiryId(SalesInquiry salesInquiry){
		return this.updateObject(salesInquiry, SQLMAPNAMESPACE+"updateStatusBySalesInquiryId")==1;
	}
	
	public void batchUpdateSalesInquiry(List<SalesInquiry> list){
		this.batchInsertListObject(list, SQLMAPNAMESPACE+"updateSalesInquiry");
	}
	
	public void deleteSalesInquiry(SalesInquiry salesInquiry){
		this.deleteObject(salesInquiry, SQLMAPNAMESPACE+"deleteSalesInquiry");
	}
	
	public void deletesalesInquiry(String salesInquiryId){
		this.deleteObject(salesInquiryId, SQLMAPNAMESPACE+"deleteSalesInquiryByPK");
	}
}
