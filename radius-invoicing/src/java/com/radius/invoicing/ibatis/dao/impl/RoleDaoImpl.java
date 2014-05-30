package com.radius.invoicing.ibatis.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.invoicing.ibatis.dao.RoleDao;
import com.radius.invoicing.ibatis.model.Role;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 角色DAO
 */
@Repository
@SuppressWarnings("unchecked")
public class RoleDaoImpl extends BaseIbatisDaoImpl<Role> implements RoleDao {

	private final String SQLMAPNAMESPACE="roleSqlMap.";
	
	public Role getRoleById(Integer roleId){
		return this.getObjectByCondition(roleId, SQLMAPNAMESPACE+"getRoleById");
	}
	
	public List<Role> getRole(Role role){
		return this.getListObject(role, SQLMAPNAMESPACE+"getRole");
	}
	
	public List<Role> getRoleAllList(){
		return this.getSqlMapClientTemplate().queryForList(SQLMAPNAMESPACE+"getRoleAllList");
	}
	
	public void insert(Role role){
		this.insert(role);
	}
	
	public boolean updateRole(Role role){
		return this.updateObject(role, SQLMAPNAMESPACE+"updateRoleById")>0;
	}
	
	public boolean deleteRoleById(Integer id){
		return this.deleteObject(id, SQLMAPNAMESPACE+"deleteRoleById")>0;
	}
}
