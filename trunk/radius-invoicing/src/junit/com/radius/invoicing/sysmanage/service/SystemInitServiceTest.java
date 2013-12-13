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
 * @author <a href="mailto:goodluck.sunlight@gmail.com">�²���</a>
 * @version ����ʱ�䣺2013-12-8 ����12:53:04<br/>
 * Copyright (c) 2013 by �²���.<br/>
 * ��˵��
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
		sysmanger.setLabelName("ϵͳ����");
		sysmanger.setIsleaf(0);//��ʾ��Ҷ�ӽڵ�
		sysmanger.setPId(0);//���ø��ڵ�
		sysmanger.setLevel(1);
		list.add(sysmanger);
		
		Resource usermanage=new Resource();
		usermanage.setId(11);
//		usermanage.setResourceType(ResourceTypeEnum.FUNCTION);
		usermanage.setName("usermanage");
		usermanage.setLabelName("�û�����");
		usermanage.setIsleaf(1);//��ʾ��Ҷ�ӽڵ�
		usermanage.setPId(1);//���ø��ڵ�
		usermanage.setLevel(2);
		usermanage.setUrl("/user/manager/user_view.html");
		list.add(usermanage);
		
		Resource passwordmanage=new Resource();
		passwordmanage.setId(12);
//		passwordmanage.setResourceType(ResourceTypeEnum.FUNCTION);
		passwordmanage.setName("usermanage");
		passwordmanage.setLabelName("�û�����");
		passwordmanage.setIsleaf(1);//��ʾ��Ҷ�ӽڵ�
		passwordmanage.setPId(1);//���ø��ڵ�
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
		buinessmanger.setIsleaf(0);//��ʾ��Ҷ�ӽڵ�
		buinessmanger.setPId(0);//���ø��ڵ�
		buinessmanger.setLevel(1);
		list.add(buinessmanger);
		
		Resource suppliermanage=new Resource();
		suppliermanage.setId(21);
//		suppliermanage.setResourceType(ResourceTypeEnum.FUNCTION);
		suppliermanage.setName("suppliermanage");
		suppliermanage.setLabelName("suppliermanage");
		suppliermanage.setIsleaf(1);//��ʾ��Ҷ�ӽڵ�
		suppliermanage.setPId(1);//���ø��ڵ�
		suppliermanage.setLevel(2);
		suppliermanage.setUrl("/supplier/manager/supplier_view.html");
		list.add(suppliermanage);
		
		Resource clientdmanage=new Resource();
		clientdmanage.setId(22);
//		clientdmanage.setResourceType(ResourceTypeEnum.FUNCTION.getTypeId());
		clientdmanage.setName("clientmanage");
		clientdmanage.setLabelName("�ͻ�����");
		clientdmanage.setIsleaf(1);//��ʾ��Ҷ�ӽڵ�
		clientdmanage.setPId(1);//���ø��ڵ�
		clientdmanage.setLevel(2);
		clientdmanage.setUrl("/client/manager/client_view.html");
		list.add(clientdmanage);
	}
	
}
