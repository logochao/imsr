package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.base.page.Pager;
import com.radius.invoicing.ibatis.model.Customer;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface CustomerDao {

	/**
	 * 通过分页查询
	 * @param pageNo
	 * @param countSQL
	 * @param splitPageSQL
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Pager<Customer> getCustomerSplitPageBySQL(int pageNo,
			String countSQL, String splitPageSQL);

	/**
	 * 通过编号获取客户信息
	 * @param id
	 * @return
	 */
	public Customer getCustomerById(String id);

	/**
	 * 通过条件进行查询获取客户信息
	 * @param c
	 * @return
	 */
	public List<Customer> getCustomerByCondition(Customer c);

	/**
	 * 保存客户信息
	 * @param c
	 */
	public void insertCustomer(Customer c);

	/**
	 * 通过编号更新客户信息
	 * @param c
	 * @return
	 */
	public boolean updateCustomerById(Customer c);
	
	
	public String getCustomerMaxId();

}