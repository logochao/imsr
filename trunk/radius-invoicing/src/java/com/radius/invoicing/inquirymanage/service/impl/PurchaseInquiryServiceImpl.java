package com.radius.invoicing.inquirymanage.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.radius.base.cache.memcache.MemcacheClient;
import com.radius.base.page.EasyuiSplitPager;
import com.radius.base.utils.Constants;
import com.radius.base.utils.JsonUtils;
import com.radius.invoicing.ibatis.dao.PurchaseInquiryDao;
import com.radius.invoicing.ibatis.dao.PurchaseInquiryGrdDao;
import com.radius.invoicing.ibatis.model.PurchaseInquiry;
import com.radius.invoicing.ibatis.model.PurchaseInquiryGrd;
import com.radius.invoicing.inquirymanage.compent.PurchaseInquiryCompent;
import com.radius.invoicing.inquirymanage.service.PurchaseInquiryService;


@Service
@SuppressWarnings("unchecked")
public class PurchaseInquiryServiceImpl implements Constants, PurchaseInquiryService{

	private Logger logger =Logger.getLogger(this.getClass());
	
	@Autowired(required=false)
	@Qualifier("purchaseInquiryDaoImpl")
	private PurchaseInquiryDao purchaseInquiryDao;
	
	@Autowired(required=false)
	@Qualifier("purchaseInquiryGrdDaoImpl")
	private PurchaseInquiryGrdDao purchaseInquiryGrdDao;
	
