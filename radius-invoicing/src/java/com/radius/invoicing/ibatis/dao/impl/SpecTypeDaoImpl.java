package com.radius.invoicing.ibatis.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.invoicing.ibatis.dao.SpecTypeDao;
import com.radius.invoicing.ibatis.model.SpecType;

@Repository
@SuppressWarnings("unchecked")
public class SpecTypeDaoImpl extends BaseIbatisDaoImpl<SpecType> implements SpecTypeDao{

	private final String SQLMAPNAMESPACE="specTypeSqlMap."; 
	
	public List<SpecType> getSpecTypeAllList(){
		return this.getSqlMapClientTemplate().queryForList(SQLMAPNAMESPACE+"getSpecTypeAllList");
	}
	
	
	/**
	 * 通过主键获取规格信息
	 * @param id
	 * @return
	 */
	public SpecType getSpecTypeById(Integer id){
		return this.getObjectByCondition(id, SQLMAPNAMESPACE+"getSpecTypeById");
	}
	
	/**
	 * 保存规格信息并返回当前的主键（编号）
	 * @param specType
	 * @return
	 */
	public Integer  insert(SpecType specType){
		return (Integer)this.getSqlMapClientTemplate().insert(SQLMAPNAMESPACE+"insert", specType);
	}
	
	/**
	 * 批量更新
	 * @param list
	 */
	public void batchInsert(List<SpecType> list){
		this.batchInsertListObject(list, SQLMAPNAMESPACE+"insert");
	}
	/**
	 * 根据条件查询规格信息
	 * @param specType
	 * @return
	 */
	public List<SpecType> getSpecType(SpecType specType){
		return this.getListObject(specType, SQLMAPNAMESPACE+"getSpecType");
	}
	
	/**
	 * 通过主键删除规格信息
	 * @param specId
	 */
	public boolean  deleteSpecTypeById(Integer specId){
		return  this.deleteObject(specId, SQLMAPNAMESPACE+"deleteById")==1;
	}
	
	public void  batchDeleteSpecTypeById(List<SpecType> list){
		this.batchDeleteListObject(list, SQLMAPNAMESPACE+"deleteById");
	}
	
	/**
	 * 通过条件删除规格信息
	 * @param specType
	 * @return
	 */
	public boolean deleteSpecType(SpecType specType){
		return this.deleteObject(specType, SQLMAPNAMESPACE+"delete")==1;
	}
	/**
	 * 更新规格信息
	 * @param specType
	 * @return
	 */
	public boolean updateSpecType(SpecType specType){
		return this.updateObject(specType, SQLMAPNAMESPACE+"updateSpecType")==1;
	}
}
