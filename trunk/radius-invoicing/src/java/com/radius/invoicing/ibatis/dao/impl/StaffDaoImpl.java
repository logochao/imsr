/**
 * 
 */
package com.radius.invoicing.ibatis.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.base.page.Pager;
import com.radius.base.utils.StringUtils;
import com.radius.invoicing.ibatis.dao.StaffDao;
import com.radius.invoicing.ibatis.model.Staff;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 商品信息
 */
@Repository
@SuppressWarnings("unchecked")
public class StaffDaoImpl extends BaseIbatisDaoImpl<Staff> implements StaffDao  {

	/**
	 * 获取商品信息
	 * @param staff
	 * @return
	 */
	public Staff getStaff(String staffId){
		return this.getObjectByCondition(staffId, "staffSqlMap.getStaff");
	}
	/**
	 * 保存商品信息
	 * @param staff
	 */
	public  void insert(Staff staff){
		this.insertObject(staff, "staffSqlMap.insertStaff");
	}
	/**
	 * 更新商品信息
	 * @param staff
	 * @return
	 */
	public boolean updateStaff(Staff staff){
		return this.updateObject(staff, "staffSqlMap.updateStaff")==1;
	}
	
	/**
	 * 删除商品信息
	 * @param staff
	 */
	public void deleteStaff(Staff staff){
		this.deleteObject(staff, "staffSqlMap.deleteStaff");
	}
	
	
	/**
	 * 通过分页SQL获取分页对象
	 * @param pageNo
	 * @param countSQL
	 * @param splitPageSQL
	 * @return
	 */
	public Pager<Staff> getStaffSplitPageBySQL(int pageNo,String countSQL,String splitPageSQL){
		List<Staff> list=this.getSqlMapClientTemplate().queryForList("staffSqlMap.getStaffSplitPageBySQL",splitPageSQL);
		Integer rowCount=(Integer)this.getSqlMapClientTemplate().queryForObject("staffSqlMap.getStaffplitPageCountSQL", countSQL);
		Pager<Staff> page=new Pager<Staff>(pageNo, rowCount, list);
		return page;
	}
	
	/**
	 * 通过条件查询
	 * @param staff
	 * @return
	 */
	public List<Staff> getStaffByCondition(Staff staff){
		return this.getSqlMapClientTemplate().queryForList("staffSqlMap.getStaffByCondition",staff);
	}
	/**
	 * 通过供应商编号与商品信息进行查询
	 * @param staff
	 * @return
	 */
	public List<String> getStaffInfoBySupplierAndStaff(Staff staff){
		return this.getSqlMapClientTemplate().queryForList("staffSqlMap.getStaffInfoBySupplierAndGoods", staff);
	}
	
	public String getStaffMaxId(){
		Integer id=(Integer)this.getSqlMapClientTemplate().queryForObject("staffSqlMap.getStaffMaxId");
		return StringUtils.getSpecifyStringByLengthBefore((id.intValue()+1)+"", 4, "0");
	}
	public List<Staff> getGoodsByCondition(Staff staff) {
		// TODO Auto-generated method stub
		return null;
	}
}
