package com.radius.invoicing.quotationmanage.service;

import java.util.List;

import com.radius.base.page.EasyuiSplitPager;
import com.radius.base.utils.JsonUtils;
import com.radius.invoicing.ibatis.model.SalesQuotation;
import com.radius.invoicing.ibatis.model.SalesQuotationGrd;
import com.radius.invoicing.ibatis.model.SupplierGoods;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface SalesQuotationService {

	/**
	 * 供应商报价商品列表
	 * @param key
	 * @param SalesQuotationGrd
	 * @return
	 */
	public JsonUtils addSalesQuotationGrd2Memcached(String key,
			SalesQuotationGrd salesQuotationGrd);

	/**
	 * 移除供应商商品列表
	 * @param key
	 * @param isDelete
	 * @param SalesQuotationGrd
	 * @return
	 */
	public JsonUtils removeSalesQuotationGrd2Memecached(String key,
			boolean isDelete, SalesQuotationGrd salesQuotationGrd);

	public JsonUtils saveSalesQuotationInfo(String key,
			SalesQuotation salesQuotation);

	/**
	 * 
	 * @param list
	 * @param SalesQuotation
	 * @return
	 */
	public JsonUtils insertSalesQuotationInfo(List<SalesQuotationGrd> list,
			SalesQuotation salesQuotation);

	public JsonUtils updateSalesQuotationInfo(List<SalesQuotationGrd> list,
			SalesQuotation salesQuotation);

	/**
	 * 获取供应商报价列表
	 * @param SalesQuotation
	 * @return
	 */
	public EasyuiSplitPager<SalesQuotation> getSalesQuotationList(
			SalesQuotation salesQuotation);

	/**
	 * 通过供应商编号获取供应商商品列表
	 * @param SalesQuotationId
	 * @return
	 */
	public EasyuiSplitPager<SalesQuotationGrd> getSalesQuotationGrd(
			String salesQuotationId);
	
	/**
	 * 获取供应商报价商品信息
	 * @param supplierGoods
	 * @return
	 */
	public EasyuiSplitPager<SupplierGoods> getSupplierGoodsList(SupplierGoods supplierGoods);

}