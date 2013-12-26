/**
 * 
 */
package com.radius.invoicing.ibatis.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.invoicing.ibatis.dao.AccountDao;
import com.radius.invoicing.ibatis.model.Account;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
@Repository
public class AccountDaoImpl extends BaseIbatisDaoImpl<Account> implements AccountDao{

	/**
	 * 查询所有的帐套
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Account> getAccountAllList(){
		return this.getSqlMapClientTemplate().queryForList("accountSqlMap.getAccountAllList");
	}
	
	/**
	 * 根据帐套编号获取帐套信息
	 * @param id
	 * @return
	 */
	public Account getLedgerById(String id){
		return (Account)this.getSqlMapClientTemplate().queryForList("accountSqlMap.getLedgerById", id);
	} 
	
	/**
	 * 添加帐套信息
	 * @param account
	 */
	public void insertAccount(Account account){
		this.insertObject(account, "accountSqlMap.insert");
	}
	/**
	 * 批处理添加帐套信息
	 * @param list
	 */
	public void insertBatchAccount(List<Account> list){
		this.batchInsertListObject(list, "accountSqlMap.insert");
	}
	
	/**
	 * 更新帐套信息
	 * @param account
	 * @return
	 */
	public boolean updateAccountById(Account account){
		 return this.updateObject(account, "accountSqlMap.updateAccountById")==1;
	}
	
	/**
	 * 根据机构编号删除帐套信息
	 * @param institution
	 * @return
	 */
	public boolean deleteAccountByInstitution(String institution){
		return this.getSqlMapClientTemplate().delete("accountSqlMap.deleteAccountByInstitution", institution)==1;
	}
	
	/**
	 * 根据帐套编号删除帐套信息
	 * @param id
	 * @return
	 */
	public boolean deleteAccountById(String id){
		return this.getSqlMapClientTemplate().delete("accountSqlMap.deleteAccountById", id)==1;
	}
}
