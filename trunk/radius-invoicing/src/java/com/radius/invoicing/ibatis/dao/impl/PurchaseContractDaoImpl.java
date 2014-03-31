/**
 * 
 */
package com.radius.invoicing.ibatis.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.invoicing.ibatis.dao.PurchaseContractDao;
import com.radius.invoicing.ibatis.model.PurchaseContract;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 采购合同Dao
 */
@Repository
@SuppressWarnings("unchecked")
public class PurchaseContractDaoImpl extends BaseIbatisDaoImpl<PurchaseContract> implements PurchaseContractDao{

	private final String SQLMAPNAMESPACE="purchaseContractSqlMap.";
	
	/**
	 * 通过主键获取采购合同对象
	 * @param id
	 * @return
	 */
	public  PurchaseContract getPurchaseContractById(String	 id){
		return this.getObjectByCondition(id, SQLMAPNAMESPACE+"getPurchaseContractById");
	}
	/**
	 * 通过条件查询获取采购合同
	 * @param pc
	 * @return
	 */
	public List<PurchaseContract> getPurchaseContractByCondition(PurchaseContract pc){
		return this.getSqlMapClientTemplate().queryForList(SQLMAPNAMESPACE+"getPurchaseContractByCondition",pc);
	}
	
	/**
	 * 保存采购合同
	 * @param pc
	 */
	public void insertPurchaseContract(PurchaseContract pc){
		this.insertObject(pc, SQLMAPNAMESPACE+"insert");
	}
	/**
	 * 更新采购合同信息
	 * @param pc
	 * @return
	 */
	public boolean updatePurchaseContractById(PurchaseContract pc){
		return this.updateObject(pc, SQLMAPNAMESPACE+"updatePurchaseContractById")==1;
	}
	/**
	 * 通过主键删除采购合同
	 * @param id
	 */
	public void deletePurchaseContractById(String id){
		this.deleteObject(id, SQLMAPNAMESPACE+"deletePurchaseContractById");
	}
	/**
	 * 通过多条件删除采购合同
	 * @param pc
	 */
	public void deletePurchaseContract(PurchaseContract pc){
		this.deleteObject(pc, SQLMAPNAMESPACE+"deletePurchaseContract");
	}
	
	/**
	 * 更新采购合同状态
	 * @param purchaseContract
	 * @return
	 */
	public boolean updatePurchaseContractStatusById(PurchaseContract purchaseContract){
		return this.updateObject(purchaseContract, SQLMAPNAMESPACE+"updatePurchaseContractStatusById")==1;
	}
}
