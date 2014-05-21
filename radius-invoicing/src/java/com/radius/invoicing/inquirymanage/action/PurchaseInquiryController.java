package com.radius.invoicing.inquirymanage.action;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 采购询价
 */
@Controller
@Scope("request")
public class PurchaseInquiryController {

private Logger logger=Logger.getLogger(this.getClass());
	
	private final String prefix="/jsp/inquiry/purchase/";
	private String purchase_inquiry_manager_view=null;
	
	@PostConstruct
	public void init(){
		if(purchase_inquiry_manager_view==null){
			purchase_inquiry_manager_view=prefix+"purchase_inquiry_index.jsp";
		}
	}
	@RequestMapping("/inquiry/manager/purchaseInquiry/purchase_inquiry_manage_view.html")
	public ModelAndView salesInquiryManage(){
		return new ModelAndView(purchase_inquiry_manager_view);
	}
	
	
	
	@PreDestroy
	public void destroy(){
		if(purchase_inquiry_manager_view!=null){
			purchase_inquiry_manager_view=null;
		}
	}
}
