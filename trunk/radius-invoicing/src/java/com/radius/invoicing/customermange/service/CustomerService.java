package com.radius.invoicing.customermange.service;

import com.radius.base.page.EasyuiSplitPager;
import com.radius.invoicing.ibatis.model.Customer;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface CustomerService {

	/**
	 * 通过条件查询获取easyui对象的分页对象
	 * @param customer
	 * @return
	 */
	public EasyuiSplitPager<Customer> getCustomerInfoSplitPage(Customer customer);

}