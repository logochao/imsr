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
 * @author <a href="mailto:goodluck.sunlight@gmail.com">�²���</a>
 * @version ����ʱ�䣺2013-12-8 ����12:53:04<br/>
 * Copyright (c) 2013 by �²���.<br/>
 * ��˵��
 */
@Repository
public class ResourceDaoImpl extends BaseIbatisDaoImpl<Resource> implements ResourceDao {
	/**
	 * ����������Դ��Ϣ
	 * @param list
	 */
	public void batchInsertResourceList(List<Resource> list){
		 super.batchInsertListObject(list, "resourceSqlMap.insertResource");
	}
}
