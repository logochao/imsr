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
import com.radius.base.utils.Constants;
import com.radius.base.utils.JsonUtils;
import com.radius.invoicing.ibatis.dao.PurchaseOrderDao;
import com.radius.invoicing.ibatis.dao.PurchaseOrderGrdDao;
import com.radius.invoicing.ibatis.model.PurchaseOrder;
import com.radius.invoicing.ibatis.model.PurchaseOrderGrd;
import com.radius.invoicing.ordermanage.compent.PurchaseOrderCompent;
import com.radius.invoicing.ordermanage.service.PurchaseOrderService;

@Service
@SuppressWarnings("unchecked")
public class PurchaseOrderServiceImpl implements Constants, PurchaseOrderService {

	
	private Logger logger=Logger.getLogger(this.getClass());
	
	private JsonUtils jsonUtils=null;
	
	@Autowired(required=false)
	@Qualifier("purchaseOrderDaoImpl")
	private PurchaseOrderDao purchaseOrderDao;
	
	@Autowired(required=false)
	@Qualifier("purchaseOrderGrdDaoImpl")
	private PurchaseOrderGrdDao purchaseOrderGrdDao;
	
	

	@PostConstruct
	public void init(){
		if(jsonUtils==null){
			jsonUtils=new JsonUtils();
		}
	}
	
	
	/**
	 * 将采购订单商品添加到缓存中
	 * @param key
	 * @param purchaseOrderGrd
	 * @return
	 */
	public JsonUtils addPurchaseOrderGoodsGrd2Memcached(String key,PurchaseOrderGrd purchaseOrderGrd){
		Map<String, PurchaseOrderGrd> memcache=null;
		Object cache=MemcacheClient.get(key);
		String mapKey=purchaseOrderGrd.getPurchaseOrderId()+"_"+purchaseOrderGrd.getGoodsId();//采购订单号_商品编号
		if(cache!=null){
			memcache=(Map<String,PurchaseOrderGrd>)cache;
			PurchaseOrderGrd grd = memcache.get(mapKey);
			if(grd!=null){//更新map对象
				grd.setAmount(purchaseOrderGrd.getAmount());
				grd.setQuantity(purchaseOrderGrd.getQuantity());
				logger.error("key "+key+",已经将其缓存在对象中 "+cache);
				purchaseOrderGrd=grd;
			}
		}else{
			memcache = new HashMap<String,PurchaseOrderGrd>();
		}
		memcache.put(mapKey, purchaseOrderGrd);
		MemcacheClient.set(key, memcache, CACHE_ONE_HOURE_TIME);//将带缓存的对象进行写入
		return new JsonUtils (true,"将采购订单商品缓存到内存中成功....");
	}
	
	/**
	 * 保存采购订单及采购订单商品信息
	 * @param purchaseOrderGrdMemcachedKey
	 * @param purchaseOrder
	 * @return
	 * @throws Exception
	 */
	public JsonUtils savePurchaseOrderInfo(String purchaseOrderGrdMemcachedKey,PurchaseOrder purchaseOrder)throws Exception{
		boolean success=false;
		String message="操作失败";
		String resultCode="0";
		String status=purchaseOrder.getStats();
		String purchaseOrderId = purchaseOrder.getPurchaseOrderId();
		List<PurchaseOrderGrd> purchaseOrderGrdList = PurchaseOrderCompent.getPurchaseOrderGoodsByMemcached(purchaseOrder.getLedgerId(), purchaseOrderGrdMemcachedKey,purchaseOrderId, purchaseOrder.getOperator(), status);
		
		PurchaseOrder temp = purchaseOrderDao.getPurchaseOrderById(purchaseOrderId);
		if(temp==null){
			purchaseOrderDao.insertPurchaseOrder(purchaseOrder);
			purchaseOrderGrdDao.batchInsertPurchaseOrderGrd(purchaseOrderGrdList);
			success=true;
			message="添加采购订单相关信息成功!!!";
			resultCode="1";
			logger.info(message);
		}else{
			//更新采购订单状态
			purchaseOrderDao.updatePurchaseOrderStatusByPurchaseOrderId(purchaseOrder);
			//更新采购订单商品状态(暂时没有对应的字段)
			success=true;
			message="更新销售订单相关信息成功!!!";
			logger.info(message);
			resultCode="0";
		}
		if(success){
			MemcacheClient.delete(purchaseOrderGrdMemcachedKey);
		}
		jsonUtils.setSuccess(success);
		jsonUtils.setMessage(message);
		jsonUtils.setChild(resultCode);
		return jsonUtils;
	}
	
	
	@PreDestroy
	public void destroy(){
		if(jsonUtils!=null){
			jsonUtils=null;
		}
	}
}
