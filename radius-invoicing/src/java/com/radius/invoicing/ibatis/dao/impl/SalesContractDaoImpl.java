/**
 * 
 */
package com.radius.invoicing.ibatis.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.invoicing.ibatis.dao.SalesContractDao;
import com.radius.invoicing.ibatis.model.SalesContract;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
@Repository
public class SalesContractDaoImpl extends BaseIbatisDaoImpl<SalesContract> implements SalesContractDao{

	private final String SQLMAPNAMESPACE="salesContractSqlMap.";
	
	/**
	 * 根据合同号获取销售合同信息
	 * @param contractId
	 * @return
	 */
	public SalesContract getSalesContractById(String contractId){
		return this.getObjectByCondition(contractId, SQLMAPNAMESPACE+"getSalesContractById");
	}
	
	/**
	 * 通过条件查询
	 * @param s
	 * @return
	 */
	public List<SalesContract> getSalesContractByCondition(SalesContract s){
		return this.getListObject(s, SQLMAPNAMESPACE+"getSalesContractByCondition");
	}
	/**
	 * 保存采购合同信息
	 * @param s
	 */
	public void insertSalesContract(SalesContract s){
		this.insertObject(s, SQLMAPNAMESPACE+"insert");
	}
	/**
	 * 更新采购合同信息
	 * @param s
	 * @return
	 */
	public boolean updateSalesContractById(SalesContract s){
		return this.updateObject(s, SQLMAPNAMESPACE+"updateSalesContractById")==1;
	}
	
	/**
	 * 删除采购合同
	 * @param s
	 */
	public void deleteSalesContract(SalesContract s){
		this.deleteObject(s, SQLMAPNAMESPACE+"deleteSalesContract");
	}
	/**
	 * 通过合同编号删除采购合同信息
	 * @param id
	 */
	public void deleteSalesContractById(String id){
		this.deleteObject(id, SQLMAPNAMESPACE+"deleteSalesContractById");
	}
	
	public void updateSalesContractStatusById(SalesContract s){
		this.updateObject(s, SQLMAPNAMESPACE+"updateSalesContractStatusById");
	}
	
	/**
	 * 通过客户编号获取销售合同信息
	 * @param s
	 * @return
	 */
	public List<SalesContract> getSalesContractByCustomerId(SalesContract s){
		return this.getListObject(s, SQLMAPNAMESPACE+"getSalesContractByCustomerId");
	}
}
