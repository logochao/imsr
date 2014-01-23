/**
 * 
 */
package com.radius.invoicing.customermange.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.radius.base.controller.BaseController;
import com.radius.base.page.EasyuiSplitPager;
import com.radius.invoicing.customermange.service.CustomerService;
import com.radius.invoicing.ibatis.model.Customer;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 客户管理处理
 */
@Controller
@Scope("request")
public class CustomerController extends BaseController {

	@Resource(name="customerServiceImpl")
	private CustomerService customerService;
	
	
	@RequestMapping("/customer/split_page.html")
	@ResponseBody
	public EasyuiSplitPager<Customer> getCustomerSplitPage(HttpServletRequest request,HttpServletResponse response,Customer customer)throws Exception{
		return customerService.getCustomerInfoSplitPage(customer);
	} 
}
