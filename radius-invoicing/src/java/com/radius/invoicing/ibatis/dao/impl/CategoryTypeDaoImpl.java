/**
 * 
 */
package com.radius.invoicing.ibatis.dao.impl;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.invoicing.ibatis.dao.CategoryTypeDao;
import com.radius.invoicing.ibatis.model.CategoryType;

/**
 * @author Administrator
 *
 */
@Repository
public class CategoryTypeDaoImpl extends BaseIbatisDaoImpl<CategoryType> implements CategoryTypeDao {

	/**
	 * 获取所有项信息
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<CategoryType> getCategoryTypeAllList(){
		return this.getSqlMapClientTemplate().queryForList("categoryTypeSqlMap.getCategoryTypeAllList");
	}
	
	/**
	 * 通过id（category_type）获取分类信息
	 * @param id  category_type
	 * @return
	 */
	public CategoryType getCategoryTypeById(int id){
		return this.getObjectByCondition(id, "categoryTypeSqlMap.getCategoryTypeById");
	}
	
	/**
	 * 添加分类信息
	 * @param model
	 */
	public void insertCategoryType(CategoryType model){
		 this.insertObject(model, "categoryTypeSqlMap.insert");
	}
	
	/**
	 * 批量导入分类信息
	 * @param list
	 */
	public void batchInsertCategoryType(List<CategoryType> list){
		this.batchInsertListObject(list, "categoryTypeSqlMap.insert");
	}
	
	/**
	 * 通过category_type 修改分类信息
	 * @param model
	 * @return
	 */
	public boolean updateCategoryTypeById(CategoryType model){
		return this.updateObject(model, "categoryTypeSqlMap.updateCategoryTypeById")==1;
	}
	
	/**
	 * 通过批量更新分类信息
	 * @param list
	 */
	public void batchUpdateCategoryType(List<CategoryType> list){
		this.batchInsertListObject(list, "categoryTypeSqlMap.updateCategoryTypeById");
	}
	
	/**
	 * 根据主键删除分类信息
	 * @param id
	 * @return
	 */
	public boolean deleteCategoryTypeById(int id){
		return this.deleteObject(id, "categoryTypeSqlMap.deleteCategoryTypeById")==1;
	}
	
}
