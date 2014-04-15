/**
 * 
 */
package com.radius.invoicing.ibatis.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.base.page.Pager;
import com.radius.base.utils.StringUtils;
import com.radius.invoicing.ibatis.dao.SupplierDao;
import com.radius.invoicing.ibatis.model.Supplier;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
@Repository
@SuppressWarnings("unchecked")
public class SupplierDaoImpl extends BaseIbatisDaoImpl<Supplier> implements SupplierDao{

	/**
	 * 通过分页SQL获取分页对象
	 * @param pageNo
	 * @param countSQL
	 * @param splitPageSQL
	 * @return
	 */
	public Pager<Supplier> getSupplierSplitPageBySQL(int pageNo,String countSQL,String splitPageSQL){
		List<Supplier> list=this.getSqlMapClientTemplate().queryForList("supplierSqlMap.getSupplierSplitPageBySQL",splitPageSQL);
		Integer rowCount=(Integer)this.getSqlMapClientTemplate().queryForObject("supplierSqlMap.getSupplierSplitPageCountSQL", countSQL);
		Pager<Supplier> page=new Pager<Supplier>(pageNo, rowCount, list);
		return page;
	}
	/**
	 * 通过id获取供应商信息
	 * @param id
	 * @return
	 */
	public Supplier getSupplierById(String id){
		return this.getObjectByCondition(id, "supplierSqlMap.getSupplierById");
	}
	/**
	 * 通过条件进行查询
	 * @param s
	 * @return
	 */
	public List<Supplier> getSupplierByCondition(Supplier s){
		return this.getSqlMapClientTemplate().queryForList("supplierSqlMap.getSupplierByCondition",s);
	}
	
	/**
	 * 添加供应商信息
	 * @param s
	 */
	public void insertSupplier(Supplier s){
		this.insertObject(s, "supplierSqlMap.insert");
	}
	/**
	 * 更新供应商信息
	 * @param s
	 * @return
	 */
	public boolean updateSupplier(Supplier s){
		return this.updateObject(s, "supplierSqlMap.updateSupplierById")==1;
	}
	
	/**
	 * 删除供应商信息
	 * @param id
	 * @return
	 */
	public boolean deleteSupplier(String id){
		return  this.deleteObject(id, "supplierSqlMap.deleteSupplierById")==1;
	}
	/**
	 *获取供应商最大编号
	 * @return
	 */
	public String getSupplierMaxId(){
		Integer id=(Integer)this.getSqlMapClientTemplate().queryForObject("supplierSqlMap.getSupplierMaxId");
		return StringUtils.getSpecifyStringByLengthBefore((id.intValue()+1)+"", 5, "0");
	}
}
