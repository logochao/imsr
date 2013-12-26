package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.invoicing.ibatis.model.Account;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface AccountDao {

	/**
	 * 查询所有的帐套
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Account> getAccountAllList();

	/**
	 * 根据帐套编号获取帐套信息
	 * @param id
	 * @return
	 */
	public Account getLedgerById(String id);

	/**
	 * 添加帐套信息
	 * @param account
	 */
	public void insertAccount(Account account);

	/**
	 * 批处理添加帐套信息
	 * @param list
	 */
	public void insertBatchAccount(List<Account> list);

	/**
	 * 更新帐套信息
	 * @param account
	 * @return
	 */
	public boolean updateAccountById(Account account);

	/**
	 * 根据机构编号删除帐套信息
	 * @param institution
	 * @return
	 */
	public boolean deleteAccountByInstitution(String institution);

	/**
	 * 根据帐套编号删除帐套信息
	 * @param id
	 * @return
	 */
	public boolean deleteAccountById(String id);

}