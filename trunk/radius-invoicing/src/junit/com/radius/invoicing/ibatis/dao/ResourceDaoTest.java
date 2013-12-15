package com.radius.invoicing.ibatis.dao;


import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.radius.invoicing.ibatis.model.Resource;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public class ResourceDaoTest {

	private ApplicationContext context=null;
	private ResourceDao resourceDao=null;
	@Before
	public void setUp() throws Exception {
		context=new ClassPathXmlApplicationContext("classpath:spring/spring*.xml");
		resourceDao=context.getBean("resourceDaoImpl",ResourceDao.class);
	}

	@Test
	public void getResourceListAll(){
		try{
		List<Resource> list=resourceDao.getResourceListAll();
		for(Resource r:list){
			System.out.println(r.getLabelName());
		}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
