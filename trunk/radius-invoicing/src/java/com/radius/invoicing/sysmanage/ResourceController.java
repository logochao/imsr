/**
 * 
 */
package com.radius.invoicing.sysmanage;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 系统菜单管理
 */
@Controller
@Scope("request")
public class ResourceController {
	
	private Logger logger=Logger.getLogger(this.getClass());
	private String prefix="/jsp/resource/";
	private String resouce_manage_view=null;
	
	/**
	 * 调整到资源管理界面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/resource/system/resouce_view.html")
	public String getResouceView(HttpServletRequest request,HttpServletResponse response)throws Exception{
		return resouce_manage_view;
//		return new ModelAndView(resouce_manage_view);
	}
	
	
	@PostConstruct
	public void init(){
		if(resouce_manage_view==null){
			resouce_manage_view=prefix+"resoucemanage.jsp";
		}
	}
	
	@PreDestroy
	public void destroy(){
		if(resouce_manage_view!=null){
			resouce_manage_view=null;
		}
	}
}
