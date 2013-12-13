package com.radius.invoicing.sysmanage.service;

import java.util.List;

import com.radius.invoicing.ibatis.model.Resource;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface SystemInitService {

	/**
	 * 初始化系统资源信息
	 * @param list
	 */
	public void initSystemResource(List<Resource> list);

}