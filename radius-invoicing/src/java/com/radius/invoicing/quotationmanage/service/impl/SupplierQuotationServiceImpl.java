/**
 * 
 */
package com.radius.invoicing.quotationmanage.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.radius.base.cache.memcache.MemcacheClient;
import com.radius.base.page.EasyuiSplitPager;
import com.radius.base.utils.Constants;
import com.radius.base.utils.JsonUtils;
import com.radius.invoicing.enums.PurchaseInquiryEnums;
import com.radius.invoicing.ibatis.dao.PurchaseInquiryDao;
import com.radius.invoicing.ibatis.dao.SupplierGoodsDao;
import com.radius.invoicing.ibatis.dao.SupplierQuotationDao;
import com.radius.invoicing.ibatis.dao.SupplierQuotationGrdDao;
import com.radius.invoicing.ibatis.model.PurchaseInquiry;
import com.radius.invoicing.ibatis.model.SupplierGoods;
import com.radius.invoicing.ibatis.model.SupplierQuotation;
import com.radius.invoicing.ibatis.model.SupplierQuotationGrd;
import com.radius.invoicing.quotationmanage.compent.SupplierQuotationCompent;
import com.radius.invoicing.quotationmanage.service.SupplierQuotationService;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 供应商报价Service
 */
@Service
@SuppressWarnings("unchecked")
public class SupplierQuotationServiceImpl implements Constants, SupplierQuotationService{

	private Logger logger =Logger.getLogger(this.getClass());
	
	@Autowired(required=false)
	@Qualifier("supplierQuotationDaoImpl")
	private SupplierQuotationDao supplierQuotationDao;
	
	@Autowired(required=false)
	@Qualifier("supplierQuotationGrdDaoImpl")
	private SupplierQuotationGrdDao supplierQuotationGrdDao;
	
	@Autowired(required=false)
	@Qualifier("supplierGoodsDaoImpl")
	private SupplierGoodsDao supplierGoodsDao;
	
	@Autowired(required=false)
	@Qualifier("purchaseInquiryDaoImpl")
	private PurchaseInquiryDao purchaseInquiryDao;
	
