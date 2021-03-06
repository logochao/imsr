/**
 * 
 */
package com.radius.invoicing.ibatis.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.invoicing.ibatis.dao.SupplierGoodsDao;
import com.radius.invoicing.ibatis.model.SupplierGoods;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 供应商商品信息
 */
@Repository
@SuppressWarnings("unchecked")
public class SupplierGoodsDaoImpl extends BaseIbatisDaoImpl<SupplierGoods> implements SupplierGoodsDao{

	/**
	 * 获取供应商商品信息
	 * @param sg
	 * @return
	 */
	public List<SupplierGoods> getSupplierGoodsList(SupplierGoods sg){
		return this.getListObject(sg, "supplierGoodsSqlMap.getSupplierGoodsByCondition");
	}
	
	/**
	 * 保存供应商商品信息
	 * @param sg
	 */
	public void insertSupplierGoods(SupplierGoods sg){
		this.insertObject(sg, "supplierGoodsSqlMap.insert");
	}
	
	/**
	 * 更新供应商商品信息
	 * @param sg
	 * @return
	 */
	public boolean updateSupplierGoods(SupplierGoods sg){
		return this.updateObject(sg, "supplierGoodsSqlMap.updateSupplierGoods")==1;
	}
	
	/**
	 * 删除供应商商品信息
	 * @param sg
	 */
	public void deleteSupplierGoods(SupplierGoods sg){
		this.deleteObject(sg, "supplierGoodsSqlMap.deleteSupplierGoods");
	}
	
	/**
	 * 通过主键查询供应商商品行
	 * @param supplierId
	 * @param goodsId
	 * @return
	 */
	public Integer getSupplierGoodsCount(String supplierId,String goodsId){
		Map<String, String> params=new HashMap<String, String>();
		params.put("supplierId", supplierId);
		params.put("goodsId", goodsId);
		return this.getCountByCondition(params, "supplierGoodsSqlMap.getSupplierGoodsCount");
	}
}
