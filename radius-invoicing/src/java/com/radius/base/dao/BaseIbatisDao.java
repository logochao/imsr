package com.radius.base.dao;

import java.util.List;
import java.util.Map;

import com.radius.base.BaseEntity;
import com.radius.base.page.Pager;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface BaseIbatisDao<E extends BaseEntity> {

	/**
	 * 通过实体对象进行分页查询
	 * @param e
	 * @param countKey
	 * @param selectKey
	 * @return
	 */
	public Pager<E> getPagerListObject(E e, String countKey, String selectKey);

	/**
	 * 通过Map对象进行分页查询
	 * @param map
	 * @param countKey
	 * @param selectKey
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Pager getPagerListObject(Map map, String countKey, String selectKey,
			int pageNo);

	/**
	 * 通过map对象添加查询条件 
	 * @param map
	 * @param statementName 对应namespace.id来判断为一个key值
	 * @return
	 */
	public List getListObject(Map map, String statementName);

	/**
	 * 通过Map条件查询符合要求的记录个数
	 * @param map
	 * @param statementName 对应namespace.id来判断为一个key值
	 * @return
	 */
	public Integer getCountByCondition(Map map, String statementName);

	/**
	 * 通过实体对象查询符合要求的记录列表
	 * @param e
	 * @param statementName
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<E> getListObject(E e, String statementName);

	/**
	 * 通过实体对象查询符合要求的记录个数
	 * @param e
	 * @param statementName 对应namespace.id来判断为一个key值
	 * @return
	 */
	public Integer getCountByCondition(E e, String statementName);

	/**
	 * 保存对象
	 * @param e
	 * @param statementName 对应namespace.id来判断为一个key值
	 */
	public void insertObject(E e, String statementName);

	/**
	 * 通过批处理进行保存对象
	 * @param list
	 * @param statementName
	 */
	@SuppressWarnings("unchecked")
	public void batchInsertListObject(final List<E> list,
			final String statementName);

	/**
	 * 更新信息
	 * @param e
	 * @param statementName
	 * @return 
	 */
	public int updateObject(E e, String statementName);

	/**
	 * 批量更新信息
	 * @param list
	 * @param statementName
	 */
	@SuppressWarnings("unchecked")
	public void updateListObject(final List<E> list, final String statementName);

	/**
	 * 删除对象
	 * @param e
	 * @param statementName
	 * @return
	 */
	public int deleteObject(E e, String statementName);

	/**
	 * 通过批处理删除对象
	 * @param list
	 * @param statementName
	 */
	@SuppressWarnings("unchecked")
	public void batchDeleteListObject(final List<E> list,
			final String statementName);

}