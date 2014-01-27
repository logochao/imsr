package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.base.page.Pager;
import com.radius.invoicing.ibatis.model.Goods;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface GoodsDao {

	/**
	 * 获取商品信息
	 * @param goods
	 * @return
	 */
	public List<Goods> getGoods(Goods goods);

	/**
	 * 保存商品信息
	 * @param goods
	 */
	public void insert(Goods goods);

	/**
	 * 更新商品信息
	 * @param goods
	 * @return
	 */
	public boolean updateGoods(Goods goods);

	/**
	 * 删除商品信息
	 * @param goods
	 */
	public void deleteGoods(Goods goods);

	/**
	 * 通过分页SQL获取分页对象
	 * @param pageNo
	 * @param countSQL
	 * @param splitPageSQL
	 * @return
	 */
	public Pager<Goods> getGoodsSplitPageBySQL(int pageNo, String countSQL,
			String splitPageSQL);
	
	
	
	/**
	 * 通过条件查询
	 * @param goods
	 * @return
	 */
	public List<Goods> getGoodsByCondition(Goods goods);

}