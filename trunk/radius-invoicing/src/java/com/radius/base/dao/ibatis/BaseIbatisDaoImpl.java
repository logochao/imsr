package com.radius.base.dao.ibatis;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.ibatis.sqlmap.client.SqlMapClient;


public class BaseIbatisDaoImpl extends SqlMapClientDaoSupport{

	/**
	 * ���������������Զ����ݿ���в��� ��ÿһ�����ݿⶼ����һ��dao��  �������������� �ڷ�������
	 * <code>@Resouce("sqlMapclient")����ľ�������</code>
	 * @param sqlMapClient
	 */
	public void setSqlMapClientBase(SqlMapClient sqlMapClient) {
		super.setSqlMapClient(sqlMapClient);
	}
}
