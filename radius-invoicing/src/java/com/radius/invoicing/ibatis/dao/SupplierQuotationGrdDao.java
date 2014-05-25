package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.invoicing.ibatis.model.SupplierQuotationGrd;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface SupplierQuotationGrdDao {

	/**
	 * 通过组合主键查询销售询价列表
	 * @param salesInquiryId
	 * @param goodsId
	 * @return
	 */
	public SupplierQuotationGrd getSupplierQuotationGrd(String quotationId,
			String goodsId);

	/**
	 * 通过条件查询销售询价列表
	 * @param SupplierQuotationGrd
	 * @return
	 */
	public List<SupplierQuotationGrd> getSupplierQuotationGrdList(
			SupplierQuotationGrd supplierQuotationGrd);

	/**
	 * 保存销售询价
	 * @param SupplierQuotationGrd
	 */
	public void insert(SupplierQuotationGrd supplierQuotationGrd);

	/**
	 * 批量保存销售询价列表
	 * @param list
	 */
	public void batchInsertSupplierQuotationGrd(List<SupplierQuotationGrd> list);

	/**
	 * 更新销售询价列表
	 * @param SupplierQuotationGrd
	 * @return
	 */
	public boolean updateSupplierQuotationGrd(
			SupplierQuotationGrd supplierQuotationGrd);

	/**
	 * 批量更新销售询价列表
	 * @param list
	 */
	public void batchUpdataSupplierQuotationGrd(List<SupplierQuotationGrd> list);

/*	*//**
	 * 通过组合主键只更新状态
	 * @param SupplierQuotationGrd
	 * @return
	 *//*
	public boolean updateStatus(SupplierQuotationGrd supplierQuotationGrd);*/

	/**
	 * 通过组合组件删除销售询价列表
	 * @param quotationId
	 * @param goodsId
	 * @return
	 */
	public boolean deleteSupplierQuotationGrd(String quotationId, String goodsId);

	/**
	 * 通过条件删除销售询价列表
	 * @param SupplierQuotationGrd
	 */
	public void deleteSupplierQuotationGrd(
			SupplierQuotationGrd supplierQuotationGrd);

	/**
	 * 
	 * @param quotationId
	 * @return
	 */
	public Integer getSupplierQuotationGrdCountByquotationId(String quotationId);

	/**
	 * 
	 * @param quotationId
	 * @return
	 */
	public boolean deleteSupplierQuotationGrdByquotationId(String quotationId);

}