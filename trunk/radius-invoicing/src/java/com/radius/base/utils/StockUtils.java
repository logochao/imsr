package com.radius.base.utils;

import java.util.Date;

import com.radius.base.cache.memcache.MemcacheClient;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 系统工具类型
 */
public class StockUtils implements Constants {
	
	private static int SALES_CONTRACT_SERI_NUM=1;//销售合同编号初始化
	private static int PURCHASE_CONTRACT_SERI_NUM=1;//销售合同编号初始化
	private static int SALES_ORDER_SERI_NUM=1;//销售订单编号初始化
	
	/**
	 * 获取销售合同编号 H_X+yyyymmdd+01  
	 * @return
	 */
	public static String  getSalesContractId(){
		StringBuffer bf=new  StringBuffer();
		bf.append(SALES_CONTRACT_PREFIX);
		bf.append(DateConvertUtils.format(new Date(), DATE_FORMAT_YEAR_MONTH_DAY));
		
		Integer cache=(Integer)MemcacheClient.get(bf.toString());//H_X20140205(01)括号内的表示系列化的值
		if(cache!=null){
			SALES_CONTRACT_SERI_NUM=cache.intValue();//当缓存中存在则将其获取
			SALES_CONTRACT_SERI_NUM++;//将其+1
		}
		//并将新值缓存到内存中
		MemcacheClient.set(bf.toString(), new Integer(SALES_CONTRACT_SERI_NUM), CACHE_ONE_DAY_TIME);//将其缓存一天
		//生成对象的销售合同编号
		
		bf.append(StringUtils.getSpecifyStringByLengthBefore(SALES_CONTRACT_SERI_NUM+"", 2, "0"));//将其转换为2位字符 不够长度将其前面补0
		
		return bf.toString();
	}
	/**
	 * 获取采购合同编号 H_C+yyyymmdd+01  
	 * @return
	 */
	public static String  getPurchaseContractId(){
		StringBuffer bf=new  StringBuffer();
		bf.append(PURCHASE_CONTRACT_PREFIX);
		bf.append(DateConvertUtils.format(new Date(), DATE_FORMAT_YEAR_MONTH_DAY));
		
		Integer cache=(Integer)MemcacheClient.get(bf.toString());//H_X20140205(01)括号内的表示系列化的值
		if(cache!=null){
			PURCHASE_CONTRACT_SERI_NUM=cache.intValue();//当缓存中存在则将其获取
			PURCHASE_CONTRACT_SERI_NUM++;//将其+1
		}
		//并将新值缓存到内存中
		MemcacheClient.set(bf.toString(), new Integer(PURCHASE_CONTRACT_SERI_NUM), CACHE_ONE_DAY_TIME);//将其缓存一天
		//生成对象的销售合同编号
		
		bf.append(StringUtils.getSpecifyStringByLengthBefore(PURCHASE_CONTRACT_SERI_NUM+"", 2, "0"));//将其转换为2位字符 不够长度将其前面补0
		
		return bf.toString();
	}
	
	public static String getSalesOrderId(){
		
		StringBuffer bf=new  StringBuffer();
		bf.append(SALES_ORDER_PREFIX);
		bf.append(DateConvertUtils.format(new Date(), DATE_FORMAT_YEAR_MONTH_DAY));
		
		Integer cache=(Integer)MemcacheClient.get(bf.toString());//H_X20140205(01)括号内的表示系列化的值
		if(cache!=null){
			SALES_ORDER_SERI_NUM=cache.intValue();//当缓存中存在则将其获取
			SALES_ORDER_SERI_NUM++;//将其+1
		}
		//并将新值缓存到内存中
		MemcacheClient.set(bf.toString(), new Integer(SALES_ORDER_SERI_NUM), CACHE_ONE_DAY_TIME);//将其缓存一天
		//生成对象的销售合同编号
		
		bf.append(StringUtils.getSpecifyStringByLengthBefore(SALES_ORDER_SERI_NUM+"", 2, "0"));//将其转换为2位字符 不够长度将其前面补0
		
		return bf.toString();
	}
	
}