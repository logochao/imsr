package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.invoicing.ibatis.model.CategoryType;

public interface CategoryTypeDao {

	/**
	 * 获取所有项信息
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<CategoryType> getCategoryTypeAllList();

	/**
	 * 通过id（category_type）获取分类信息
	 * @param id  category_type
	 * @return
	 */
	public CategoryType getCategoryTypeById(int id);

	/**
	 * 添加分类信息
	 * @param model
	 */
	public void insertCategoryType(CategoryType model);

	/**
	 * 批量导入分类信息
	 * @param list
	 */
	public void batchInsertCategoryType(List<CategoryType> list);

	/**
	 * 通过category_type 修改分类信息
	 * @param model
	 * @return
	 */
	public boolean updateCategoryTypeById(CategoryType model);

	/**
	 * 通过批量更新分类信息
	 * @param list
	 */
	public void batchUpdateCategoryType(List<CategoryType> list);

	/**
	 * 根据主键删除分类信息
	 * @param id
	 * @return
	 */
	public boolean deleteCategoryTypeById(int id);

}