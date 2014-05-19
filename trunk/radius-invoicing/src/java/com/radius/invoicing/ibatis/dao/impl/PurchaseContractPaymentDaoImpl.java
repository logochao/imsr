/**
 * 
 */
package com.radius.invoicing.ibatis.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.invoicing.ibatis.dao.PurchaseContractPaymentDao;
import com.radius.invoicing.ibatis.model.PurchaseContractPayment;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 采购合同_付款
 */
@Repository
public class PurchaseContractPaymentDaoImpl extends BaseIbatisDaoImpl<PurchaseContractPayment> implements PurchaseContractPaymentDao{

	private final String SQLMAPNAMESPACE="purchaseContractPaymentSqlMap.";
	
	/**
	 * 通过主键获取采购合同付款信息
	 * @param contractId
	 * @return
	 */
	public PurchaseContractPayment getPurchaseContractPaymentByPk(String contractId){
		return this.getObjectByCondition(contractId, SQLMAPNAMESPACE+"getPurchaseContractPaymentByPk");
	}
	
	/**
	 * 通过条件查询
	 * @param p
	 * @return
	 */
	public List<PurchaseContractPayment> getPurchaseContractPayment(PurchaseContractPayment p){
		return this.getListObject(p, SQLMAPNAMESPACE+"getPurchaseContractPayment");
	}
	
	/**
	 * 保存采购合同信息
	 * @param p
	 */
	public void insertPurchaseContractPayment(PurchaseContractPayment p){
		this.insertObject(p, SQLMAPNAMESPACE+"insert");
	}
	
	/**
	 * 批量保存采购合同信息
	 * @param list
	 */
	public void batchInsertPurchaseContractPayment(List<PurchaseContractPayment> list){
		this.batchInsertListObject(list, SQLMAPNAMESPACE+"insert");
	}
	
	/**
	 * 更新采购合同信息
	 * @param p
	 * @return
	 */
	public boolean updatePurchaseContractPaymentByPK(PurchaseContractPayment p){
		return this.updateObject(p, SQLMAPNAMESPACE+"updatePurchaseContractPaymentByPK")==1;
	}
	
	/**
	 * 通过条件删除采购合同
	 * @param p
	 */
	public void deletePurchaseContractPayment(PurchaseContractPayment p){
		this.deleteObject(p, SQLMAPNAMESPACE+"deletePurchaseContractPayment");
	}
	
	/**
	 * 通过主键删除采购合同信息
	 * @param contractId
	 */
	public void deletePurchaseContractPaymentByPK(String contractId){
		this.deleteObject(contractId, SQLMAPNAMESPACE+"deletePurchaseContractPaymentByPK");
	}
	/**
	 * 更新采购合同支付状态
	 * @param payment
	 * @return
	 */
	public boolean updateStatusByContractId(PurchaseContractPayment payment){
		return this.updateObject(payment, SQLMAPNAMESPACE+"updateStatusByContractId")==1;
	}
	
	public Integer getPurchaseContractPaymentCountByContractId(String contractId){
		return (Integer)this.getSqlMapClientTemplate().queryForObject(SQLMAPNAMESPACE+"getPurchaseContractPaymentCountByContractId", contractId);
	}
}
