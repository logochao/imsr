/**
 * 
 */
package com.radius.invoicing.ibatis.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.base.page.Pager;
import com.radius.base.utils.StringUtils;
import com.radius.invoicing.ibatis.dao.InstitutionDao;
import com.radius.invoicing.ibatis.model.Institution;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 商品信息
 */
@Repository
@SuppressWarnings("unchecked")
public class InstitutionDaoImpl extends BaseIbatisDaoImpl<Institution> implements InstitutionDao{

	/**
	 * 获取商品信息
	 * @param institution
	 * @return
	 */
	public Institution getInstitution(String institutionId){
		return this.getObjectByCondition(institutionId, "institutionSqlMap.getInstitution");
	}
	/**
	 * 保存商品信息
	 * @param institution
	 */
	public  void insert(Institution institution){
		this.insertObject(institution, "institutionSqlMap.insert");
	}
	/**
	 * 更新商品信息
	 * @param institution
	 * @return
	 */
	public boolean updateInstitution(Institution institution){
		return this.updateObject(institution, "institutionSqlMap.updateInstitution")==1;
	}
	
	/**
	 * 删除商品信息
	 * @param institution
	 */
	public void deleteInstitution(Institution institution){
		this.deleteObject(institution, "institutionSqlMap.deleteInstitution");
	}
	
	
	/**
	 * 通过分页SQL获取分页对象
	 * @param pageNo
	 * @param countSQL
	 * @param splitPageSQL
	 * @return
	 */
	public Pager<Institution> getInstitutionSplitPageBySQL(int pageNo,String countSQL,String splitPageSQL){
		List<Institution> list=this.getSqlMapClientTemplate().queryForList("institutionSqlMap.getInstitutionSplitPageBySQL",splitPageSQL);
		Integer rowCount=(Integer)this.getSqlMapClientTemplate().queryForObject("institutionSqlMap.getInstitutionSplitPageCountSQL", countSQL);
		Pager<Institution> page=new Pager<Institution>(pageNo, rowCount, list);
		return page;
	}
	
	/**
	 * 通过条件查询
	 * @param institution
	 * @return
	 */
	public List<Institution> getInstitutionByCondition(Institution institution){
		return this.getSqlMapClientTemplate().queryForList("institutionSqlMap.getInstitutionByCondition",institution);
	}
	/**
	 * 通过供应商编号与商品信息进行查询
	 * @param institution
	 * @return
	 
	public List<String> getInstitutionInfoBySupplierAndInstitution(Institution institution){
		return this.getSqlMapClientTemplate().queryForList("institutionSqlMap.getInstitutionInfoBySupplierAndInstitution", institution);
	}
	*/
	public String getInstitutionMaxId(){
		Integer id=(Integer)this.getSqlMapClientTemplate().queryForObject("institutionSqlMap.getInstitutionMaxId");
		return StringUtils.getSpecifyStringByLengthBefore((id.intValue()+1)+"", 5, "0");
	}
}
