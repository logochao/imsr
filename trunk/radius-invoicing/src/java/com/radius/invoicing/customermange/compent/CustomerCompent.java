package com.radius.invoicing.customermange.compent;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.radius.base.cache.memcache.MemcacheClient;
import com.radius.invoicing.enums.SexEnums;
import com.radius.invoicing.ibatis.model.Customer;
import com.radius.invoicing.ibatis.model.LinkMan;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 客户信息处理组件
 */
public class CustomerCompent {

	private static Logger logger =Logger.getLogger(CustomerCompent.class);
	
	@SuppressWarnings("unchecked")
	public static List<LinkMan> getCustomerLinkManList(String cacheKey,Customer customer){
		List<LinkMan> list =new ArrayList<LinkMan>();
		Map<String, LinkMan> memcache=(Map<String, LinkMan>)MemcacheClient.get(cacheKey);
		String key =null;
		LinkMan man =null;
		if(memcache!=null&&!memcache.isEmpty()&&memcache.size()>0){//表示缓存内容不为空
			Iterator iter = memcache.entrySet().iterator();
			while (iter.hasNext()) { 
				Map.Entry entry = (Map.Entry) iter.next();
				key = (String) entry.getKey(); 
				man=memcache.get(key);
				logger.info("客户信息联系人列表 "+key +" ---> "+man);
				//设置状态
				man.setCompanyId(customer.getId());
				man.setCompanyName(customer.getName());
				man.setCustomerIllustrate(customer.getCustomerIllustrate());
				man.setCustomerProperty(customer.getCustomerProperty());
				man.setSex(SexEnums.getSexEnumsById(man.getSex2()));
				man.setLedgerId(customer.getLedgerId());
				man.setCreater(customer.getCreater());
				list.add(man);
			}
		}
		key=null;
		man =null;
		return list;
	}
}
