package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.invoicing.ibatis.model.SupplierQuotation;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface SupplierQuotationDao {

	public SupplierQuotation getSupplierQuotationById(String supplierQuotationId);

	public List<SupplierQuotation> getSupplierQuotationList(
			SupplierQuotation supplierQuotation);

	public void insert(SupplierQuotation supplierQuotation);

	public void batchInsert(List<SupplierQuotation> list);

	public boolean updateSupplierQuotation(SupplierQuotation SupplierQuotation);

	public boolean updateStatusBySupplierQuotationId(
			SupplierQuotation supplierQuotation);

	public void batchUpdateSupplierQuotation(List<SupplierQuotation> list);

	public void deleteSupplierQuotation(SupplierQuotation supplierQuotation);

	public void deleteSupplierQuotation(String supplierQuotationId);

}