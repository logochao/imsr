package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.invoicing.ibatis.model.SaleQuotation;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface SaleQuotationDao {

	/**
	 * 根据主键获取销售报价
	 * @param id
	 * @return
	 */
	public SaleQuotation getSaleQuotationById(String id);

	/**
	 * 通过条件查询销售报价
	 * @param saleQuotation
	 * @return
	 */
	public List<SaleQuotation> getSaleQuotationByCondition(
			SaleQuotation saleQuotation);

	/**
	 * 保存销售报价
	 * @param saleQuotation
	 */
	public void insertSaleQuotation(SaleQuotation saleQuotation);

	/**
	 * 更新销售报价
	 * @param saleQuotation
	 * @return
	 */
	public boolean updateSaleQuotationById(SaleQuotation saleQuotation);

	/**
	 * 删除销售报价
	 * @param saleQuotation
	 */
	public void deleteSaleQuotation(SaleQuotation saleQuotation);

}