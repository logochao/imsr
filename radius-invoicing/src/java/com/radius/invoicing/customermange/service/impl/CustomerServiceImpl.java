/**
 * 
 */
package com.radius.invoicing.customermange.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.radius.base.page.EasyuiSplitPager;
import com.radius.invoicing.customermange.service.CustomerService;
import com.radius.invoicing.ibatis.dao.CustomerDao;
import com.radius.invoicing.ibatis.dao.LinkManDao;
import com.radius.invoicing.ibatis.model.Customer;
import com.radius.invoicing.ibatis.model.LinkMan;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 客户处理service层
 */
@Service
public class CustomerServiceImpl implements CustomerService {

	@Resource(name="customerDaoImpl")
	CustomerDao customerDao;
	
	@Resource(name="linkManDaoImpl")
	LinkManDao linkManDao;
	
	
	
	
	/**
	 * 通过条件查询获取easyui对象的分页对象
	 * @param customer
	 * @return
	 */
	public EasyuiSplitPager<Customer> getCustomerInfoSplitPage(Customer customer){
		EasyuiSplitPager<Customer> customerEasyuiSplitPage=new EasyuiSplitPager<Customer>();
		List<Customer> list=customerDao.getCustomerByCondition(customer);
		customerEasyuiSplitPage.setRows(list);
		customerEasyuiSplitPage.setTotal(list.size());
		return customerEasyuiSplitPage;
	}
	/**
	 * 根据条件查询联系人信息
	 * @param linkman
	 * @return
	 */
	public EasyuiSplitPager<LinkMan> getLinkManInfoSplitPage(LinkMan linkman){
		EasyuiSplitPager<LinkMan> customerEasyuiSplitPage=new EasyuiSplitPager<LinkMan>();
		List<LinkMan> list= linkManDao.getLinkManByCondition(linkman);
		customerEasyuiSplitPage.setRows(list);
		customerEasyuiSplitPage.setTotal(list.size());
		return customerEasyuiSplitPage;
	}
}
