package com.radius.invoicing.inquirymanage.compent;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.radius.base.cache.memcache.MemcacheClient;
import com.radius.invoicing.enums.GoodsInquiryTypeEnums;
import com.radius.invoicing.ibatis.model.PurchaseInquiry;
import com.radius.invoicing.ibatis.model.PurchaseInquiryGrd;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public class PurchaseInquiryCompent {

	private static Logger logger=Logger.getLogger(PurchaseInquiryCompent.class);
	
	@SuppressWarnings("unchecked")
	public static List<PurchaseInquiryGrd> getMemcachedPurchaseInquiryGrd(String cacheKey,PurchaseInquiry purchaseInquiry,String inquiryType){
		List<PurchaseInquiryGrd> list=new ArrayList<PurchaseInquiryGrd>();
		Map<String, PurchaseInquiryGrd> memcached=(Map<String, PurchaseInquiryGrd>)MemcacheClient.get(cacheKey);
		String key =null;
		PurchaseInquiryGrd grd=null;
		if(memcached!=null&&!memcached.isEmpty()&&memcached.size()>0){//表示缓存内容不为空
			Iterator iter = memcached.entrySet().iterator();
			String status=purchaseInquiry.getStatus()+"";
			String ledgerId=purchaseInquiry.getLedgerId();
			String creater=purchaseInquiry.getCreater();
			String operator=purchaseInquiry.getOperator();
			String reviser=purchaseInquiry.getReviser();
			String verifier=purchaseInquiry.getVerifier();
			while (iter.hasNext()) { 
				Map.Entry entry = (Map.Entry) iter.next();
				key = (String) entry.getKey(); 
				grd=memcached.get(key);
				logger.info("采购询价商品列表 "+key +" ---> "+grd);
				//设置状态 默认为询价中
				if(StringUtils.isBlank(inquiryType)){//默认为空
					grd.setStatus(GoodsInquiryTypeEnums.INQUIRYING.getId());
				}else{
					grd.setStatus(status);
				}
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
