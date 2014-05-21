package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.invoicing.ibatis.model.PurchaseInquiryGrd;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface PurchaseInquiryGrdDao {

	/**
	 * 通过组合主键查询销售询价列表
	 * @param salesInquiryId
	 * @param goodsId
	 * @return
	 */
	public PurchaseInquiryGrd getPurchaseInquiryGrd(String purchaseInquiryId,
			String goodsId);

	/**
	 * 通过条件查询销售询价列表
	 * @param PurchaseInquiryGrd
	 * @return
	 */
	public List<PurchaseInquiryGrd> getPurchaseInquiryGrdList(
			PurchaseInquiryGrd PurchaseInquiryGrd);

	/**
	 * 保存销售询价
	 * @param PurchaseInquiryGrd
	 */
	public void insert(PurchaseInquiryGrd PurchaseInquiryGrd);

	/**
	 * 批量保存销售询价列表
	 * @param list
	 */
	public void batchInsertPurchaseInquiryGrd(List<PurchaseInquiryGrd> list);

	/**
	 * 更新销售询价列表
	 * @param PurchaseInquiryGrd
	 * @return
	 */
	public boolean updatePurchaseInquiryGrd(
			PurchaseInquiryGrd PurchaseInquiryGrd);

	/**
	 * 批量更新销售询价列表
	 * @param list
	 */
	public void batchUpdataPurchaseInquiryGrd(List<PurchaseInquiryGrd> list);

	/**
	 * 通过组合主键只更新状态
	 * @param PurchaseInquiryGrd
	 * @return
	 */
	public boolean updateStatus(PurchaseInquiryGrd PurchaseInquiryGrd);

	/**
	 * 通过组合组件删除销售询价列表
	 * @param salesInquiryId
	 * @param goodsId
	 * @return
	 */
	public boolean deletePurchaseInquiryGrd(String purchaseInquiryId,
			String goodsId);

	/**
	 * 通过条件删除销售询价列表
	 * @param PurchaseInquiryGrd
	 */
	public void deletePurchaseInquiryGrd(PurchaseInquiryGrd PurchaseInquiryGrd);

	/**
	 * 
	 * @param salesInquiryId
	 * @return
	 */
	public Integer getPurchaseInquiryGrdCountBySalesInquiryId(
			String purchaseInquiryId);

	/**
	 * 
	 * @param salesInquiryId
	 * @return
	 */
	public boolean deletePurchaseInquiryGrdByPurchaseInquiryId(
			String purchaseInquiryId);

}