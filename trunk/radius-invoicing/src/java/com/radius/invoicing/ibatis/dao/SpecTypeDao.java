package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.invoicing.ibatis.model.SpecType;

public interface SpecTypeDao {

	/**
	 * 通过主键获取规格信息
	 * @param id
	 * @return
	 */
	public SpecType getSpecTypeById(Integer id);

	/**
	 * 保存规格信息并返回当前的主键（编号）
	 * @param specType
	 * @return
	 */
	public Integer insert(SpecType specType);

	/**
	 * 批量更新
	 * @param list
	 */
	public void batchInsert(List<SpecType> list);

	/**
	 * 根据条件查询规格信息
	 * @param specType
	 * @return
	 */
	public List<SpecType> getSpecType(SpecType specType);

	/**
	 * 通过主键删除规格信息
	 * @param specId
	 */
	public boolean deleteSpecTypeById(Integer specId);

	public void batchDeleteSpecTypeById(List<SpecType> list);

	/**
	 * 通过条件删除规格信息
	 * @param specType
	 * @return
	 */
	public boolean deleteSpecType(SpecType specType);

}