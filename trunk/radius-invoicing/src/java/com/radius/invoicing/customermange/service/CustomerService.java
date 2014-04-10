package com.radius.invoicing.customermange.service;

import com.radius.base.page.EasyuiSplitPager;
import com.radius.base.utils.JsonUtils;
import com.radius.invoicing.ibatis.model.Customer;
import com.radius.invoicing.ibatis.model.LinkMan;

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

	/**
	 * 根据条件查询联系人信息
	 * @param linkman
	 * @return
	 */
	public EasyuiSplitPager<LinkMan> getLinkManInfoSplitPage(LinkMan linkman);

	/**
	 * 将客户联系人添加到缓存中
	 * @param key
	 * @param grd
	 * @return
	 */
	public JsonUtils addCustomerLinkMan2Memcached(String key, LinkMan linkMan);

	/**
	 * 移除客户联系人信息从memcached中
	 * @param key
	 * @param isDelete true表示删除整个对象
	 * @param grd
	 * @return
	 */
	public JsonUtils removeCustomerLinkMan2Memcached(String key,
			boolean isDelete, LinkMan linkMan);
	/**
	 * 保存客户信息
	 * @param key
	 * @param customer
	 * @return
	 */
	public JsonUtils saveCustomerInfo(String key,Customer customer);

}