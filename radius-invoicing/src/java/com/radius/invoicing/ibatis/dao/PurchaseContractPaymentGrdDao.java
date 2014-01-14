package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.invoicing.ibatis.model.PurchaseContractPaymentGrd;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface PurchaseContractPaymentGrdDao {

	/**
	 * 通过主键获取明细
	 * @param id
	 * @return
	 */
	public PurchaseContractPaymentGrd getPurchaseContractPaymentGrdByPk(
			Integer id);

	/**
	 * 通过条件查询明细
	 * @param g
	 * @return
	 */
	public List<PurchaseContractPaymentGrd> getPurchaseContractPaymentGrd(
			PurchaseContractPaymentGrd g);

	/**
	 * 保存明细
	 * @param g
	 */
	public void insertPurchaseContractPaymentGrd(PurchaseContractPaymentGrd g);

	/**
	 * 批量保存明细
	 * @param list
	 */
	public void batchInsertPurchaseContractPaymentGrd(
			List<PurchaseContractPaymentGrd> list);

	/**
	 * 更新明细
	 * @param g
	 * @return
	 */
	public boolean updatePurchaseContractPaymentGrdByPK(
			PurchaseContractPaymentGrd g);

	/**
	 * 通过主键删除明细
	 * @param id
	 */
	public void deletePurchaseContractPaymentGrdByPK(Integer id);

	/**
	 * 通过条件删除明细
	 * @param g
	 */
	public void deletePurchaseContractPaymentGrd(PurchaseContractPaymentGrd g);

}