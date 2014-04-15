package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.base.page.Pager;
import com.radius.invoicing.ibatis.model.LinkMan;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface LinkManDao {

	/**
	 * 通过分页SQL获取分页对象
	 * @param pageNo
	 * @param countSQL
	 * @param splitPageSQL
	 * @return
	 */
	public Pager<LinkMan> getSupplierSplitPageBySQL(int pageNo,
			String countSQL, String splitPageSQL);

	/**
	 * 通过id获取供应商信息
	 * @param id
	 * @return
	 */
	public LinkMan getLinkManById(Integer id);

	/**
	 * 通过条件进行查询
	 * @param s
	 * @return
	 */
	public List<LinkMan> getLinkManByCondition(LinkMan l);

	/**
	 * 添加供应商信息
	 * @param s
	 */
	public void insertLinkMan(LinkMan l);

	
	/**
	 * 批量保存联系人信息
	 * @param list
	 */
	public void batchInsertLinkMan(List<LinkMan> list);
	/**
	 * 更新供应商信息
	 * @param s
	 * @return
	 */
	public boolean updateLinkMan(LinkMan l);

	/**
	 * 删除供应商信息
	 * @param id
	 * @return
	 */
	public boolean deleteLinkMan(Integer id);

}