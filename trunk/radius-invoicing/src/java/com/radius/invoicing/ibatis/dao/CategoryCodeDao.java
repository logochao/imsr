package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.invoicing.ibatis.model.CategoryCode;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface CategoryCodeDao {

	/**
	 * 通过分类编码编号获取分类信息
	 * @param id
	 * @return
	 */
	public CategoryCode getCategoryCodeById(int id);

	/**
	 * 通过分类编号获取分类编码中最大的编码
	 * @param parentId
	 * @return
	 */
	public Long getCategoryCodeMaxIdByParentId(int parentId);

	/**
	 * 通过分类编号获取分类编码信息
	 * @param parentId
	 * @return
	 */

	public List<CategoryCode> getCategoryCodeByParentId(int parentId);

	/**
	 * 获取全部的分类编码信息
	 * @return
	 */
	public List<CategoryCode> getCategoryCodeAllList();

	/**
	 * 保存分类编码信息
	 * @param code
	 */
	public void insertCategoryCode(CategoryCode code);

	/**
	 * 批量插入分类编码信息
	 * @param list
	 */
	public void batchInsertCategoryCode(List<CategoryCode> list);

	/**
	 * 更新分类编码信息
	 * @param code
	 * @return
	 */
	public boolean updateCategoryCodeById(CategoryCode code);

	/**
	 * 通过批处理更新分类编码信息
	 * @param list
	 */
	public void batchUpdateCategoryCodeById(List<CategoryCode> list);

	/**
	 * 通过主键删除分类编码信息
	 * @param id
	 */
	public void deleteCategoryCodeById(int id);

	/**
	 * 通过分类编号删除分类编码信息
	 * @param parentId
	 */
	public void deleteCategoryCodeByParentId(int parentId);

}