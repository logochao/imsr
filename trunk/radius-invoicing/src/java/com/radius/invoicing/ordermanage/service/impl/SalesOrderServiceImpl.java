package com.radius.invoicing.ordermanage.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.radius.base.cache.memcache.MemcacheClient;
import com.radius.base.page.EasyuiSplitPager;
import com.radius.base.utils.Constants;
import com.radius.base.utils.JsonUtils;
import com.radius.base.utils.StringUtils;
import com.radius.invoicing.ibatis.dao.GoodsDao;
import com.radius.invoicing.ibatis.dao.SalesOrderDao;
import com.radius.invoicing.ibatis.dao.SalesOrderGoodsGrdDao;
import com.radius.invoicing.ibatis.dao.SupplierDao;
import com.radius.invoicing.ibatis.model.Goods;
import com.radius.invoicing.ibatis.model.SalesOrder;
import com.radius.invoicing.ibatis.model.SalesOrderGoodsGrd;
import com.radius.invoicing.ordermanage.compent.SalesOrderCompent;
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
	
	@Autowired(required=false)
	@Qualifier("salesOrderDaoImpl")
	private SalesOrderDao salesOrderDao;
	
	@Autowired(required=false)
	@Qualifier("salesOrderGoodsGrdDaoImpl")
	private SalesOrderGoodsGrdDao salesOrderGoodsGrdDao;
	
	@Autowired(required=false)
	@Qualifier("supplierDaoImpl")
	private SupplierDao supplierDao;
	
	@Autowired(required=false)
	@Qualifier("goodsDaoImpl")
	private GoodsDao goodsDao;
	
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
			if(goodGrd!=null){//更新map对象
				goodGrd.setAmount(grd.getAmount());
				goodGrd.setQuantityUnit(grd.getQuantityUnit());
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
			memcache=(Map<String, SalesOrderGoodsGrd>) cache;
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
	public JsonUtils saveSalesOrderInfos(String ledgerId,SalesOrder salesOrder,String salesOrderGoodsGrdMemcachedkey,String salesContractId)throws Exception{
		boolean success=false;
		String message="操作失败";
		String resultCode="0";
		//1.销售订单信息
	    //2.销售订单商品
		List<SalesOrderGoodsGrd> salesOrderGoodsGrdList=SalesOrderCompent.getSalesOrderGoodsGrdByMemcached(ledgerId, salesOrderGoodsGrdMemcachedkey, salesContractId, salesOrder.getStatus(),salesOrder.getCreater());
		
		SalesOrder temp=salesOrderDao.getSalesOrderByPk(salesOrder.getSalesOrderId());//
		if(temp==null){
			//保存销售订单
			salesOrderDao.insertSalesOrder(salesOrder);
			//保存销售订单商品列表
			salesOrderGoodsGrdDao.batchInsertSalesOrderGoodsGrd(salesOrderGoodsGrdList);
			
			success=true;
			message="添加销售订单相关信息成功!!!";
			resultCode=salesOrder.getStatus();
			logger.info(message);
		}else{
			salesOrderDao.updateSalesOrderStatusBySalesOrderId(salesOrder);
			
			SalesOrderGoodsGrd salesOrderGoodsGrd = new SalesOrderGoodsGrd();
			salesOrderGoodsGrd.setStatus(salesOrder.getStatus());
			salesOrderGoodsGrd.setOrderId(salesOrder.getSalesOrderId());
			
			salesOrderGoodsGrdDao.updateSalesOrderGoodsGrdStatusByPK(salesOrderGoodsGrd);
			
			success=true;
			message="更新销售订单相关信息成功!!!";
			logger.info(message);
			resultCode=salesOrder.getStatus();
		}
		if(success){
			MemcacheClient.delete(salesOrderGoodsGrdMemcachedkey);
		}
		//返回操作信息
		JsonUtils result = new  JsonUtils(success,message);
		result.setChild(resultCode);
		
		return result;
	}
	
	/**
	 * 根据条件查询销售订单信息
	 * @param 
	 * @return
	 * @throws Exception
	 */
	public EasyuiSplitPager<SalesOrder> getSalesOrder(Goods goods,String salesOrderId)throws Exception{
		//1.根据供应商信息获取供应商商品信息
			//1.1根据供应商编号+商品名称 获取供应商商品信息
		List<String> goodsIdList=goodsDao.getGoodsInfoBySupplierAndGoods(goods);
		String goodsIds=StringUtils.ArrayList2SQLString(goodsIdList, ",");
		//2.通过供应商商品与销售订单商品信息对比获取销售订单编号
		//3.根据销售订单编号获取销售订单信息
		EasyuiSplitPager<SalesOrder> page=new EasyuiSplitPager<SalesOrder>();
		List<SalesOrder>  list = null;
		if(org.apache.commons.lang.StringUtils.isNotBlank(goodsIds)){
			list = salesOrderDao.getSalesOrderByGoodsIds(goodsIds,salesOrderId);
			page.setRows(list);
			page.setTotal(list.size());
		}
		return page;
	}
	
	/**
	 * 通过订单商品信息查询订单商品信息详情
	 * @param salesOrderGoodsGrd
	 * @return
	 */
	public EasyuiSplitPager<SalesOrderGoodsGrd> getSalesOrderGoodsGrdByGoodsGrd(SalesOrderGoodsGrd salesOrderGoodsGrd){
		EasyuiSplitPager<SalesOrderGoodsGrd> pager=new EasyuiSplitPager<SalesOrderGoodsGrd>();
		List<SalesOrderGoodsGrd> list=salesOrderGoodsGrdDao.getSalesOrderGoodsGrd(salesOrderGoodsGrd);
		if(list!=null&&!list.isEmpty()){
			pager.setRows(list);
			pager.setTotal(list.size());
		}
		return pager;
	}
	/**
	 * 获取销售订单列表
	 * @param salesOrder
	 * @return
	 */
	public EasyuiSplitPager<SalesOrder> getSalesOrderList(SalesOrder salesOrder){
		EasyuiSplitPager<SalesOrder> pager=new EasyuiSplitPager<SalesOrder>();
		
		List<SalesOrder> list = salesOrderDao.getSalesOrder(salesOrder);
		if(list!=null&&!list.isEmpty()){
			pager.setRows(list);
			pager.setTotal(list.size());
		}
		return pager;
	}
	
	@PreDestroy
	public void destroy(){
		if(jsonUtils!=null){
			jsonUtils=null;
		}
	}
}
