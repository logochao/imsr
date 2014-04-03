/**
 * 
 */
package com.radius.invoicing.sysmanage.action;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明  系统处理
 */
@Controller
@Scope("request")
public class SysController {

	private final String prefix = "/jsp/layout/";

	private String layout_index_view = null;//进入系统布局界面
	
	
	@PostConstruct
	public void init(){
		if(layout_index_view == null){
			layout_index_view=prefix+"layout_index.jsp";
		}
	}
	
	
	@RequestMapping("/system/manage/sys/login_sys.html")
	public ModelAndView loginSys(HttpServletRequest request,HttpServletResponse response)throws Exception{
		return new ModelAndView(layout_index_view);
	}
	
	
	
	@PreDestroy
	public void destroy(){
		if(layout_index_view!=null){
			layout_index_view=null;
		}
		
	}
}
