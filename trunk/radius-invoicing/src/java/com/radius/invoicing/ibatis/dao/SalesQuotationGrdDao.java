package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.invoicing.ibatis.model.SalesQuotationGrd;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface SalesQuotationGrdDao {

	/**
	 * 根据商品编号+销售报价单编号 获取销售报价商品明细
	 * @param grd
	 * @return
	 */
	public SalesQuotationGrd getSaleQuotationGrdByPk(SalesQuotationGrd grd);

	/**
	 * 根据条件获取销售报价明细
	 * @param grd
	 * @return
	 */
	public List<SalesQuotationGrd> getSaleQuotationGrdByCondition(
			SalesQuotationGrd grd);

	/**
	 * 保存销售报价订单
	 * @param grd
	 */
	public void insertSaleQuotationGrd(SalesQuotationGrd grd);

	/**
	 * 批量保存销售报价
	 * @param list
	 */
	public void batchInsertSaleQuotationGrd(List<SalesQuotationGrd> list);

	/**
	 * 更新销售报价信息
	 * @param grd
	 * @return
	 */
	public boolean updateSaleQuotationGrdByPk(SalesQuotationGrd grd);

	/**
	 * 删除销售报价
	 * @param grd
	 */
	public void deleteSaleQuotationGrd(SalesQuotationGrd grd);
	public Integer getSalesQuotationGrdCountByQuotationId(String quotationId);
	public void deleteSalesQuotationGrdByQuotationId(String quotationId);
}