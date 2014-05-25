/**
 * 
 */
package com.radius.invoicing.staffmange.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.radius.base.page.EasyuiSplitPager;
import com.radius.base.utils.JsonUtils;

import com.radius.invoicing.ibatis.dao.StaffDao;
import com.radius.invoicing.ibatis.model.Staff;
import com.radius.invoicing.staffmange.service.StaffService;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
@Service
public class StaffServiceImpl implements StaffService    {

	@Autowired(required=false)
	@Qualifier("staffDaoImpl")
	private StaffDao staffDao;
	
	/**
	 * 通过条件查询获取easyui的分页对象
	 * @param staff
	 * @return
	 */
	public EasyuiSplitPager<Staff> getStaffSplitPage(Staff staff){
		EasyuiSplitPager<Staff> splitPage=new EasyuiSplitPager<Staff>();
		List<Staff> list=staffDao.getStaffByCondition(staff);
		splitPage.setRows(list);
		splitPage.setTotal(list.size());
		return splitPage;
	}
	
	
	/**
	 * 保存商品信息 <br> 1.如果存在,则更新;<br/>2.如果不存在,则添加
	 * @param staff
	 * @return
	 */
	public JsonUtils saveStaffInfo(Staff staff,String statusCode){
		Staff temp = staffDao.getStaff(staff.getId());
		if(temp!=null){
			return updateStaffInfo(staff,statusCode);
		}
		return addStaffInfo(staff,statusCode);
	}
	
	
	/**
	 * 更新商品信息
	 * @param staff
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public JsonUtils updateStaffInfo(Staff staff,String statusCode){
		JsonUtils jsonUtils =new JsonUtils();
		jsonUtils.setMessage("更新商品信息失败...");
		
		boolean success = staffDao.updateStaff(staff);
		if(success){
			jsonUtils.setMessage("更新商品信息成功...");
		}
		jsonUtils.setSuccess(success);
		jsonUtils.setChild(statusCode);
		return jsonUtils;
	}
	/**
	 * 添加商品信息
	 * @param staff
	 * @return
	 */
	
	@SuppressWarnings("unchecked")
	public JsonUtils addStaffInfo(Staff staff,String statusCode){
		JsonUtils jsonUtils =new JsonUtils();
		jsonUtils.setMessage("添加商品信息失败...");
		staff.setId(staffDao.getStaffMaxId());
		staffDao.insert(staff);
		jsonUtils.setSuccess(true);
		jsonUtils.setMessage("添加商品信息成功...");
		staff.setBackup(statusCode);
		jsonUtils.setChild(staff);
		return jsonUtils;
	}
}
