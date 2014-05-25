package com.radius.invoicing.quotationmanage.compent;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.radius.base.cache.memcache.MemcacheClient;
import com.radius.invoicing.ibatis.model.SupplierQuotation;
import com.radius.invoicing.ibatis.model.SupplierQuotationGrd;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public class SupplierQuotationCompent {

private static Logger logger=Logger.getLogger(SupplierQuotationCompent.class);
	
	@SuppressWarnings("unchecked")
	public static List<SupplierQuotationGrd> getMemcachedSupplierQuotationGrd(String cacheKey,SupplierQuotation supplierQuotation){
		List<SupplierQuotationGrd> list=new ArrayList<SupplierQuotationGrd>();
		Map<String, SupplierQuotationGrd> memcached=(Map<String, SupplierQuotationGrd>)MemcacheClient.get(cacheKey);
		String key =null;
		SupplierQuotationGrd grd=null;
		if(memcached!=null&&!memcached.isEmpty()&&memcached.size()>0){//表示缓存内容不为空
			Iterator iter = memcached.entrySet().iterator();
			String ledgerId=supplierQuotation.getLedgerId();
			String creater=supplierQuotation.getCreater();
			String operator=supplierQuotation.getOperator();
			String reviser=supplierQuotation.getReviser();
			String verifier=supplierQuotation.getVerifier();
			while (iter.hasNext()) { 
				Map.Entry entry = (Map.Entry) iter.next();
				key = (String) entry.getKey(); 
				grd=memcached.get(key);
				logger.info("供应商报价商品列表 "+key +" ---> "+grd);
				grd.setLedgerId(ledgerId);
				grd.setOperator(operator);
				grd.setCreater(creater);
				grd.setReviser(reviser);
				grd.setVerifier(verifier);
				list.add(grd);
			}
		}
		//释放资源
		key = null;
		grd = null;
		return list;
	}
}
