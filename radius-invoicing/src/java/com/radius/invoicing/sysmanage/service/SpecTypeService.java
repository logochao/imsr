package com.radius.invoicing.sysmanage.service;

import com.radius.base.page.EasyuiSplitPager;
import com.radius.base.utils.JsonUtils;
import com.radius.invoicing.ibatis.model.SpecType;

public interface SpecTypeService {

	/**
	 * 保存规格信息
	 * @param specType
	 * @return
	 */
	public JsonUtils<SpecType> addSpecTypeInfo(SpecType specType);

	/**
	 * 保存规格信息 <br/>当数据存在是为更新,当数据不存在则对其进行新增
	 * @param specType
	 * @return
	 */
	public JsonUtils saveSpecTypeInfo(SpecType specType);

	/**
	 * 更新规格信息
	 * @param specType
	 * @return
	 */
	public JsonUtils updateSpecTypeInfo(SpecType specType);
	
	
	
	/**
	 * 获取规格信息
	 * @param specType
	 * @return
	 */
	public EasyuiSplitPager<SpecType> getSpecTypeInfoList(SpecType specType);

}