	public JsonUtils  addPurchaseInquiryGrd2Memecached(String key,PurchaseInquiryGrd grd){
		Map<String,PurchaseInquiryGrd> memcache=null;
		Object cache=MemcacheClient.get(key);
		String mapKey=grd.getPurchaseInquiryId()+"_"+grd.getGoodsId();//采购询价单号_商品编号
		if(cache!=null){
			memcache=(Map<String,PurchaseInquiryGrd>)cache;
			PurchaseInquiryGrd goodGrd=memcache.get(mapKey);
			if(goodGrd!=null){//更新map对象
				goodGrd.setQuantityUnit(grd.getQuantityUnit());
				logger.error("key "+key+",已经将其缓存在对象中 "+cache);
				grd=goodGrd;
			}
		}else{
			memcache = new HashMap<String, PurchaseInquiryGrd>();
		}
		memcache.put(mapKey, grd);
		MemcacheClient.set(key, memcache, CACHE_ONE_HOURE_TIME);//将带缓存的对象进行写入
		return new JsonUtils (true,"将采购询价商品缓存到内存中成功....");
	}
	
	
	/**
	 * 移除采购订单商品从memcached中
	 * @param key
	 * @param isDelete true表示删除整个对象
	 * @param grd
	 * @return
	 */
	public JsonUtils removePurchaseInquiryGrd2Memcached(String key,boolean isDelete,PurchaseInquiryGrd grd){
		String memo=grd.getMemo();//该字段存放带删除的主键信息
		Map<String,PurchaseInquiryGrd> memcache=null;
		JsonUtils jsonUtils =new JsonUtils();
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
			memcache=(Map<String, PurchaseInquiryGrd>) cache;
			String mapKey=null;
			if(memo.contains(",")){
				for(String goodsId:memo.split(",")){
					mapKey=grd.getPurchaseInquiryId()+"_"+goodsId;//采购询价号_商品编号
					memcache.remove(mapKey);//将key对应的对象进行删除
				}
			}else{
				mapKey=grd.getPurchaseInquiryId()+"_"+memo;//销售询价号_商品编号
				memcache.remove(mapKey);//将key对应的对象进行删除
			}
			jsonUtils.setSuccess(true);
			jsonUtils.setMessage("删除采购询价商品缓存对象成功...");
		}
		MemcacheClient.set(key, memcache, CACHE_ONE_HOURE_TIME);//将带缓存的对象进行写入
		return jsonUtils;
	}
	
	
	/**
	 * 
	 * @param inquiry
	 * @param salesInquiryGrdkey
	 * @param inqueryStatus 询价商品状态
	 * @return
	 */
	public JsonUtils savePurchaseInquiryInfo(PurchaseInquiry purchaseInquiry,String purchaseInquiryGrdkey,String inqueryStatus){
		JsonUtils result = null;
		String status = purchaseInquiry.getStatus()+"";
		List<PurchaseInquiryGrd> list=PurchaseInquiryCompent.getMemcachedPurchaseInquiryGrd(purchaseInquiryGrdkey, purchaseInquiry, inqueryStatus);
		PurchaseInquiry inquiryTemp= purchaseInquiryDao.getPurchaseInquiryById(purchaseInquiry.getPurchaseInquiryId());
		if(inquiryTemp==null){
			result=insertPurchaseInquiryInfo(purchaseInquiry, list);
		}else{
			result=updatePurchaseInquiryInfo(purchaseInquiry, list);
		}
		
		if(!result.isSuccess()){
			logger.error("保存采购询价操作发生异常");
			throw new RuntimeException("保存采购询价操作发生异常");
		}
		//移除memcached缓存
		MemcacheClient.delete(purchaseInquiryGrdkey);
		result.setChild(status);
		return result;
	}
	
	public JsonUtils insertPurchaseInquiryInfo(PurchaseInquiry purchaseInquiry,List<PurchaseInquiryGrd> list){
		boolean success=false;
		String message="添加采购询价操作失败...";
		String status =purchaseInquiry.getStatus()+"";
		purchaseInquiryDao.insert(purchaseInquiry);
		if(list!=null&&!list.isEmpty()&&list.size()>0){
			purchaseInquiryGrdDao.batchInsertPurchaseInquiryGrd(list);
		}
		success=true;
		message="添加采购询价相关信息成功!!!";
		logger.info(message);
		JsonUtils result = new  JsonUtils(success,message);
		result.setChild(status);
		return result;
	}
	
	public JsonUtils updatePurchaseInquiryInfo(PurchaseInquiry purchaseInquiry,List<PurchaseInquiryGrd> list){
		boolean success=false;
		String message="添加采购询价操作失败...";
		String status=purchaseInquiry.getStatus()+"";
		String purchaseInquiryId= purchaseInquiry.getPurchaseInquiryId();
		//1.更新采购询价表
		success = purchaseInquiryDao.updatePurchaseInquiry(purchaseInquiry);
		//2.检查询价商品是否存在
		Integer count=purchaseInquiryGrdDao.getPurchaseInquiryGrdCountBySalesInquiryId(purchaseInquiryId);
		if((count>0&&list.size()>0)||count==0){
			//1.删除库中数据
			purchaseInquiryGrdDao.deletePurchaseInquiryGrdByPurchaseInquiryId(purchaseInquiryId);
			//2.添加数据
			purchaseInquiryGrdDao.batchInsertPurchaseInquiryGrd(list);
			success=true;
		}else{
			PurchaseInquiryGrd purchaseInquiryGrd=new PurchaseInquiryGrd();
			purchaseInquiryGrd.setPurchaseInquiryId(purchaseInquiryId);
			purchaseInquiryGrd.setStatus(purchaseInquiry.getStatus()+"");
			purchaseInquiryGrd.setReviser(purchaseInquiry.getReviser());
			purchaseInquiryGrd.setVerifier(purchaseInquiry.getVerifier());
			purchaseInquiryGrdDao.updatePurchaseInquiryGrd(purchaseInquiryGrd);
			success=true;
		}
		message="更新采购询价相关信息成功!!!";
		logger.info(message);
		JsonUtils result = new  JsonUtils(success,message);
		result.setChild(status);
		return result;
	}
	
	/**
	 * 通过条件查询销售询价
	 * @param salesInquiry
	 * @return
	 */
	public EasyuiSplitPager<PurchaseInquiry> getSalesInquiryList(PurchaseInquiry purchaseInquiry){
		EasyuiSplitPager<PurchaseInquiry> pager=new EasyuiSplitPager<PurchaseInquiry>();
		List<PurchaseInquiry> list= purchaseInquiryDao.getPurchaseInquiryList(purchaseInquiry);
		if(list!=null&&!list.isEmpty()&&list.size()>0){
			pager.setRows(list);
			pager.setTotal(list.size());
		}
		return pager;
	}
	/**
	 * 通过询价单号获取询价商品信息列表
	 * @param salesInquiryId
	 * @return
	 */
	public EasyuiSplitPager<PurchaseInquiryGrd> getSalesInquiryGrdList(String purchaseInquiryId){
		EasyuiSplitPager<PurchaseInquiryGrd> pager=new EasyuiSplitPager<PurchaseInquiryGrd>();
		if(StringUtils.isNotBlank(purchaseInquiryId)){
			PurchaseInquiryGrd purchaseInquiryGrd = new PurchaseInquiryGrd();
			purchaseInquiryGrd.setPurchaseInquiryId(purchaseInquiryId);
			List<PurchaseInquiryGrd> list = purchaseInquiryGrdDao.getPurchaseInquiryGrdList(purchaseInquiryGrd);
			if(list!=null&&!list.isEmpty()&&list.size()>0){
				pager.setRows(list);
				pager.setTotal(list.size());
			}
		}
		return pager;
	}
}
