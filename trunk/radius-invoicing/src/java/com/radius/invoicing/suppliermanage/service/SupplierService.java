package com.radius.invoicing.suppliermanage.service;

import com.radius.base.page.EasyuiSplitPager;
import com.radius.base.utils.JsonUtils;
import com.radius.invoicing.ibatis.model.LinkMan;
import com.radius.invoicing.ibatis.model.Supplier;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface SupplierService {

	/**
	 * 获取供应商信息
	 * @param supplier
	 * @return
	 * @throws Exception
	 */
	public EasyuiSplitPager<Supplier> getSupplierInfo(Supplier supplier)
			throws Exception;

	/**
	 * 将供应商联系人添加到缓存中
	 * @param key
	 * @param grd
	 * @return
	 */
	public JsonUtils addSupplierLinkMan2Memcached(String key, LinkMan linkMan);

	/**
	 * 移除供应商联系人信息从memcached中
	 * @param key
	 * @param isDelete true表示删除整个对象
	 * @param grd
	 * @return
	 */
	public JsonUtils removeSupplierLinkMan2Memcached(String key,
			boolean isDelete, LinkMan linkMan);

	/**
	 * 保存供应商信息(如果存在则更新、否则添加)
	 * @param key
	 * @param supplier
	 * @return
	 */
	public JsonUtils saveSupplierInfo(String key, Supplier supplier);

}