package com.radius.invoicing.ibatis.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.invoicing.ibatis.dao.PurchaseInquiryDao;
import com.radius.invoicing.ibatis.model.PurchaseInquiry;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
@Repository
public class PurchaseInquiryDaoImpl extends BaseIbatisDaoImpl<PurchaseInquiry> implements PurchaseInquiryDao{

	private final String SQLMAPNAMESPACE="purchaseInquirySqlMap.";
	
	public PurchaseInquiry getPurchaseInquiryById(String purchaseInquiryId){
		return this.getObjectByCondition(purchaseInquiryId, SQLMAPNAMESPACE+"getPurchaseInquiryByPk");
	}
	
	public List<PurchaseInquiry> getPurchaseInquiryList(PurchaseInquiry purchaseInquiry){
		return this.getListObject(purchaseInquiry, SQLMAPNAMESPACE+"getPurchaseInquiry");
	}
	
	public void insert(PurchaseInquiry purchaseInquiry){
		 getSqlMapClientTemplate().insert(SQLMAPNAMESPACE+"insert", purchaseInquiry);
	}
	
	public void  batchInsert(List<PurchaseInquiry> list){
		this.batchInsertListObject(list, SQLMAPNAMESPACE+".insert");
	}
	
	public  boolean updatePurchaseInquiry(PurchaseInquiry purchaseInquiry){
		return this.updateObject(purchaseInquiry, SQLMAPNAMESPACE+"updatePurchaseInquiryByPK")==1;
	}
	
	public boolean updateStatusByPurchaseInquiryId(PurchaseInquiry purchaseInquiry){
		return this.updateObject(purchaseInquiry, SQLMAPNAMESPACE+"updateStatusByPurchaseInquiryId")==1;
	}
	
	public void batchUpdatePurchaseInquiry(List<PurchaseInquiry> list){
		this.batchInsertListObject(list, SQLMAPNAMESPACE+"updatePurchaseInquiryByPK");
	}
	
	public void deletePurchaseInquiry(PurchaseInquiry purchaseInquiry){
		this.deleteObject(purchaseInquiry, SQLMAPNAMESPACE+"deletePurchaseInquiry");
	}
	
	public void deletePurchaseInquiry(String PurchaseInquiryId){
		this.deleteObject(PurchaseInquiryId, SQLMAPNAMESPACE+"deletePurchaseInquiryByPK");
	}
}
