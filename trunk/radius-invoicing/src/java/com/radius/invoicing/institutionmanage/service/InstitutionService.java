package com.radius.invoicing.institutionmanage.service;

import com.radius.base.page.EasyuiSplitPager;
import com.radius.base.utils.JsonUtils;
import com.radius.invoicing.ibatis.model.Institution;

public interface InstitutionService {

	/**
	 * 通过条件查询获取easyui的分页对象
	 * @param institution
	 * @return
	 */
	public abstract EasyuiSplitPager<Institution> getInstitutionSplitPage(
			Institution institution);

	/**
	 * 保存商品信息 <br> 1.如果存在,则更新;<br/>2.如果不存在,则添加
	 * @param institution
	 * @return
	 */
	public abstract JsonUtils saveInstitutionInfo(Institution institution,
			String statusCode);

	/**
	 * 更新商品信息
	 * @param institution
	 * @return
	 */
	public abstract JsonUtils updateInstitutionInfo(Institution institution,
			String statusCode);

	/**
	 * 添加商品信息
	 * @param institution
	 * @return
	 */
	public abstract JsonUtils addInstitutionInfo(Institution institution,
			String statusCode);

}