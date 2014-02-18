package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.invoicing.ibatis.model.SalesContractPayment;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface SalesContractPaymentDao {

	/**
	 * 通过主键获取销售合同付款信息
	 * @param contractId
	 * @return
	 */
	public SalesContractPayment getSalesContractPaymentByPk(String contractId);

	/**
	 * 通过条件查询
	 * @param p
	 * @return
	 */
	public List<SalesContractPayment> getSalesContractPayment(
			SalesContractPayment p);

	/**
	 * 保存销售合同信息
	 * @param p
	 */
	public void insertSalesContractPayment(SalesContractPayment p);

	/**
	 * 批量保存销售合同信息
	 * @param list
	 */
	public void batchInsertSalesContractPayment(List<SalesContractPayment> list);

	/**
	 * 更新销售合同信息
	 * @param p
	 * @return
	 */
	public boolean updateSalesContractPaymentByPK(SalesContractPayment p);

	/**
	 * 通过条件删除销售合同
	 * @param p
	 */
	public void deleteSalesContractPayment(SalesContractPayment p);

	/**
	 * 通过主键删除销售合同信息
	 * @param contractId
	 */
	public void deleteSalesContractPaymentByPK(String contractId);
	
	/**
	 * 更新销售合同信息
	 * @param p
	 * @return
	 */
	public void updateSalesContractPaymentStatusByContractId(SalesContractPayment p);

}