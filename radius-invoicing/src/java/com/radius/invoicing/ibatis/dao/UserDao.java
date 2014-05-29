package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.invoicing.ibatis.model.User;

public interface UserDao {

	/**
	 * 通过uid获取用户信息
	 * @param uid
	 * @return
	 */
	public User getUserByUid(String uid);

	/**
	 * 通过条件查询获取用户信息
	 * @param user
	 * @return
	 */
	public List<User> getUser(User user);

	/**
	 * 保存用户信息
	 * @param user
	 */
	public void insert(User user);

	/**
	 * 批量保存用户信息
	 * @param list
	 */
	public void batchInsertUser(List<User> list);

	/**
	 * 更新用户信息
	 * @param user
	 * @return
	 */
	public boolean updateUser(User user);

	/**
	 * 通过主键删除用户信息
	 * @param id
	 * @return
	 */
	public boolean deleteUserById(Integer id);

	/**
	 * 通过uid删除用户信息
	 * @param uid
	 * @return
	 */
	public boolean deleteUserByUid(String uid);

}