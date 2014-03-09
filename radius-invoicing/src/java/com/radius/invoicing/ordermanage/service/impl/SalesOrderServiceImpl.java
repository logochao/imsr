package com.radius.invoicing.ordermanage.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.radius.base.cache.memcache.MemcacheClient;
import com.radius.base.utils.Constants;
import com.radius.base.utils.JsonUtils;
import com.radius.invoicing.ibatis.model.SalesOrderGoodsGrd;
import com.radius.invoicing.ordermanage.service.SalesOrderService;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 销售订单service
 */
@Service
@SuppressWarnings("unchecked")
public class SalesOrderServiceImpl implements Constants, SalesOrderService{

	private Logger logger=Logger.getLogger(this.getClass());
	
	private JsonUtils jsonUtils=null;
	
	@PostConstruct
	public void init(){
		if(jsonUtils==null){
			jsonUtils=new JsonUtils();
		}
	}
	
	/**
	 * 将销售订单商品添加到memcached中
	 * @param key
	 * @param grd
	 * @return
	 */
	public JsonUtils addSalesOrderGoodsGrd2Memcached(String key,SalesOrderGoodsGrd grd){
		Map<String,SalesOrderGoodsGrd> memcache=null;
		Object cache=MemcacheClient.get(key);
		String mapKey=grd.getOrderId()+"_"+grd.getGoodsId();//销售订单号_商品编号
		if(cache!=null){
			memcache=(Map<String,SalesOrderGoodsGrd>)cache;
			SalesOrderGoodsGrd goodGrd=memcache.get(mapKey);
			if(grd!=null){//更新map对象
				goodGrd.setAmount(grd.getAmount());
				goodGrd.setQuantity(grd.getQuantity());
				logger.error("key "+key+",已经将其缓存在对象中 "+cache);
				grd=goodGrd;
			}
		}else{
			memcache = new HashMap<String, SalesOrderGoodsGrd>();
		}
		memcache.put(mapKey, grd);
		MemcacheClient.set(key, memcache, CACHE_ONE_HOURE_TIME);//将带缓存的对象进行写入
		return new JsonUtils (true,"将销售订单商品缓存到内存中成功....");
	}
	
	/**
	 * 移除销售订单商品从memcached中
	 * @param key
	 * @param isDelete true表示删除整个对象
	 * @param grd
	 * @return
	 */
	public JsonUtils removeSalesOrderGoodsGrd2Memcached(String key,boolean isDelete,SalesOrderGoodsGrd grd){
		String memo=grd.getMemo();//该字段存放带删除的主键信息
		Map<String,SalesOrderGoodsGrd> memcache=null;
		
		//默认
		jsonUtils.setSuccess(false);
		jsonUtils.setMessage("不存在对应的缓存对象");
		if(isDelete){//全部删除
			MemcacheClient.delete(key);
			jsonUtils.setSuccess(true);
			jsonUtils.setMessage("删除缓存对象成功...");
			return jsonUtils;
		}
		Object cache=MemcacheClient.get(key);
		if(cache!=null){
			String mapKey=null;
			if(memo.contains(",")){
				for(String goodsId:memo.split(",")){
					mapKey=grd.getOrderId()+"_"+goodsId;//销售订单号_商品编号
					memcache.remove(mapKey);//将key对应的对象进行删除
				}
			}else{
				mapKey=grd.getOrderId()+"_"+memo;//销售订单号_商品编号
				memcache.remove(mapKey);//将key对应的对象进行删除
			}
			jsonUtils.setSuccess(true);
			jsonUtils.setMessage("删除缓存对象成功...");
		}
		MemcacheClient.set(key, memcache, CACHE_ONE_HOURE_TIME);//将带缓存的对象进行写入
		return jsonUtils;
	}
	
	/**
	 * 保存销售订单信息
	 * @param objects
	 * @return
	 * @throws Exception
	 */
	public JsonUtils saveSalesOrderInfos(Object...objects)throws Exception{
		//1
		
		return null;
	}
	
	@PreDestroy
	public void destroy(){
		if(jsonUtils!=null){
			jsonUtils=null;
		}
	}
}
