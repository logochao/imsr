package com.radius.invoicing.sysmanage.service;


import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.radius.invoicing.enums.ResourceTypeEnum;
import com.radius.invoicing.ibatis.model.Resource;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public class SystemInitServiceTest {
	
	private ApplicationContext context=null;
	private SystemInitService systemInitService=null;
	@Before
	public void setUp() throws Exception {
		context=new ClassPathXmlApplicationContext("classpath:spring/spring*.xml");
		systemInitService=context.getBean("systemInitServiceImpl",SystemInitService.class);
	}

	@Test
	public void initSystemResource(){
		List<Resource> list=new ArrayList<Resource>();
		buildSysManage(list);
		buildBuinessManage(list);
		
		systemInitService.initSystemResource(list);
	}
	
	
	private void buildSysManage(List<Resource> list){
		//1.
		Resource sysmanger=new Resource();
		sysmanger.setId(1);
//		sysmanger.setResourceType(ResourceTypeEnum.MENU);
		sysmanger.setName("sysmange");
		sysmanger.setLabelName("系统管理");
		sysmanger.setIsleaf(0);//表示非叶子节点
		sysmanger.setPId(0);//设置父节点
		sysmanger.setLevel(1);
		list.add(sysmanger);
		
		Resource usermanage=new Resource();
		usermanage.setId(11);
//		usermanage.setResourceType(ResourceTypeEnum.FUNCTION);
		usermanage.setName("usermanage");
		usermanage.setLabelName("用户管理");
		usermanage.setIsleaf(1);//表示非叶子节点
		usermanage.setPId(1);//设置父节点
		usermanage.setLevel(2);
		usermanage.setUrl("/user/manager/user_view.html");
		list.add(usermanage);
		
		Resource passwordmanage=new Resource();
		passwordmanage.setId(12);
//		passwordmanage.setResourceType(ResourceTypeEnum.FUNCTION);
		passwordmanage.setName("usermanage");
		passwordmanage.setLabelName("用户管理");
		passwordmanage.setIsleaf(1);//表示非叶子节点
		passwordmanage.setPId(1);//设置父节点
		passwordmanage.setLevel(2);
		passwordmanage.setUrl("/password/manager/password_view.html");
		list.add(passwordmanage);
		
	}
	
	private void buildBuinessManage(List<Resource> list){
		//2.
		Resource buinessmanger=new Resource();
		buinessmanger.setId(2);
//		buinessmanger.setResourceType(ResourceTypeEnum.MENU);
		buinessmanger.setName("buinessmange");
		buinessmanger.setLabelName("buinessmange");
		buinessmanger.setIsleaf(0);//表示非叶子节点
		buinessmanger.setPId(0);//设置父节点
		buinessmanger.setLevel(1);
		list.add(buinessmanger);
		
		Resource suppliermanage=new Resource();
		suppliermanage.setId(21);
//		suppliermanage.setResourceType(ResourceTypeEnum.FUNCTION);
		suppliermanage.setName("suppliermanage");
		suppliermanage.setLabelName("suppliermanage");
		suppliermanage.setIsleaf(1);//表示非叶子节点
		suppliermanage.setPId(1);//设置父节点
		suppliermanage.setLevel(2);
		suppliermanage.setUrl("/supplier/manager/supplier_view.html");
		list.add(suppliermanage);
		
		Resource clientdmanage=new Resource();
		clientdmanage.setId(22);
//		clientdmanage.setResourceType(ResourceTypeEnum.FUNCTION.getTypeId());
		clientdmanage.setName("clientmanage");
		clientdmanage.setLabelName("客户管理");
		clientdmanage.setIsleaf(1);//表示非叶子节点
		clientdmanage.setPId(1);//设置父节点
		clientdmanage.setLevel(2);
		clientdmanage.setUrl("/client/manager/client_view.html");
		list.add(clientdmanage);
	}
	
}
