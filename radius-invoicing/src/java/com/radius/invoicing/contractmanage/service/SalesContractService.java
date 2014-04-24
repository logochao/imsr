package com.radius.invoicing.contractmanage.service;

import java.util.List;

import com.radius.base.page.EasyuiSplitPager;
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
	public JsonUtils removeObject2MemcacheByPayDetail(String key,SalesContractPaymentGrd payment,boolean delete);
	
	
	/**
	 * 删除memcache中的缓存对象
	 * @param key
	 * @param payment
	 * @return
	 */
	public JsonUtils removeSalesContractProductInfo2Memcache(String key,SalesContractGoodsGrd goods);
	/**
	 * 删除memcache中的缓存对象
	 * @param key
	 * @param payment
	 * @param delete
	 * @return
	 */
	public JsonUtils removeSalesContractProductInfo2Memcache(String key,SalesContractGoodsGrd goods,boolean delete);
	
	
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
	 * 删除memcache中的缓存对象
	 * @param key
	 * @param payment
	 * @return
	 */
	public JsonUtils removeContractScanInfo2Memcache(String key,ContractScanGrd scan,boolean delete);
	
	
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
	/**
	 * 保存销售合同信息
	 * @param ledgerId
	 * @param salesContract
	 * @param goodsMemcacheKey
	 * @param paymentMemcacheKey
	 * @param scansMemecacheKey
	 * @param payment
	 * @param guaranteePaymentList 保函条款
	 * @return
	 */
	public JsonUtils saveSalesContractInfos(String ledgerId,SalesContract salesContract,String goodsMemcacheKey,String paymentMemcacheKey,String scansMemecacheKey,SalesContractPayment payment,List<SalesContractPaymentGrd> guaranteePaymentList)throws Exception;

	
	/**
	 * 通过客户编号获取销售合同信息
	 * @param salesContract
	 * @return
	 */
	public EasyuiSplitPager<SalesContract> getSalesContractByCustomerId(SalesContract salesContract);
	
	/**
	 * 通过SalesContractGoodsGrd 条件进行查询 获取销售商品列表
	 * @param salesContractGoodsGrd
	 * @return
	 */
	public EasyuiSplitPager<SalesContractGoodsGrd> getSalesContractGoodsGrd(SalesContractGoodsGrd salesContractGoodsGrd);
	
	/**
	 * 根据条件查询销售合同信息列表
	 * @param salesContract
	 * @return
	 */
	public EasyuiSplitPager<SalesContract> getSalesContractInfoList(SalesContract salesContract);
	

	/**
	 * 获取销售支付信息
	 * @param salesContractPayment
	 * @return
	 */
	public EasyuiSplitPager<SalesContractPayment> getSalesContractPayment(SalesContractPayment salesContractPayment);
	
	/**
	 * 获取销售合同支付明细
	 * @param salesContractPaymentGrd
	 * @return
	 */
	public  EasyuiSplitPager<SalesContractPaymentGrd> getSalesContractPaymentGrd(SalesContractPaymentGrd salesContractPaymentGrd);

	/**
	 * 获取销售合同扫描件
	 * @param contractScanGrd
	 * @return
	 */
	public EasyuiSplitPager<ContractScanGrd> getContractScanGrd(ContractScanGrd contractScanGrd);
}