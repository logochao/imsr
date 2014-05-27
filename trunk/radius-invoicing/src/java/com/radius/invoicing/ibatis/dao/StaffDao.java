package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.base.page.Pager;
import com.radius.invoicing.ibatis.model.Staff;

public interface StaffDao {

	/**
	 * 获取商品信息
	 * @param staff
	 * @return
	 */
	public abstract Staff getStaff(String staffId);

	/**
	 * 保存商品信息
	 * @param staff
	 */
	public abstract void insert(Staff staff);

	/**
	 * 更新商品信息
	 * @param staff
	 * @return
	 */
	public abstract boolean updateStaff(Staff staff);

	/**
	 * 删除商品信息
	 * @param staff
	 */
	public abstract void deleteStaff(Staff staff);

	/**
	 * 通过分页SQL获取分页对象
	 * @param pageNo
	 * @param countSQL
	 * @param splitPageSQL
	 * @return
	 */
	public abstract Pager<Staff> getStaffSplitPageBySQL(int pageNo,
			String countSQL, String splitPageSQL);

	/**
	 * 通过条件查询
	 * @param staff
	 * @return
	 */
	public abstract List<Staff> getStaffByCondition(Staff staff);

	/**
	 * 通过供应商编号与商品信息进行查询
	 * @param staff
	 * @return
	 */
	public abstract List<String> getStaffInfoBySupplierAndStaff(Staff staff);

	public abstract String getStaffMaxId();

	public abstract List<Staff> getGoodsByCondition(Staff staff);

}