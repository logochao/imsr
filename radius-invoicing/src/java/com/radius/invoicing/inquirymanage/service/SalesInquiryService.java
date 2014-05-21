package com.radius.invoicing.inquirymanage.service;

import java.util.List;

import com.radius.base.page.EasyuiSplitPager;
import com.radius.base.utils.JsonUtils;
import com.radius.invoicing.ibatis.model.SalesInquiry;
import com.radius.invoicing.ibatis.model.SalesInquiryGrd;

public interface SalesInquiryService {

	/**
	 * 将销售询价商品添加到memcached中
	 * @param key
	 * @param grd
	 * @return
	 */
	public JsonUtils addSalesInquiryGrd2Memcached(String key,
			SalesInquiryGrd grd);

	/**
	 * 移除销售订单商品从memcached中
	 * @param key
	 * @param isDelete true表示删除整个对象
	 * @param grd
	 * @return
	 */
	public JsonUtils removeSalesInquiryGrd2Memcached(String key,
			boolean isDelete, SalesInquiryGrd grd);

	public JsonUtils saveSalesInquiryInfo(SalesInquiry inquiry,
			String salesInquiryGrdkey,String inquiryStatus);

	public JsonUtils insertSalesInquiryInfo(SalesInquiry salesInquiry,
			List<SalesInquiryGrd> list);

	public JsonUtils updateSalesInquiryInfo(SalesInquiry salesInquiry,
			List<SalesInquiryGrd> list);
	
	/**
	 * 通过条件查询销售询价
	 * @param salesInquiry
	 * @return
	 */
	public EasyuiSplitPager<SalesInquiry> getSalesInquiryList(SalesInquiry salesInquiry);
	
	/**
	 * 通过询价单号获取询价商品信息列表
	 * @param salesInquiryId
	 * @return
	 */
	public EasyuiSplitPager<SalesInquiryGrd> getSalesInquiryGrdList(String salesInquiryId);

}