	/**
	 * 供应商报价商品列表
	 * @param key
	 * @param supplierQuotationGrd
	 * @return
	 */
	public JsonUtils addSupplierQuotationGrd2Memcached(String key ,SupplierQuotationGrd supplierQuotationGrd){
		Map<String,SupplierQuotationGrd> memcache=null;
		Object cache=MemcacheClient.get(key);
		String mapKey=supplierQuotationGrd.getQuotationId()+"_"+supplierQuotationGrd.getGoodsId();//供应商报价单号_商品编号
		if(cache!=null){
			memcache=(Map<String,SupplierQuotationGrd>)cache;
			SupplierQuotationGrd goodGrd=memcache.get(mapKey);
			if(goodGrd!=null){//更新map对象
				logger.error("key "+key+",已经将其缓存在对象中 "+cache);
				supplierQuotationGrd=goodGrd;
			}
		}else{
			memcache = new HashMap<String, SupplierQuotationGrd>();
		}
		memcache.put(mapKey, supplierQuotationGrd);
		MemcacheClient.set(key, memcache, CACHE_ONE_HOURE_TIME);//将带缓存的对象进行写入
		return new JsonUtils (true,"将供应商报价商品缓存到内存中成功....");
	}
	
	
	/**
	 * 移除供应商商品列表
	 * @param key
	 * @param isDelete
	 * @param supplierQuotationGrd
	 * @return
	 */
	public JsonUtils removeSupplierQuotationGrd2Memecached(String key,boolean isDelete,SupplierQuotationGrd supplierQuotationGrd){
		
		String memo=supplierQuotationGrd.getMemo();//该字段存放带删除的主键信息
		Map<String,SupplierQuotationGrd> memcache=null;
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
			memcache=(Map<String, SupplierQuotationGrd>) cache;
			String mapKey=null;
			if(memo.contains(",")){
				for(String goodsId:memo.split(",")){
					mapKey=supplierQuotationGrd.getQuotationId()+"_"+goodsId;//供应商报价号_商品编号
					memcache.remove(mapKey);//将key对应的对象进行删除
				}
			}else{
				mapKey=supplierQuotationGrd.getQuotationId()+"_"+memo;//供应商报价号_商品编号
				memcache.remove(mapKey);//将key对应的对象进行删除
			}
			jsonUtils.setSuccess(true);
			jsonUtils.setMessage("删除供应商报价商品缓存对象成功...");
		}
		MemcacheClient.set(key, memcache, CACHE_ONE_HOURE_TIME);//将带缓存的对象进行写入
		return jsonUtils;
	}
	
	public JsonUtils saveSupplierQuotationInfo(String key,SupplierQuotation supplierQuotation){
		List<SupplierQuotationGrd> list =SupplierQuotationCompent.getMemcachedSupplierQuotationGrd(key, supplierQuotation);
		SupplierQuotation supplierQuotationTemp=supplierQuotationDao.getSupplierQuotationById(supplierQuotation.getSupplierQuotationId());
		if(supplierQuotationTemp==null){
			//insert
			return   insertSupplierQuotationInfo(list, supplierQuotation);
		}
		//update
		return  updateSupplierQuotationInfo(list, supplierQuotation);
		
	}
	/**
	 * 
	 * @param list
	 * @param supplierQuotation
	 * @return
	 */
	public JsonUtils insertSupplierQuotationInfo(List<SupplierQuotationGrd> list,SupplierQuotation supplierQuotation){
		boolean success=false;
		String message="添加供应商报价操作失败...";
		String status=supplierQuotation.getStatus();
		//1.供应商报价
		supplierQuotationDao.insert(supplierQuotation);
		if(list!=null&&!list.isEmpty()&&list.size()>0){
			//2.供应商报价商品
			supplierQuotationGrdDao.batchInsertSupplierQuotationGrd(list);
		}
		//3.采购询价
		PurchaseInquiry purchaseInquiry=new PurchaseInquiry();
		purchaseInquiry.setPurchaseInquiryId(supplierQuotation.getPurchaseInquiryId());
		purchaseInquiry.setStatus(PurchaseInquiryEnums.QUOTED.getId());
		purchaseInquiryDao.updateStatusByPurchaseInquiryId(purchaseInquiry);
		//4.将商品信息添加到供应商商品信息
		saveSupplierGoods(list, supplierQuotation.getSupplierId());
		success=true;
		message="添加供应商报价相关信息成功!!!";
		logger.info(message);
		JsonUtils result = new  JsonUtils(success,message);
		result.setChild(status);
		return result;
	}
	
	
	
	public JsonUtils updateSupplierQuotationInfo(List<SupplierQuotationGrd> list,SupplierQuotation supplierQuotation){
		boolean success=false;
		String message="更新操作供应商报价失败...";
		String status=supplierQuotation.getStatus();
		String supplierQuotationId= supplierQuotation.getSupplierQuotationId();
		//1.更新采购询价表
		success = supplierQuotationDao.updateStatusBySupplierQuotationId(supplierQuotation);
		//2.检查询价商品是否存在
		Integer count=supplierQuotationGrdDao.getSupplierQuotationGrdCountByquotationId(supplierQuotationId);
		if((count>0&&list.size()>0)||count==0){
			//1.删除库中数据
			supplierQuotationGrdDao.deleteSupplierQuotationGrdByquotationId(supplierQuotationId);
			//2.添加数据
			supplierQuotationGrdDao.batchInsertSupplierQuotationGrd(list);
			success=true;
		}else{
			SupplierQuotationGrd supplierQuotationGrd=new SupplierQuotationGrd();
			supplierQuotationGrd.setQuotationId(supplierQuotationId);
			supplierQuotationGrd.setReviser(supplierQuotation.getReviser());
			supplierQuotationGrd.setVerifier(supplierQuotation.getVerifier());
			supplierQuotationGrdDao.updateSupplierQuotationGrd(supplierQuotationGrd);
			success=true;
		}
		
		//3.添加或更新供应商商品信息
		saveSupplierGoods(list, supplierQuotation.getSupplierId());
		message="更新供应商报价信息成功!!!";
		logger.info(message);
		JsonUtils result = new  JsonUtils(success,message);
		result.setChild(status);
		return result;
	}
	
	/**
	 * 保存供应商商品信息
	 * @param list
	 * @param supplierId
	 */
	public void saveSupplierGoods(List<SupplierQuotationGrd> list,String supplierId){
		SupplierGoods supplierGoods=null;
		for(SupplierQuotationGrd quotationGrd:list){
			supplierGoods =new SupplierGoods();
			
//			BeanUtils.copyProperties(supplierGoods, quotationGrd);
			
			supplierGoods.setSupplierId(supplierId);
			supplierGoods.setGoodsId(quotationGrd.getGoodsId());
			supplierGoods.setGoodsName(quotationGrd.getGoodsName());
			supplierGoods.setSpecId(quotationGrd.getSpecId());
			supplierGoods.setUnit(Integer.valueOf(quotationGrd.getUnit()));
			supplierGoods.setEquivalentUnit(Integer.valueOf(quotationGrd.getEquivalentUnit()));
			supplierGoods.setQuantityEuPerUnit(quotationGrd.getQuantityEuPerUnit());
			supplierGoods.setSupplyCashType(Integer.valueOf(quotationGrd.getCashType()));
			supplierGoods.setPriceUnitSupply(quotationGrd.getPriceUnitSupply());
			supplierGoods.setPriceEuSupply(quotationGrd.getPriceEuSupply());
			supplierGoods.setValidityDate(quotationGrd.getValidityDate());
			supplierGoods.setLedgerId(quotationGrd.getLedgerId());
			supplierGoods.setOperator(quotationGrd.getOperator());
			supplierGoods.setCreater(quotationGrd.getCreater());
			supplierGoods.setReviser(quotationGrd.getReviser());
			supplierGoods.setVerifier(quotationGrd.getVerifier());
			
			Integer count = supplierGoodsDao.getSupplierGoodsCount(supplierId, quotationGrd.getGoodsId());
			if(count==null||count==0){
				//insert 
				supplierGoodsDao.insertSupplierGoods(supplierGoods);
			}else{
				supplierGoodsDao.updateSupplierGoods(supplierGoods);
			}
		}
	}
	
	/**
	 * 获取供应商报价列表
	 * @param supplierQuotation
	 * @return
	 */
	public EasyuiSplitPager<SupplierQuotation> getSupplierQuotationList(SupplierQuotation supplierQuotation){
		 EasyuiSplitPager<SupplierQuotation> pager=new EasyuiSplitPager<SupplierQuotation>();
		 List<SupplierQuotation>  list =  supplierQuotationDao.getSupplierQuotationList(supplierQuotation);
		 if(list==null||list.isEmpty()){
			 list =new ArrayList<SupplierQuotation>();
		 }
		 pager.setRows(list);
		 pager.setTotal(list.size());
		 return pager;
	}
	/**
	 * 通过供应商编号获取供应商商品列表
	 * @param supplierQuotationId
	 * @return
	 */
	public EasyuiSplitPager<SupplierQuotationGrd> getSupplierQuotationGrd(String supplierQuotationId){
		EasyuiSplitPager<SupplierQuotationGrd> pager=new EasyuiSplitPager<SupplierQuotationGrd>();
		SupplierQuotationGrd supplierQuotationGrd=new SupplierQuotationGrd();
		supplierQuotationGrd.setQuotationId(supplierQuotationId);
		List<SupplierQuotationGrd> list= supplierQuotationGrdDao.getSupplierQuotationGrdList(supplierQuotationGrd);
		if(list==null||list.isEmpty()){
			list =new ArrayList<SupplierQuotationGrd>();
		}
		pager.setRows(list);
		pager.setTotal(list.size());
		return pager;
	}
	
}
