/**
 * 
 */
package com.radius.invoicing.contractmanage.action;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;

import com.radius.base.controller.BaseController;
import com.radius.invoicing.enums.ContractTypeEnums;
import com.radius.invoicing.enums.StatusEnums;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 销售合同处理
 */
@Controller
@Scope("request")
public class SalesContractController extends BaseController{

	private Logger  logger=Logger.getLogger(this.getClass());
	
	private final String prefix="/jsp/contract/sales/";
	
	private String sales_view=null;
	
	
	@PostConstruct
	public void init(){
		if(sales_view==null){
			sales_view=prefix+"index.jsp";
		}
	}
	
	@PreDestroy
	public void destroy(){
		if(sales_view!=null){
			sales_view=null;
		}
	}
	
	@RequestMapping(value={"/contract/manager/sales_view.html"})
	public String salesContract(HttpServletRequest request,HttpServletResponse response)throws Exception{
		logger.info("进入销售合同管理界面");
		return sales_view;
	}
	
	@RequestMapping("/contract/manager/sales_status_json.html")
	public void getStatusInfoJson(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String json=StatusEnums.getStatusEnumsJson();
		super.ajaxMethod(response, json, "获取状态枚举json对象发生异常");
	}
	@RequestMapping("/contract/manager/sales_contract_type_json.html")
	public void getContractTypeJson(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String json=ContractTypeEnums.getContractTypeEnumsJson();
		super.ajaxMethod(response, json, "获取合同类型枚举json对象发生异常");
	}
	
}
