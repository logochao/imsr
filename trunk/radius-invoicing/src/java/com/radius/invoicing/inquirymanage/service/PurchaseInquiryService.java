package com.radius.invoicing.inquirymanage.service;

import java.util.List;

import com.radius.base.page.EasyuiSplitPager;
import com.radius.base.utils.JsonUtils;
import com.radius.invoicing.ibatis.model.PurchaseInquiry;
import com.radius.invoicing.ibatis.model.PurchaseInquiryGrd;

public interface PurchaseInquiryService {

	public JsonUtils addPurchaseInquiryGrd2Memecached(String key,
			PurchaseInquiryGrd grd);

	/**
	 * 移除采购订单商品从memcached中
	 * @param key
	 * @param isDelete true表示删除整个对象
	 * @param grd
	 * @return
	 */
	public JsonUtils removePurchaseInquiryGrd2Memcached(String key,
			boolean isDelete, PurchaseInquiryGrd grd);

	/**
	 * 
	 * @param inquiry
	 * @param salesInquiryGrdkey
	 * @param inqueryStatus 询价商品状态
	 * @return
	 */
	public JsonUtils savePurchaseInquiryInfo(PurchaseInquiry purchaseInquiry,
			String purchaseInquiryGrdkey, String inqueryStatus);

	public JsonUtils insertPurchaseInquiryInfo(PurchaseInquiry purchaseInquiry,
			List<PurchaseInquiryGrd> list);

	public JsonUtils updatePurchaseInquiryInfo(PurchaseInquiry purchaseInquiry,
			List<PurchaseInquiryGrd> list);

	/**
	 * 通过条件查询销售询价
	 * @param salesInquiry
	 * @return
	 */
	public EasyuiSplitPager<PurchaseInquiry> getSalesInquiryList(
			PurchaseInquiry purchaseInquiry);

	/**
	 * 通过询价单号获取询价商品信息列表
	 * @param salesInquiryId
	 * @return
	 */
	public EasyuiSplitPager<PurchaseInquiryGrd> getSalesInquiryGrdList(
			String purchaseInquiryId);

}