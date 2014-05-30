package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.invoicing.ibatis.model.Role;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface RoleDao {

	public Role getRoleById(Integer roleId);

	public List<Role> getRole(Role role);

	public List<Role> getRoleAllList();

	public void insert(Role role);

	public boolean updateRole(Role role);

	public boolean deleteRoleById(Integer id);

}