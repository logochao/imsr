package com.radius.invoicing.ordermanage.service;

import com.radius.base.utils.JsonUtils;
import com.radius.invoicing.ibatis.model.SalesOrder;
import com.radius.invoicing.ibatis.model.SalesOrderGoodsGrd;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface SalesOrderService {

	/**
	 * 将销售订单商品添加到memcached中
	 * @param key
	 * @param grd
	 * @return
	 */
	public JsonUtils addSalesOrderGoodsGrd2Memcached(String key,
			SalesOrderGoodsGrd grd);

	/**
	 * 移除销售订单商品从memcached中
	 * @param key
	 * @param isDelete true表示全部删除
	 * @param grd
	 * @return
	 */
	public JsonUtils removeSalesOrderGoodsGrd2Memcached(String key,boolean isDelete,
			SalesOrderGoodsGrd grd);

	/**
	 * 保存销售订单信息
	 * @param objects
	 * @return
	 * @throws Exception
	 */
	public JsonUtils saveSalesOrderInfos(String ledgerId,SalesOrder salesOrder,String salesOrderGoodsGrdMemcachedkey,String salesContractId)throws Exception;

}