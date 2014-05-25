package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.base.page.Pager;
import com.radius.invoicing.ibatis.model.SupplierGoods;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface SupplierGoodsDao {

	/**
	 * 获取供应商商品信息
	 * @param sg
	 * @return
	 */
	public List<SupplierGoods> getSupplierGoodsList(SupplierGoods sg);

	/**
	 * 保存供应商商品信息
	 * @param sg
	 */
	public void insertSupplierGoods(SupplierGoods sg);

	/**
	 * 更新供应商商品信息
	 * @param sg
	 * @return
	 */
	public boolean updateSupplierGoods(SupplierGoods sg);

	/**
	 * 删除供应商商品信息
	 * @param sg
	 */
	public void deleteSupplierGoods(SupplierGoods sg);
	
	
	/**
	 * 通过主键查询供应商商品行
	 * @param supplierId
	 * @param goodsId
	 * @return
	 */
	public Integer getSupplierGoodsCount(String supplierId,String goodsId);

}