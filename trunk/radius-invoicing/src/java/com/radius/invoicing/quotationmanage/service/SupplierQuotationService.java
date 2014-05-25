package com.radius.invoicing.quotationmanage.service;

import java.util.List;

import com.radius.base.page.EasyuiSplitPager;
import com.radius.base.utils.JsonUtils;
import com.radius.invoicing.ibatis.model.SupplierQuotation;
import com.radius.invoicing.ibatis.model.SupplierQuotationGrd;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface SupplierQuotationService {

	/**
	 * 供应商报价商品列表
	 * @param key
	 * @param supplierQuotationGrd
	 * @return
	 */
	public JsonUtils addSupplierQuotationGrd2Memcached(String key,
			SupplierQuotationGrd supplierQuotationGrd);

	/**
	 * 移除供应商商品列表
	 * @param key
	 * @param isDelete
	 * @param supplierQuotationGrd
	 * @return
	 */
	public JsonUtils removeSupplierQuotationGrd2Memecached(String key,
			boolean isDelete, SupplierQuotationGrd supplierQuotationGrd);

	public JsonUtils saveSupplierQuotationInfo(String key,
			SupplierQuotation supplierQuotation);

	/**
	 * 
	 * @param list
	 * @param supplierQuotation
	 * @return
	 */
	public JsonUtils insertSupplierQuotationInfo(
			List<SupplierQuotationGrd> list, SupplierQuotation supplierQuotation);

	public JsonUtils updateSupplierQuotationInfo(
			List<SupplierQuotationGrd> list, SupplierQuotation supplierQuotation);

	/**
	 * 保存供应商商品信息
	 * @param list
	 * @param supplierId
	 */
	public void saveSupplierGoods(List<SupplierQuotationGrd> list,
			String supplierId);

	/**
	 * 获取供应商报价列表
	 * @param supplierQuotation
	 * @return
	 */
	public EasyuiSplitPager<SupplierQuotation> getSupplierQuotationList(
			SupplierQuotation supplierQuotation);

	/**
	 * 通过供应商编号获取供应商商品列表
	 * @param supplierQuotationId
	 * @return
	 */
	public EasyuiSplitPager<SupplierQuotationGrd> getSupplierQuotationGrd(
			String supplierQuotationId);

}