/**
 * 
 */
package com.radius.invoicing.ibatis.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.invoicing.ibatis.dao.PurchaseContractPaymentGrdDao;
import com.radius.invoicing.ibatis.model.PurchaseContractPaymentGrd;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 采购合同_付款_明细Dao
 */
@Repository
public class PurchaseContractPaymentGrdDaoImpl extends BaseIbatisDaoImpl<PurchaseContractPaymentGrd> implements PurchaseContractPaymentGrdDao{

	private final String SQLMAPNAMESPACE="purchaseContractPaymentGrdSqlMap.";
	
	/**
	 * 通过主键获取明细
	 * @param id
	 * @return
	 */
	public PurchaseContractPaymentGrd getPurchaseContractPaymentGrdByPk(Integer id){
		return this.getObjectByCondition(id, SQLMAPNAMESPACE+"getPurchaseContractPaymentGrdByPk");
	}
	
	/**
	 * 通过条件查询明细
	 * @param g
	 * @return
	 */
	public List<PurchaseContractPaymentGrd> getPurchaseContractPaymentGrd(PurchaseContractPaymentGrd g){
		return this.getListObject(g, SQLMAPNAMESPACE+"getPurchaseContractPaymentGrd");
	}
	
	/**
	 * 保存明细
	 * @param g
	 */
	public void insertPurchaseContractPaymentGrd(PurchaseContractPaymentGrd g){
		this.insertObject(g, SQLMAPNAMESPACE+"insert");
	}
	/**
	 * 批量保存明细
	 * @param list
	 */
	public void batchInsertPurchaseContractPaymentGrd(List<PurchaseContractPaymentGrd> list){
		this.batchInsertListObject(list, SQLMAPNAMESPACE+"insert");
	}
	
	/**
	 * 更新明细
	 * @param g
	 * @return
	 */
	public boolean updatePurchaseContractPaymentGrdByPK(PurchaseContractPaymentGrd g){
		return this.updateObject(g, SQLMAPNAMESPACE+"PurchaseContractPaymentGrd")==1;
	}
	/**
	 * 通过主键删除明细
	 * @param id
	 */
	public void deletePurchaseContractPaymentGrdByPK(Integer id){
		this.deleteObject(id, SQLMAPNAMESPACE+"deletePurchaseContractPaymentGrdByPK");
	}
	/**
	 * 通过条件删除明细
	 * @param g
	 */
	public void deletePurchaseContractPaymentGrd(PurchaseContractPaymentGrd g){
		this.deleteObject(g, SQLMAPNAMESPACE+"deletePurchaseContractPaymentGrd");
	}
	/**
	 * 更新采购支付列表状态
	 * @param purchaseContractPaymentGrd
	 * @return
	 */
	public boolean updatePurchaseContractPaymentGrdStatusBycontractId(PurchaseContractPaymentGrd purchaseContractPaymentGrd){
		return this.updateObject(purchaseContractPaymentGrd, SQLMAPNAMESPACE+"updatePurchaseContractPaymentGrdStatusBycontractId")==1;
	}
	
	
	public Integer getPurchaseContractPaymentGrdCountByContractId(String contractId){
		return (Integer)this.getSqlMapClientTemplate().queryForObject(SQLMAPNAMESPACE+"getPurchaseContractPaymentGrdCountByContractId", contractId);
	}
	
	public boolean deletePurchaseContractPaymentGrdByContractId(String contractId){
		return this.deleteObject(contractId, SQLMAPNAMESPACE+"deletePurchaseContractPaymentGrdByContractId")==1;
	}
}
