/**
 * 
 */
package com.radius.invoicing.ibatis.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.invoicing.ibatis.dao.SalesContractPaymentDao;
import com.radius.invoicing.ibatis.model.SalesContractPayment;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 销售合同_付款
 */
@Repository
public class SalesContractPaymentDaoImpl extends BaseIbatisDaoImpl<SalesContractPayment> implements SalesContractPaymentDao {

	private final String SQLMAPNAMESPACE="salesContractPaymentSqlMap.";
	
	/**
	 * 通过主键获取销售合同付款信息
	 * @param contractId
	 * @return
	 */
	public SalesContractPayment getSalesContractPaymentByPk(String contractId){
		return this.getObjectByCondition(contractId, SQLMAPNAMESPACE+"getSalesContractPaymentByPk");
	}
	
	/**
	 * 通过条件查询
	 * @param p
	 * @return
	 */
	public List<SalesContractPayment> getSalesContractPayment(SalesContractPayment p){
		return this.getListObject(p, SQLMAPNAMESPACE+"getSalesContractPayment");
	}
	
	/**
	 * 保存销售合同信息
	 * @param p
	 */
	public void insertSalesContractPayment(SalesContractPayment p){
		this.insertObject(p, SQLMAPNAMESPACE+"insert");
	}
	
	/**
	 * 批量保存销售合同信息
	 * @param list
	 */
	public void batchInsertSalesContractPayment(List<SalesContractPayment> list){
		this.batchInsertListObject(list, SQLMAPNAMESPACE+"insert");
	}
	
	/**
	 * 更新销售合同信息
	 * @param p
	 * @return
	 */
	public boolean updateSalesContractPaymentByPK(SalesContractPayment p){
		return this.updateObject(p, SQLMAPNAMESPACE+"updateSalesContractPaymentByPK")==1;
	}
	/**
	 * 更新销售合同信息
	 * @param p
	 * @return
	 */
	public void updateSalesContractPaymentStatusByContractId(SalesContractPayment p){
		 this.updateObject(p, SQLMAPNAMESPACE+"updateSalesContractPaymentStatusByContractId");
	}
	
	/**
	 * 通过条件删除销售合同
	 * @param p
	 */
	public void deleteSalesContractPayment(SalesContractPayment p){
		this.deleteObject(p, SQLMAPNAMESPACE+"deleteSalesContractPayment");
	}
	
	/**
	 * 通过主键删除销售合同信息
	 * @param contractId
	 */
	public void deleteSalesContractPaymentByPK(String contractId){
		this.deleteObject(contractId, SQLMAPNAMESPACE+"deleteSalesContractPaymentByPK");
	}
}
