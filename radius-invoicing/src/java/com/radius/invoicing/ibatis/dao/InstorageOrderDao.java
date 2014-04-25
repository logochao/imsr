package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.invoicing.ibatis.model.InstorageOrder;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface InstorageOrderDao {

	/***
	 * 通过主键获取入库信息
	 * @param instoreId
	 * @return
	 */
	public InstorageOrder getInstorageOrderById(String instoreId);

	/**
	 * 通过条件查询入库信息
	 * @param instoreOrder
	 * @return
	 */
	public List<InstorageOrder> getInstorageOrderCondition(
			InstorageOrder instoreOrder);

	/**
	 * 通过主键查询是否存在入库信息
	 * @param instoreId
	 * @return
	 */
	public Integer getInstorageOrderCountById(String instoreId);

	/**
	 * 保存入库信息
	 * @param instoreOrder
	 */
	public void insertInstoreOrder(InstorageOrder instoreOrder);

	/**
	 * 批量保存入库信息
	 * @param list
	 */
	public void batchInsertInstoreOrder(List<InstorageOrder> list);

	/**
	 * 更新入库信息
	 * @param instoreOrder
	 * @return
	 */
	public boolean updateInstorageOrder(InstorageOrder instoreOrder);

	/**
	 * 批量更新入库信息
	 * @param list
	 */
	public void batchUpdateInstorageOrder(List<InstorageOrder> list);

	/**
	 * 更新入库信息状态
	 * @param instoreOrder
	 * @return
	 */
	public boolean updateInstoreOrderStatus(InstorageOrder instoreOrder);

	/**
	 * 删除入库信息
	 * @param instoreOrder
	 * @return
	 */
	public boolean deleteInstorageOrderByCondition(InstorageOrder instoreOrder);

	/**
	 * 批量删除入库信息（通过主键）
	 * @param list
	 */
	public void batchDeleteInstorageOrder(List<InstorageOrder> list);

	/**
	 * 通过主键删除入库信息
	 * @param instoreId
	 * @return
	 */
	public boolean deleteInstorageOrderById(String instoreId);

}