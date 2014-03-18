package com.radius.invoicing.suppliermanage.service;

import com.radius.base.page.EasyuiSplitPager;
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

}