package com.radius.invoicing.ibatis.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.invoicing.ibatis.dao.SalesOrderGoodsGrdDao;
import com.radius.invoicing.ibatis.model.SalesOrderGoodsGrd;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
@Repository
public class SalesOrderGoodsGrdDaoImpl extends BaseIbatisDaoImpl<SalesOrderGoodsGrd> implements SalesOrderGoodsGrdDao {

	private final String SQLMAPNAMESPACE="salesOrderGoodsGrdSqlMap.";
	
	/**
	 * 更加主键获取销售订单商品列表
	 * @param orderId
	 * @param goodsId
	 * @return
	 */
	public SalesOrderGoodsGrd getSalesOrderGoodsGrdByPk(String orderId,String goodsId){
		Map<String,String> params=new HashMap<String, String>();
		params.put("orderId",orderId);
		params.put("goodsId",goodsId);
		List<SalesOrderGoodsGrd> list= this.getListObject(params, SQLMAPNAMESPACE+"getSalesOrderGoodsGrdByPk");
		if(list==null||list.isEmpty()||list.size()==0){
			return null;
		}else{
			return list.get(0);
		}
	}
	/**
	 * 根据条件获取销售订单商品列表
	 * @param salesOrderGoodsGrd
	 * @return
	 */
	public List<SalesOrderGoodsGrd> getSalesOrderGoodsGrd (SalesOrderGoodsGrd salesOrderGoodsGrd){
		return this.getListObject(salesOrderGoodsGrd, SQLMAPNAMESPACE+"getSalesOrderGoodsGrd");
	}
	/**
	 * 保存销售订单商品信息列表
	 * @param salesOrderGoodsGrd
	 */
	public void insertSalesOrderGoodsGrd (SalesOrderGoodsGrd salesOrderGoodsGrd){
		this.insertObject(salesOrderGoodsGrd, SQLMAPNAMESPACE+"insert");
	}
	
	/**
	 * 批量添加销售订单商品信息列表
	 * @param list
	 */
	public void batchInsertSalesOrderGoodsGrd(List<SalesOrderGoodsGrd> list){
		this.batchInsertListObject(list,SQLMAPNAMESPACE+"insert");
	}
	
	/**
	 * 更新销售订单商品列表通过主键
	 * @param salesOrderGoodsGrd
	 */
	public boolean updateSalesOrderGoodsGrdByPK(SalesOrderGoodsGrd salesOrderGoodsGrd){
		return this.updateObject(salesOrderGoodsGrd, SQLMAPNAMESPACE+"updateSalesOrderGoodsGrdByPK")==1;
	}
	
	/**
	 * 根据条件删除相关信息
	 * @param salesOrderGoodsGrd
	 * @return
	 */
	public boolean deleteSalesOrderGoodsGrd(SalesOrderGoodsGrd salesOrderGoodsGrd){
		return this.deleteObject(salesOrderGoodsGrd, SQLMAPNAMESPACE+"deleteSalesOrderGoodsGrd")==1;
	}
	
	/**
	 * 根据主键删除销售订单商品信息
	 * @param orderId
	 * @param goodsId
	 * @return
	 */
	public boolean deleteSalesOrderGoodsGrdByPK(String orderId,String goodsId){
		Map<String,String> params=new HashMap<String, String>();
		params.put("orderId",orderId);
		params.put("goodsId",goodsId);
		return this.getSqlMapClientTemplate().delete(SQLMAPNAMESPACE+"deleteSalesOrderGoodsGrdByPK", params)==1;
	}
	/**
	 * 通过主键更新销售订单的状态
	 * @param salesOrderGoodsGrd
	 * @return
	 */
	public boolean updateSalesOrderGoodsGrdStatusByPK(SalesOrderGoodsGrd salesOrderGoodsGrd){
		return this.updateObject(salesOrderGoodsGrd, SQLMAPNAMESPACE+"updateSalesOrderGoodsGrdStatusByPK")==1;
	}
}
