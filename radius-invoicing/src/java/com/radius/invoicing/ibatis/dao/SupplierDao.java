package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.base.page.Pager;
import com.radius.invoicing.ibatis.model.Supplier;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface SupplierDao {

	/**
	 * 通过分页SQL获取分页对象
	 * @param pageNo
	 * @param countSQL
	 * @param splitPageSQL
	 * @return
	 */
	public Pager<Supplier> getSupplierSplitPageBySQL(int pageNo,
			String countSQL, String splitPageSQL);

	/**
	 * 通过id获取供应商信息
	 * @param id
	 * @return
	 */
	public Supplier getSupplierById(String id);

	/**
	 * 通过条件进行查询
	 * @param s
	 * @return
	 */
	public List<Supplier> getSupplierByCondition(Supplier s);

	/**
	 * 添加供应商信息
	 * @param s
	 */
	public void insertSupplier(Supplier s);

	/**
	 * 更新供应商信息
	 * @param s
	 * @return
	 */
	public boolean updateSupplier(Supplier s);

	/**
	 * 删除供应商信息
	 * @param id
	 * @return
	 */
	public boolean deleteSupplier(String id);

}