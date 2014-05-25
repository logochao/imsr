package com.radius.invoicing.staffmange.service;

import com.radius.base.page.EasyuiSplitPager;
import com.radius.base.utils.JsonUtils;
import com.radius.invoicing.ibatis.model.Staff;

public interface StaffService {

	/**
	 * 通过条件查询获取easyui的分页对象
	 * @param staff
	 * @return
	 */
	public abstract EasyuiSplitPager<Staff> getStaffSplitPage(Staff staff);

	/**
	 * 保存商品信息 <br> 1.如果存在,则更新;<br/>2.如果不存在,则添加
	 * @param staff
	 * @return
	 */
	public abstract JsonUtils saveStaffInfo(Staff staff, String statusCode);

	/**
	 * 更新商品信息
	 * @param staff
	 * @return
	 */
	public abstract JsonUtils updateStaffInfo(Staff staff, String statusCode);

	/**
	 * 添加商品信息
	 * @param staff
	 * @return
	 */
	public abstract JsonUtils addStaffInfo(Staff staff, String statusCode);

}