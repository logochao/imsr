package com.radius.base.dao;

import java.util.List;
import java.util.Map;

import com.radius.base.BaseEntity;
import com.radius.base.page.Pager;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">�²���</a>
 * @version ����ʱ�䣺2013-12-8 ����12:53:04<br/>
 * Copyright (c) 2013 by �²���.<br/>
 * ��˵��
 */
public interface BaseIbatisDao<E extends BaseEntity> {

	/**
	 * ͨ��ʵ�������з�ҳ��ѯ
	 * @param e
	 * @param countKey
	 * @param selectKey
	 * @return
	 */
	public Pager<E> getPagerListObject(E e, String countKey, String selectKey);

	/**
	 * ͨ��Map������з�ҳ��ѯ
	 * @param map
	 * @param countKey
	 * @param selectKey
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Pager getPagerListObject(Map map, String countKey, String selectKey,
			int pageNo);

	/**
	 * ͨ��map������Ӳ�ѯ���� 
	 * @param map
	 * @param statementName ��Ӧnamespace.id���ж�Ϊһ��keyֵ
	 * @return
	 */
	public List getListObject(Map map, String statementName);

	/**
	 * ͨ��Map������ѯ����Ҫ��ļ�¼����
	 * @param map
	 * @param statementName ��Ӧnamespace.id���ж�Ϊһ��keyֵ
	 * @return
	 */
	public Integer getCountByCondition(Map map, String statementName);

	/**
	 * ͨ��ʵ������ѯ����Ҫ��ļ�¼�б�
	 * @param e
	 * @param statementName
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<E> getListObject(E e, String statementName);

	/**
	 * ͨ��ʵ������ѯ����Ҫ��ļ�¼����
	 * @param e
	 * @param statementName ��Ӧnamespace.id���ж�Ϊһ��keyֵ
	 * @return
	 */
	public Integer getCountByCondition(E e, String statementName);

	/**
	 * �������
	 * @param e
	 * @param statementName ��Ӧnamespace.id���ж�Ϊһ��keyֵ
	 */
	public void insertObject(E e, String statementName);

	/**
	 * ͨ����������б������
	 * @param list
	 * @param statementName
	 */
	@SuppressWarnings("unchecked")
	public void batchInsertListObject(final List<E> list,
			final String statementName);

	/**
	 * ������Ϣ
	 * @param e
	 * @param statementName
	 * @return 
	 */
	public int updateObject(E e, String statementName);

	/**
	 * ����������Ϣ
	 * @param list
	 * @param statementName
	 */
	@SuppressWarnings("unchecked")
	public void updateListObject(final List<E> list, final String statementName);

	/**
	 * ɾ������
	 * @param e
	 * @param statementName
	 * @return
	 */
	public int deleteObject(E e, String statementName);

	/**
	 * ͨ��������ɾ������
	 * @param list
	 * @param statementName
	 */
	@SuppressWarnings("unchecked")
	public void batchDeleteListObject(final List<E> list,
			final String statementName);

}