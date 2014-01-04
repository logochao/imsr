/**
 * 
 */
package com.radius.invoicing.ibatis.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.invoicing.ibatis.dao.CategoryCodeDao;
import com.radius.invoicing.ibatis.model.CategoryCode;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明  分类编码
 */
@Repository
@SuppressWarnings("unchecked")
public class CategoryCodeDaoImpl extends BaseIbatisDaoImpl<CategoryCode> implements CategoryCodeDao {

	/**
	 * 通过分类编码编号获取分类信息
	 * @param id
	 * @return
	 */
	public CategoryCode getCategoryCodeById(int id){
		return this.getObjectByCondition(id, "categoryCodeSqlMap.getCategoryCodeById");
	}
	/**
	 * 通过分类编号获取分类编码中最大的编码
	 * @param parentId
	 * @return
	 */
	public Long getCategoryCodeMaxIdByParentId(int parentId){
		return (Long) this.getSqlMapClientTemplate().queryForObject("categoryCodeSqlMap.getCategoryIdByParentId", parentId);
	}
	
	/**
	 * 通过分类编号获取分类编码信息
	 * @param parentId
	 * @return
	 */
	
	public List<CategoryCode>getCategoryCodeByParentId(int parentId){
		return this.getSqlMapClientTemplate().queryForList("categoryCodeSqlMap.getCategoryCodeByParentId",parentId);
	}
	
	/**
	 * 获取全部的分类编码信息
	 * @return
	 */
	public List<CategoryCode> getCategoryCodeAllList(){
		return this.getSqlMapClientTemplate().queryForList("categoryCodeSqlMap.getCategoryCodeAllList");
	}
	
	/**
	 * 保存分类编码信息
	 * @param code
	 */
	public void insertCategoryCode(CategoryCode code){
		this.insertObject(code, "categoryCodeSqlMap.insert");
	}
	/**
	 * 批量插入分类编码信息
	 * @param list
	 */
	public void batchInsertCategoryCode(List<CategoryCode> list){
		this.batchDeleteListObject(list, "categoryCodeSqlMap.insert");
	}
	
	/**
	 * 更新分类编码信息
	 * @param code
	 * @return
	 */
	public boolean updateCategoryCodeById(CategoryCode code){
		return this.updateObject(code, "categoryCodeSqlMap.updateCategoryCodeById")==1;
	}
	/**
	 * 通过批处理更新分类编码信息
	 * @param list
	 */
	public void batchUpdateCategoryCodeById(List<CategoryCode> list){
		this.batchInsertListObject(list, "categoryCodeSqlMap.updateCategoryCodeById");
	}
	
	/**
	 * 通过主键删除分类编码信息
	 * @param id
	 */
	public void deleteCategoryCodeById(int id){
		this.deleteObject(id, "categoryCodeSqlMap.deleteCategoryCodeById");
	}
	
	/**
	 * 通过分类编号删除分类编码信息
	 * @param parentId
	 */
	public void deleteCategoryCodeByParentId(int parentId){
		this.deleteObject(parentId, "categoryCodeSqlMap.deleteCategoryCodeByParentId");
	}
}
