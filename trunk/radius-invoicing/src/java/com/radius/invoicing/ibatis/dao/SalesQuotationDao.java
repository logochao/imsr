package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.invoicing.ibatis.model.SalesQuotation;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface SalesQuotationDao {

	public SalesQuotation getSalesQuotationById(String salesQuotationId);

	public List<SalesQuotation> getSalesQuotationList(
			SalesQuotation salesQuotation);

	public void insert(SalesQuotation salesQuotation);

	public void batchInsert(List<SalesQuotation> list);

	public boolean updateSalesQuotation(SalesQuotation salesQuotation);

	public boolean updateStatusBySalesQuotationId(SalesQuotation salesQuotation);

	public void batchUpdateSalesQuotation(List<SalesQuotation> list);

	public void deleteSalesQuotation(SalesQuotation salesQuotation);

	public void deleteSalesQuotation(String salesQuotationId);

}