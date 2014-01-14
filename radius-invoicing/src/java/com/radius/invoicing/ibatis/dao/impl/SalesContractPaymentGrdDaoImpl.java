/**
 * 
 */
package com.radius.invoicing.ibatis.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.invoicing.ibatis.dao.SalesContractPaymentGrdDao;
import com.radius.invoicing.ibatis.model.SalesContractPaymentGrd;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 采购合同_付款_明细Dao
 */
@Repository
public class SalesContractPaymentGrdDaoImpl extends BaseIbatisDaoImpl<SalesContractPaymentGrd> implements SalesContractPaymentGrdDao{

	private final String SQLMAPNAMESPACE="salesContractPaymentGrdSqlMap.";
	
	/**
	 * 通过主键获取明细
	 * @param id
	 * @return
	 */
	public SalesContractPaymentGrd getSalesContractPaymentGrdByPk(Integer id){
		return this.getObjectByCondition(id, SQLMAPNAMESPACE+"getSalesContractPaymentGrdByPk");
	}
	
	/**
	 * 通过条件查询明细
	 * @param g
	 * @return
	 */
	public List<SalesContractPaymentGrd> getSalesContractPaymentGrd(SalesContractPaymentGrd g){
		return this.getListObject(g, SQLMAPNAMESPACE+"getSalesContractPaymentGrd");
	}
	
	/**
	 * 保存明细
	 * @param g
	 */
	public void insertSalesContractPaymentGrd(SalesContractPaymentGrd g){
		this.insertObject(g, SQLMAPNAMESPACE+"insert");
	}
	/**
	 * 批量保存明细
	 * @param list
	 */
	public void batchInsertSalesContractPaymentGrd(List<SalesContractPaymentGrd> list){
		this.batchInsertListObject(list, SQLMAPNAMESPACE+"insert");
	}
	
	/**
	 * 更新明细
	 * @param g
	 * @return
	 */
	public boolean updateSalesContractPaymentGrdByPK(SalesContractPaymentGrd g){
		return this.updateObject(g, SQLMAPNAMESPACE+"SalesContractPaymentGrd")==1;
	}
	/**
	 * 通过主键删除明细
	 * @param id
	 */
	public void deleteSalesContractPaymentGrdByPK(Integer id){
		this.deleteObject(id, SQLMAPNAMESPACE+"deleteSalesContractPaymentGrdByPK");
	}
	/**
	 * 通过条件删除明细
	 * @param g
	 */
	public void deleteSalesContractPaymentGrd(SalesContractPaymentGrd g){
		this.deleteObject(g, SQLMAPNAMESPACE+"deleteSalesContractPaymentGrd");
	}
}
