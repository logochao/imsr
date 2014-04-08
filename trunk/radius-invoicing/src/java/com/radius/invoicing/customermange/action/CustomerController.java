/**
 * 
 */
package com.radius.invoicing.customermange.action;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.radius.base.controller.BaseController;
import com.radius.base.page.EasyuiSplitPager;
import com.radius.invoicing.customermange.service.CustomerService;
import com.radius.invoicing.ibatis.model.Customer;
import com.radius.invoicing.ibatis.model.LinkMan;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 客户管理处理
 */
@Controller
@Scope("request")
public class CustomerController extends BaseController {

	private Logger logger= Logger.getLogger(this.getClass());
	
	private final String prefix="/jsp/business/customer/";
	
	private String customer_manager_view= null;//客户信息管理界面
	
	@Resource(name="customerServiceImpl")
	private CustomerService customerService;
	
	
	
	@PostConstruct
	public void init(){
		if(customer_manager_view==null){
			customer_manager_view=prefix+"business_customer_index.jsp";//
		}
	}
	
	/**
	 * 客户管理
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/customer/manager/customer/customer_manager_view.html")
	public ModelAndView customerManager(HttpServletRequest request,HttpServletResponse response)throws Exception{
		return new  ModelAndView(customer_manager_view);
	}
	
	@RequestMapping("/customer/split_page.html")
	@ResponseBody
	public EasyuiSplitPager<Customer> getCustomerSplitPage(HttpServletRequest request,HttpServletResponse response,Customer customer)throws Exception{
		return customerService.getCustomerInfoSplitPage(customer);
	} 
	
	/**
	 * 获取联系人信息
	 * @param request
	 * @param response
	 * @param linkMan
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/customer/{type}/link_man_split_page.html")
	@ResponseBody
	public EasyuiSplitPager<LinkMan> getLinkManSplitPage(@PathVariable String type,HttpServletRequest request,HttpServletResponse response,LinkMan linkMan)throws Exception{
		if("sales".equalsIgnoreCase(type)){
			//linkMan.setLinkType(LinkManTypeEnums.CUSTOMER.getId());//客户
		}else if("supplier".equalsIgnoreCase(type)){
			//linkMan.setLinkType(LinkManTypeEnums.SUPPLIER.getId());//供应商
		}
		return customerService.getLinkManInfoSplitPage(linkMan);
	}
	
	
	
	
	
	@PreDestroy
	public void destroy(){
		if(customer_manager_view!=null){
			customer_manager_view=null;
		}
	}
}
