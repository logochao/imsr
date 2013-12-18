package com.radius.invoicing.sysmanage.service;

import com.radius.invoicing.ibatis.model.User;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface SysInvoicingService {

	/**
	 * 
	 * @param u
	 * @param isopen 节点是否是打开状态
	 * @param icon  是否显示节点的样式(图片)
	 * @return
	 * @throws Exception
	 */
	public String saveUserLogin(User u, boolean icon)
			throws Exception;

}