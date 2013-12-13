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
 * @author <a href="mailto:goodluck.sunlight@gmail.com">�²���</a>
 * @version ����ʱ�䣺2013-12-8 ����12:53:04<br/>
 * Copyright (c) 2013 by �²���.<br/>
 * ��˵�� ϵͳ��ʼ��
 */
@Service
public class SystemInitServiceImpl implements SystemInitService {

	@Autowired(required=false)
	@Qualifier("resourceDaoImpl")
	private ResourceDao resourceDao;
	
	/**
	 * ��ʼ��ϵͳ��Դ��Ϣ
	 * @param list
	 */
	public void initSystemResource(List<Resource> list){
		resourceDao.batchInsertResourceList(list);
	}
}
