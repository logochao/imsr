package com.radius.invoicing.inquirymanage.compent;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.radius.base.cache.memcache.MemcacheClient;
import com.radius.invoicing.enums.GoodsInquiryTypeEnums;
import com.radius.invoicing.ibatis.model.SalesInquiry;
import com.radius.invoicing.ibatis.model.SalesInquiryGrd;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public class SalesInquiryCompent {

	private static Logger logger=Logger.getLogger(SalesInquiryCompent.class);
	
	public static List<SalesInquiryGrd> getMemcachedSalesInquiryGrd(String cacheKey,SalesInquiry salesInquiry,String inquiryType){
		List<SalesInquiryGrd> list=new ArrayList<SalesInquiryGrd>();
		Map<String, SalesInquiryGrd> memcached=(Map<String, SalesInquiryGrd>)MemcacheClient.get(cacheKey);
		String key =null;
		SalesInquiryGrd grd=null;
		if(memcached!=null&&!memcached.isEmpty()&&memcached.size()>0){//表示缓存内容不为空
			Iterator iter = memcached.entrySet().iterator();
			String status=salesInquiry.getStatus();
			String ledgerId=salesInquiry.getLedgerId();
			String creater=salesInquiry.getCreater();
			String operator=salesInquiry.getOperator();
			String reviser=salesInquiry.getReviser();
			String verifier=salesInquiry.getVerifier();
			while (iter.hasNext()) { 
				Map.Entry entry = (Map.Entry) iter.next();
				key = (String) entry.getKey(); 
				grd=memcached.get(key);
				logger.info("采购合同商品列表 "+key +" ---> "+grd);
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
