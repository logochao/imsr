/**
 * 
 */
package com.radius.invoicing.sysmanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.radius.invoicing.ibatis.dao.ResourceDao;
import com.radius.invoicing.ibatis.model.Resource;
import com.radius.invoicing.sysmanage.service.SystemInitService;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
@Service
public class SystemInitServiceImpl implements SystemInitService {

	@Autowired(required=false)
	@Qualifier("resourceDaoImpl")
	private ResourceDao resourceDao;
	
	/**
	 * 初始化系统资源信息
	 * @param list
	 */
	public void initSystemResource(List<Resource> list){
		resourceDao.batchInsertResourceList(list);
	}
	
	public List<Resource> getResourceListAll(){
		return resourceDao.getResourceListAll();
	}
}
