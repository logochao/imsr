/**
 * 
 */
package com.radius.invoicing.ibatis.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.invoicing.ibatis.dao.UserDao;
import com.radius.invoicing.ibatis.model.User;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 用户信息DAO
 */
@Repository
public class UserDaoImpl extends BaseIbatisDaoImpl<User> implements UserDao {

	private final String SQLMAPNAMESPACE="userSqlMap.";
	/**
	 * 通过uid获取用户信息
	 * @param uid
	 * @return
	 */
	public User getUserByUid(String uid){
		return this.getObjectByCondition(uid, SQLMAPNAMESPACE+"getUserByUid");
	}
	/**
	 * 通过条件查询获取用户信息
	 * @param user
	 * @return
	 */
	public List<User> getUser(User user){
		return this.getListObject(user, SQLMAPNAMESPACE+"getUserByCondition");
	}
	/**
	 * 保存用户信息
	 * @param user
	 */
	public void insert(User user){
		this.insertObject(user, SQLMAPNAMESPACE+"insert");
	}
	/**
	 * 批量保存用户信息
	 * @param list
	 */
	public void batchInsertUser(List<User> list){
		this.batchInsertListObject(list, SQLMAPNAMESPACE+"insert");
	}
	/**
	 * 更新用户信息
	 * @param user
	 * @return
	 */
	public boolean updateUser(User user){
		return this.updateObject(user, SQLMAPNAMESPACE+"updateUser")>0;
	}
	/**
	 * 通过主键删除用户信息
	 * @param id
	 * @return
	 */
	public boolean deleteUserById(Integer id){
		return this.deleteObject(id, SQLMAPNAMESPACE+"deleteUserById")>0;
	}
	/**
	 * 通过uid删除用户信息
	 * @param uid
	 * @return
	 */
	public boolean deleteUserByUid(String uid){
		return this.deleteObject(uid, SQLMAPNAMESPACE+"deleteUserByUid")>0;
	}
}
