package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.invoicing.ibatis.model.Resource;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">�²���</a>
 * @version ����ʱ�䣺2013-12-8 ����12:53:04<br/>
 * Copyright (c) 2013 by �²���.<br/>
 * ��˵��
 */
public interface ResourceDao {

	/**
	 * ����������Դ��Ϣ
	 * @param list
	 */
	public void batchInsertResourceList(List<Resource> list);

}