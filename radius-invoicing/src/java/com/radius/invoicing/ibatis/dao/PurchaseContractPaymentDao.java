package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.invoicing.ibatis.model.PurchaseContractPayment;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface PurchaseContractPaymentDao {

	/**
	 * 通过主键获取采购合同付款信息
	 * @param contractId
	 * @return
	 */
	public PurchaseContractPayment getPurchaseContractPaymentByPk(
			String contractId);

	/**
	 * 通过条件查询
	 * @param p
	 * @return
	 */
	public List<PurchaseContractPayment> getPurchaseContractPayment(
			PurchaseContractPayment p);

	/**
	 * 保存采购合同信息
	 * @param p
	 */
	public void insertPurchaseContractPayment(PurchaseContractPayment p);

	/**
	 * 批量保存采购合同信息
	 * @param list
	 */
	public void batchInsertPurchaseContractPayment(
			List<PurchaseContractPayment> list);

	/**
	 * 更新采购合同信息
	 * @param p
	 * @return
	 */
	public boolean updatePurchaseContractPaymentByPK(PurchaseContractPayment p);

	/**
	 * 通过条件删除采购合同
	 * @param p
	 */
	public void deletePurchaseContractPayment(PurchaseContractPayment p);

	/**
	 * 通过主键删除采购合同信息
	 * @param contractId
	 */
	public void deletePurchaseContractPaymentByPK(String contractId);
	
	/**
	 * 更新采购合同支付状态
	 * @param payment
	 * @return
	 */
	public boolean updateStatusByContractId(PurchaseContractPayment payment);

}