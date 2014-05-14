package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.invoicing.ibatis.model.SalesInquiry;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface SalesInquiryDao {

	public SalesInquiry getSalesInquiryById(String salesInquiryId);

	public List<SalesInquiry> getSalesInquiryList(SalesInquiry salesInquiry);

	public void insert(SalesInquiry salesInquiry);

	public void batchInsert(List<SalesInquiry> list);

	public boolean updateSalesInquiry(SalesInquiry salesInquiry);

	public boolean updateStatusBySalesInquiryId(SalesInquiry salesInquiry);

	public void batchUpdateSalesInquiry(List<SalesInquiry> list);

	public void deleteSalesInquiry(SalesInquiry salesInquiry);

	public void deletesalesInquiry(String salesInquiryId);

}