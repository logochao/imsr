package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.invoicing.ibatis.model.PurchaseContract;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface PurchaseContractDao {

	/**
	 * 通过主键获取采购合同对象
	 * @param id
	 * @return
	 */
	public PurchaseContract getPurchaseContractById(String id);

	/**
	 * 通过条件查询获取采购合同
	 * @param pc
	 * @return
	 */
	public List<PurchaseContract> getPurchaseContractByCondition(
			PurchaseContract pc);

	/**
	 * 保存采购合同
	 * @param pc
	 */
	public void insertPurchaseContract(PurchaseContract pc);

	/**
	 * 更新采购合同信息
	 * @param pc
	 * @return
	 */
	public boolean updatePurchaseContractById(PurchaseContract pc);

	/**
	 * 通过主键删除采购合同
	 * @param id
	 */
	public void deletePurchaseContractById(String id);

	/**
	 * 通过多条件删除采购合同
	 * @param pc
	 */
	public void deletePurchaseContract(PurchaseContract pc);

}