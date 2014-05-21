package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.invoicing.ibatis.model.PurchaseInquiry;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface PurchaseInquiryDao {

	public PurchaseInquiry getPurchaseInquiryById(String purchaseInquiryId);

	public List<PurchaseInquiry> getPurchaseInquiryList(
			PurchaseInquiry purchaseInquiry);

	public void insert(PurchaseInquiry purchaseInquiry);

	public void batchInsert(List<PurchaseInquiry> list);

	public boolean updatePurchaseInquiry(PurchaseInquiry purchaseInquiry);

	public boolean updateStatusByPurchaseInquiryId(
			PurchaseInquiry purchaseInquiry);

	public void batchUpdatePurchaseInquiry(List<PurchaseInquiry> list);

	public void deletePurchaseInquiry(PurchaseInquiry purchaseInquiry);

	public void deletePurchaseInquiry(String PurchaseInquiryId);

}