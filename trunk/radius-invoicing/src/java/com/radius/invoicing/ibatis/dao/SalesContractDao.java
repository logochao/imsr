package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.invoicing.ibatis.model.SalesContract;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface SalesContractDao {

	/**
	 * 根据合同号获取销售合同信息
	 * @param contractId
	 * @return
	 */
	public SalesContract getSalesContractById(String contractId);

	/**
	 * 通过条件查询
	 * @param s
	 * @return
	 */
	public List<SalesContract> getSalesContractByCondition(SalesContract s);

	/**
	 * 保存采购合同信息
	 * @param s
	 */
	public void insertSalesContract(SalesContract s);

	/**
	 * 更新采购合同信息
	 * @param s
	 * @return
	 */
	public boolean updateSalesContractById(SalesContract s);

	/**
	 * 删除采购合同
	 * @param s
	 */
	public void deleteSalesContract(SalesContract s);

	/**
	 * 通过合同编号删除采购合同信息
	 * @param id
	 */
	public void deleteSalesContractById(String id);
	
	
	public void updateSalesContractStatusById(SalesContract s);
	
	/**
	 * 通过客户编号获取销售合同信息
	 * @param s
	 * @return
	 */
	public List<SalesContract> getSalesContractByCustomerId(SalesContract s);

}