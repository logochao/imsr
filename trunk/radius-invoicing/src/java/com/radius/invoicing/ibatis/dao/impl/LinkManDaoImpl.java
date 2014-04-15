/**
 * 
 */
package com.radius.invoicing.ibatis.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.base.page.Pager;
import com.radius.invoicing.ibatis.dao.LinkManDao;
import com.radius.invoicing.ibatis.model.LinkMan;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
@Repository
@SuppressWarnings("unchecked")
public class LinkManDaoImpl extends BaseIbatisDaoImpl<LinkMan> implements LinkManDao{

	/**
	 * 通过分页SQL获取分页对象
	 * @param pageNo
	 * @param countSQL
	 * @param splitPageSQL
	 * @return
	 */
	public Pager<LinkMan> getSupplierSplitPageBySQL(int pageNo,String countSQL,String splitPageSQL){
		List<LinkMan> list=this.getSqlMapClientTemplate().queryForList("linkManSqlMap.getLinkManSplitPageBySQL",splitPageSQL);
		Integer rowCount=(Integer)this.getSqlMapClientTemplate().queryForObject("linkManSqlMap.getLinkManSplitPageCountSQL", countSQL);
		Pager<LinkMan> page=new Pager<LinkMan>(pageNo, rowCount, list);
		return page;
	}
	/**
	 * 通过id获取供应商信息
	 * @param id
	 * @return
	 */
	public LinkMan getLinkManById(Integer id){
		return this.getObjectByCondition(id, "linkManSqlMap.getLinkManById");
	}
	/**
	 * 通过条件进行查询
	 * @param s
	 * @return
	 */
	public List<LinkMan> getLinkManByCondition(LinkMan l){
//		LinkManConditionAppend.setCondition(l);
		return this.getSqlMapClientTemplate().queryForList("linkManSqlMap.getLinkManByCondition",l);
	}
	
	/**
	 * 添加供应商信息
	 * @param s
	 */
	public void insertLinkMan(LinkMan l){
		this.insertObject(l, "linkManSqlMap.insert");
	}
	
	/**
	 * 批量保存联系人信息
	 * @param list
	 */
	public void batchInsertLinkMan(List<LinkMan> list){
		this.batchInsertListObject(list, "linkManSqlMap.insert");
	}
	
	
	/**
	 * 更新供应商信息
	 * @param s
	 * @return
	 */
	public boolean updateLinkMan(LinkMan l){
		return this.updateObject(l, "linkManSqlMap.updateLinkManById")==1;
	}
	
	/**
	 * 删除供应商信息
	 * @param id
	 * @return
	 */
	public boolean deleteLinkMan(Integer id){
		return  this.deleteObject(id, "linkManSqlMap.deleteLinkManById")==1;
	}
}
