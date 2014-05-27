package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.base.page.Pager;
import com.radius.invoicing.ibatis.model.Institution;

public interface InstitutionDao {

	/**
	 * 获取商品信息
	 * @param institution
	 * @return
	 */
	public abstract Institution getInstitution(String institutionId);

	/**
	 * 保存商品信息
	 * @param institution
	 */
	public abstract void insert(Institution institution);

	/**
	 * 更新商品信息
	 * @param institution
	 * @return
	 */
	public abstract boolean updateInstitution(Institution institution);

	/**
	 * 删除商品信息
	 * @param institution
	 */
	public abstract void deleteInstitution(Institution institution);

	/**
	 * 通过分页SQL获取分页对象
	 * @param pageNo
	 * @param countSQL
	 * @param splitPageSQL
	 * @return
	 */
	public abstract Pager<Institution> getInstitutionSplitPageBySQL(int pageNo,
			String countSQL, String splitPageSQL);

	/**
	 * 通过条件查询
	 * @param institution
	 * @return
	 */
	public abstract List<Institution> getInstitutionByCondition(
			Institution institution);

	/**
	 * 通过供应商编号与商品信息进行查询
	 * @param institution
	 * @return
	 
	 public List<String> getInstitutionInfoBySupplierAndInstitution(Institution institution){
	 return this.getSqlMapClientTemplate().queryForList("institutionSqlMap.getInstitutionInfoBySupplierAndInstitution", institution);
	 }
	 */
	public abstract String getInstitutionMaxId();

}