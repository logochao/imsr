package com.radius.invoicing.ordermanage.compent;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.radius.base.cache.memcache.MemcacheClient;
import com.radius.invoicing.ibatis.model.PurchaseOrderGrd;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 采购订单组件
 */
@SuppressWarnings("unchecked")
public class PurchaseOrderCompent {

	private static Logger logger=Logger.getLogger(PurchaseOrderCompent.class);
	
	/**
	 * 获取memcached中的采购订单商品信息
	 * @param ledgerId
	 * @param cacheKey
	 * @param purchaseOrderId
	 * @param status
	 * @return
	 */
	public static List<PurchaseOrderGrd> getPurchaseOrderGoodsByMemcached(String ledgerId,String cacheKey,String purchaseOrderId,String status){
		List<PurchaseOrderGrd> goodsList=new ArrayList<PurchaseOrderGrd>();
		
		Map<String,PurchaseOrderGrd> memcache=(Map<String,PurchaseOrderGrd>)MemcacheClient.get(cacheKey); 
		PurchaseOrderGrd goods=null;
		String key=null;
		if(memcache!=null&&!memcache.isEmpty()&&memcache.size()>0){//表示缓存内容不为空
			Iterator iter = memcache.entrySet().iterator();
			while (iter.hasNext()) { 
				Map.Entry entry = (Map.Entry) iter.next();
				key = (String) entry.getKey(); 
				goods=memcache.get(key);
				logger.info("采购订单商品列表 "+key +" ---> "+goods);
				goodsList.add(goods);
			}
		}
		//释放资源
		goods = null;
		key = null;
		return goodsList;
	}
}
