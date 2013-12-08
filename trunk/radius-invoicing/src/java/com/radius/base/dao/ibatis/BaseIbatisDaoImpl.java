package com.radius.base.dao.ibatis;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.ibatis.sqlmap.client.SqlMapClient;


public class BaseIbatisDaoImpl extends SqlMapClientDaoSupport{

	/**
	 * 如有特殊的需求如对多数据库进行操作 则每一个数据库都定义一个dao类  并都添加这个方法 在方法上面
	 * <code>@Resouce("sqlMapclient")具体的具体设置</code>
	 * @param sqlMapClient
	 */
	public void setSqlMapClientBase(SqlMapClient sqlMapClient) {
		super.setSqlMapClient(sqlMapClient);
	}
}
