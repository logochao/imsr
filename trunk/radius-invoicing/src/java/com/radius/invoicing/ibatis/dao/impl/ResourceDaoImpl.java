/**
 * 
 */
package com.radius.invoicing.ibatis.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.invoicing.ibatis.dao.ResourceDao;
import com.radius.invoicing.ibatis.model.Resource;


/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
@Repository
public class ResourceDaoImpl extends BaseIbatisDaoImpl<Resource> implements ResourceDao {
	/**
	 * 批量导入资源信息
	 * @param list
	 */
	public void batchInsertResourceList(List<Resource> list){
		 super.batchInsertListObject(list, "resourceSqlMap.insertResource");
	}
	
	public List<Resource> getResourceListAll(){
		return this.getSqlMapClientTemplate().queryForList("resourceSqlMap.getResourceListAll");
	}
	/**
	 * 添加资源
	 * @param r
	 */
	public void insertResource(Resource r){
		this.insertObject(r, "resourceSqlMap.insertResource");
	}
}
