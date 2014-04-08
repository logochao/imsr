/**
 * 
 */
package com.radius.invoicing.sysmanage.action;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.radius.base.controller.BaseController;
import com.radius.base.jstl.RadiusFunctions;
import com.radius.invoicing.enums.ResourceTypeEnum;
import com.radius.invoicing.ibatis.model.Resource;
import com.radius.invoicing.sysmanage.service.SysInvoicingService;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 系统菜单管理
 */
@Controller
@Scope("request")
public class ResourceController extends BaseController{
	
//	private Logger logger=Logger.getLogger(this.getClass());
	private String prefix="/jsp/resource/";
	private String resouce_manage_view=null;
	private String resource_add_view=null;
	
	
	@Autowired(required=false)
	@Qualifier("sysInvoicingServiceImpl")
	private SysInvoicingService invoicingService;
	
	/**
	 * 调整到资源管理界面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value={"/resource/system/resouce_view.html"})
	public String getResouceView(HttpServletRequest request,HttpServletResponse response)throws Exception{
		return resouce_manage_view;
	}
	
	/**
	 * 跳转到添加资源文件界面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/resource/system/resouce_add.html")
	public String addResourceInfo(HttpServletRequest request,HttpServletResponse response)throws Exception{
		return resource_add_view;
	}
	/**
	 * 添加resource资源
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/resource/system/resouce_save.html")
	public void saveResourceInfo(HttpServletRequest request,HttpServletResponse response,Resource resource)throws Exception{
		int resourceType=ServletRequestUtils.getIntParameter(request, "typeId");
		resource.setResourceType(ResourceTypeEnum.getResourceTypeEnumByTypeId(resourceType));//设置枚举类
		String json=invoicingService.saveResouce(resource);
		
		super.ajaxMethod(response, json, "添加资源发生异常");
	}
	/**
	 * 获取菜单资源
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping(value={"/user/login.html","/resource/system/resouce_menu.html"})
	public void getResourceMenu(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String menuJson=invoicingService.saveUserLogin(null, false);
		super.ajaxMethod(response, menuJson, "获取菜单信息发生异常");
	}
	
	@RequestMapping("/resource/system/resouce_manage_json.html")
	public void getResouceJson(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String menuJson=invoicingService.getResouceJson(false);
		super.ajaxMethod(response, menuJson, "获取资源管理信息发生异常");
	}
	
	/**
	 * 获取资源类型
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/resource/system/resouce_type_json.html")
	public void getResourceTypeJson(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String resourceTypeJson=RadiusFunctions.getResourceTypeJson();
		super.ajaxMethod(response, resourceTypeJson, "获取资源类型");
	}
	@PostConstruct
	public void init(){
		if(resouce_manage_view==null){
			resouce_manage_view=prefix+"resoucemanage.jsp";
		}
		if(resource_add_view==null){
			resource_add_view=prefix+"resourceform.jsp";
		}
	}
	
	@PreDestroy
	public void destroy(){
		if(resouce_manage_view!=null){
			resouce_manage_view=null;
		}
		if(resouce_manage_view!=null){
			resouce_manage_view=null;
		}
	}
}
