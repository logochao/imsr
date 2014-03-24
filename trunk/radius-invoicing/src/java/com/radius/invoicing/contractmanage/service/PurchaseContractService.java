package com.radius.invoicing.contractmanage.service;

import com.radius.base.page.EasyuiSplitPager;
import com.radius.base.utils.JsonUtils;
import com.radius.invoicing.ibatis.model.ContractScanGrd;
import com.radius.invoicing.ibatis.model.Goods;
import com.radius.invoicing.ibatis.model.PurchaseContractGoodsGrd;
import com.radius.invoicing.ibatis.model.PurchaseContractPaymentGrd;
import com.radius.invoicing.ibatis.model.PurchaseOrder;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface PurchaseContractService {

	/**
	 * 通过商品信息+供应商编号、采购订单号获取采购订单信息
	 * @param goods
	 * @param purchaseOrderId
	 * @return
	 * @throws Exception
	 */
	public EasyuiSplitPager<PurchaseOrder> getPurchaseOrderInfon2Goods(
			Goods goods, String purchaseOrderId) throws Exception;

	/**
	 * 采购额合同商品信息缓存
	 * @param key
	 * @param purchaseContractGoodsGrd
	 * @return
	 * @throws Exception
	 */

	public JsonUtils addPurchaseContractGoodsGrd2Memcached(String key,
			PurchaseContractGoodsGrd purchaseContractGoodsGrd) throws Exception;

	/**
	 * 移除缓存中采购合同商品信息
	 * @param key
	 * @param delete
	 * @param contractGoodsGrd
	 * @return
	 * @throws Exception
	 */
	public JsonUtils removePurchaseContractGoodsGrd2Memcached(String key,
			boolean delete, PurchaseContractGoodsGrd contractGoodsGrd)
			throws Exception;

	/**
	 * 采购合同扫描件信息缓存
	 * @param key
	 * @param purchaseContractGoodsGrd
	 * @return
	 * @throws Exception
	 */

	public JsonUtils addPurchaseContractScanGrd2Memcached(String key,
			ContractScanGrd scan) throws Exception;

	/**
	 * 删除memcache中的合同扫描件信息对象
	 * @param key
	 * @param payment
	 * @return
	 */
	public JsonUtils removeContractScanInfo2Memcache(String key,
			ContractScanGrd scan);

	/**
	 * 采购合同扫描件信息缓存
	 * @param key
	 * @param purchaseContractGoodsGrd
	 * @return
	 * @throws Exception
	 */
	public JsonUtils addPurchaseContractPaymentGrd2Memcached(String key,
			PurchaseContractPaymentGrd grd) throws Exception;

	/**
	 * 删除memcache中的合同支付信息对象
	 * @param key
	 * @param payment
	 * @return
	 */
	public JsonUtils removePurchaseContractPaymentGrd2Memcache(String key,
			PurchaseContractPaymentGrd contractPaymentGrd);

}