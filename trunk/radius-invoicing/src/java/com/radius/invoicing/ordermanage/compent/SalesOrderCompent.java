package com.radius.invoicing.ordermanage.compent;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.radius.base.cache.memcache.MemcacheClient;
import com.radius.invoicing.ibatis.model.SalesOrderGoodsGrd;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 销售订单组件
 */
@SuppressWarnings("unchecked")
public class SalesOrderCompent {

	private static Logger logger = Logger.getLogger(SalesOrderCompent.class);
	
	/**
	 * 通过缓存获取销售订单列表
	 * @param ledgerId
	 * @param cacheKey
	 * @param salesContractId  销售合同编号
	 * @param status
	 * @param operatorId 
	 * @return
	 */
	public static List<SalesOrderGoodsGrd> getSalesOrderGoodsGrdByMemcached(String ledgerId,String cacheKey,String salesContractId,String status,String operatorId){
		List<SalesOrderGoodsGrd> salesOrderGoodsList = new ArrayList<SalesOrderGoodsGrd>();
		Map<String, SalesOrderGoodsGrd> memcache= (Map<String, SalesOrderGoodsGrd>)MemcacheClient.get(cacheKey); 
		SalesOrderGoodsGrd goods=null;
		String key=null;
		if(memcache!=null&&!memcache.isEmpty()&&memcache.size()>0){//表示缓存内容不为空
			Iterator iter = memcache.entrySet().iterator();
			while (iter.hasNext()) { 
				Map.Entry entry = (Map.Entry) iter.next();
				key = (String) entry.getKey(); 
				goods=memcache.get(key);
				goods.setLedgerId(ledgerId);
				goods.setCreater(operatorId);
				logger.info("销售订单商品列表 "+key +" ---> "+goods);
				salesOrderGoodsList.add(goods);
			}
		}
		//释放资源
		goods = null;
		key = null;
		
		return salesOrderGoodsList;
	}
}
