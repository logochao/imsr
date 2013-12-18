package com.radius.invoicing.sysmanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.radius.invoicing.ibatis.dao.ResourceDao;
import com.radius.invoicing.ibatis.model.Resource;
import com.radius.invoicing.ibatis.model.User;
import com.radius.invoicing.sysmanage.compent.ResourceMenu;
import com.radius.invoicing.sysmanage.service.SysInvoicingService;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 出现系统级别的servce
 */
@Service
public class SysInvoicingServiceImpl implements SysInvoicingService {

	@Autowired(required=false)
	@Qualifier("resourceDaoImpl")
	private ResourceDao resourceDao;
	
	@javax.annotation.Resource(name="resourceMenu")
	private ResourceMenu resourceMenu;
	/**
	 * 
	 * @param u
	 * @param isopen 节点是否是打开状态
	 * @param icon  是否显示节点的样式(图片)
	 * @return
	 * @throws Exception
	 */
	public String saveUserLogin(User u,boolean icon)throws Exception{
		String menuTreeJson=null;
		//1.登陆系统
		//2.根据当前用户获取对应的权限资源-->将其存放在内存map中方便下次再请求他的地址，以便判断是否修改了参数
		//3.根据权限获取对应的菜单链接
		List<Resource> all=resourceDao.getResourceListAll();
		List<Resource> treeResource=resourceMenu.resourceTreeOrderBy(all);
		menuTreeJson=resourceMenu.getResoureMenuJson(treeResource, icon);
		return menuTreeJson;
	}
	
	/**
	 * 资源管理界面
	 * @param icon
	 * @return
	 * @throws Exception
	 */
	public String getResouceJson(boolean icon)throws Exception{
		String menuTreeJson=null;
		List<Resource> all=resourceDao.getResourceListAll();
//		List<Resource> treeResource=resourceMenu.resourceTreeOrderBy(all);
		menuTreeJson=resourceMenu.getResouceMenuJsonManager(all, icon);
		return menuTreeJson;
	}
}
