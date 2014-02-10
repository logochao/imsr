package com.radius.invoicing.contractmanage.service;

import com.radius.base.utils.JsonUtils;
import com.radius.invoicing.ibatis.model.ContractScanGrd;
import com.radius.invoicing.ibatis.model.SalesContract;
import com.radius.invoicing.ibatis.model.SalesContractGoodsGrd;
import com.radius.invoicing.ibatis.model.SalesContractPayment;
import com.radius.invoicing.ibatis.model.SalesContractPaymentGrd;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface SalesContractService {

	/**
	 * 将对象缓存到memcache中
	 * @param key
	 * @param obj
	 */
	public void addObject2Memcache(String key, Object obj);

	/**
	 * 将memcache中的缓存对象进行删除
	 * @param key
	 * @return
	 */
	public boolean deleteObject2Memcache(String key);
	
	
	public boolean addObject2MemcacheByPayDetail(String key,SalesContractPaymentGrd payment);
	
	/**
	 * 将销售合同商品列表进行缓存 memcache 合同编号_---->Map<合同号_商品编号,支付详情>
	 * @param key
	 * @param payment
	 * @return  
	 */
	public JsonUtils addSalesContractProductInfo2Memcache(String key,SalesContractGoodsGrd goods);
	
	
	/**
	 * 删除memcache中的缓存对象
	 * @param key
	 * @param payment
	 * @return
	 */
	public JsonUtils removeObject2MemcacheByPayDetail(String key,SalesContractPaymentGrd payment);
	
	
	/**
	 * 删除memcache中的缓存对象
	 * @param key
	 * @param payment
	 * @return
	 */
	public JsonUtils removeSalesContractProductInfo2Memcache(String key,SalesContractGoodsGrd goods);
	
	
	/**
	 * 添加销售合同扫描件列表到memcache中
	 * @param key
	 * @param scan
	 * @return
	 */
	public JsonUtils addContractScanInfo2Memcache(String key,ContractScanGrd scan);
	
	
	/**
	 * 删除memcache中的缓存对象
	 * @param key
	 * @param payment
	 * @return
	 */
	public JsonUtils removeContractScanInfo2Memcache(String key,ContractScanGrd scan);
	
	
	/**
	 * 保存销售合同信息
	 * @param ledgerId
	 * @param salesContract
	 * @param goodsMemcacheKey
	 * @param paymentMemcacheKey
	 * @param scansMemecacheKey
	 * @param payment
	 * @return
	 */
	public JsonUtils saveSalesContractInfos(String ledgerId,SalesContract salesContract,String goodsMemcacheKey,String paymentMemcacheKey,String scansMemecacheKey,SalesContractPayment payment)throws Exception;

}