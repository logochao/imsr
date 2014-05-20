package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.invoicing.ibatis.model.SalesInquiryGrd;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface SalesInquiryGrdDao {

	/**
	 * 通过组合主键查询销售询价列表
	 * @param salesInquiryId
	 * @param goodsId
	 * @return
	 */
	public SalesInquiryGrd getSalesInquiryGrd(String salesInquiryId,
			String goodsId);

	/**
	 * 通过条件查询销售询价列表
	 * @param salesInquiryGrd
	 * @return
	 */
	public List<SalesInquiryGrd> getSalesInquiryGrdList(
			SalesInquiryGrd salesInquiryGrd);

	/**
	 * 保存销售询价
	 * @param salesInquiryGrd
	 */
	public void insert(SalesInquiryGrd salesInquiryGrd);

	/**
	 * 批量保存销售询价列表
	 * @param list
	 */
	public void batchInsertSalesInquiryGrd(List<SalesInquiryGrd> list);

	/**
	 * 更新销售询价列表
	 * @param salesInquiryGrd
	 * @return
	 */
	public boolean updateSalesInquiryGrd(SalesInquiryGrd salesInquiryGrd);

	/**
	 * 批量更新销售询价列表
	 * @param list
	 */
	public void batchUpdataSalesInquiryGrd(List<SalesInquiryGrd> list);

	/**
	 * 通过组合主键只更新状态
	 * @param salesInquiryGrd
	 * @return
	 */
	public boolean updateStatus(SalesInquiryGrd salesInquiryGrd);

	/**
	 * 通过组合组件删除销售询价列表
	 * @param salesInquiryId
	 * @param goodsId
	 * @return
	 */
	public boolean deleteSalesInquiryGrd(String salesInquiryId, String goodsId);

	/**
	 * 通过条件删除销售询价列表
	 * @param salesInquiryGrd
	 */
	public void deleteSalesInquiryGrd(SalesInquiryGrd salesInquiryGrd);

}