package com.radius.invoicing.ordermanage.service;

import com.radius.base.utils.JsonUtils;
import com.radius.invoicing.ibatis.model.PurchaseOrder;
import com.radius.invoicing.ibatis.model.PurchaseOrderGrd;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface PurchaseOrderService {

	/**
	 * 将采购订单商品添加到缓存中
	 * @param key
	 * @param purchaseOrderGrd
	 * @return
	 */
	public JsonUtils addPurchaseOrderGoodsGrd2Memcached(String key,
			PurchaseOrderGrd purchaseOrderGrd);

	/**
	 * 保存采购订单及采购订单商品信息
	 * @param purchaseOrderGrdMemcachedKey
	 * @param purchaseOrder
	 * @return
	 * @throws Exception
	 */
	public JsonUtils savePurchaseOrderInfo(String purchaseOrderGrdMemcachedKey,
			PurchaseOrder purchaseOrder) throws Exception;
	
	
	/**
	 * 移除采购订单商品信息
	 * @param key
	 * @param purchaseOrderGrd
	 * @param delete
	 * @return
	 */
	public JsonUtils removePurchaseOrderGoodsGrd2Memcached(String key,PurchaseOrderGrd purchaseOrderGrd,boolean delete);

}