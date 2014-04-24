package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.invoicing.ibatis.model.InstoreOrder;

public interface InstoreOrderDao {

	/***
	 * 通过主键获取入库信息
	 * @param instoreId
	 * @return
	 */
	public InstoreOrder getInstoreOrderById(String instoreId);

	/**
	 * 通过条件查询入库信息
	 * @param instoreOrder
	 * @return
	 */
	public List<InstoreOrder> getInstoreOrderCondition(InstoreOrder instoreOrder);

	/**
	 * 通过主键查询是否存在入库信息
	 * @param instoreId
	 * @return
	 */
	public Integer getInstoreOrderCountById(String instoreId);

	/**
	 * 保存入库信息
	 * @param instoreOrder
	 */
	public void insertInstoreOrder(InstoreOrder instoreOrder);

	/**
	 * 批量保存入库信息
	 * @param list
	 */
	public void batchInsertInstoreOrder(List<InstoreOrder> list);

	/**
	 * 更新入库信息
	 * @param instoreOrder
	 * @return
	 */
	public boolean updateInstoreOrder(InstoreOrder instoreOrder);

	/**
	 * 批量更新入库信息
	 * @param list
	 */
	public void batchUpdateInstoreOrder(List<InstoreOrder> list);

	/**
	 * 更新入库信息状态
	 * @param instoreOrder
	 * @return
	 */
	public boolean updateInstoreOrderStatus(InstoreOrder instoreOrder);

	/**
	 * 删除入库信息
	 * @param instoreOrder
	 * @return
	 */
	public boolean deleteInstoreOrderByCondition(InstoreOrder instoreOrder);

	/**
	 * 批量删除入库信息（通过主键）
	 * @param list
	 */
	public void batchDeleteInstoreOrder(List<InstoreOrder> list);

	/**
	 * 通过主键删除入库信息
	 * @param instoreId
	 * @return
	 */
	public boolean deleteInstoreOrderById(String instoreId);

}