/**
 * 
 */
package com.radius.invoicing.quotationmanage.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.radius.base.cache.memcache.MemcacheClient;
import com.radius.base.page.EasyuiSplitPager;
import com.radius.base.utils.Constants;
import com.radius.base.utils.JsonUtils;
import com.radius.invoicing.ibatis.dao.SalesQuotationDao;
import com.radius.invoicing.ibatis.dao.SalesQuotationGrdDao;
import com.radius.invoicing.ibatis.dao.SupplierGoodsDao;
import com.radius.invoicing.ibatis.model.SalesQuotation;
import com.radius.invoicing.ibatis.model.SalesQuotationGrd;
import com.radius.invoicing.ibatis.model.SupplierGoods;
import com.radius.invoicing.quotationmanage.compent.SalesQuotationCompent;
import com.radius.invoicing.quotationmanage.service.SalesQuotationService;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 供应商报价Service
 */
@Service
@SuppressWarnings("unchecked")
public class SalesQuotationServiceImpl implements Constants, SalesQuotationService{

	private Logger logger =Logger.getLogger(this.getClass());
	
	@Autowired(required=false)
	@Qualifier("salesQuotationDaoImpl")
	private SalesQuotationDao salesQuotationDao;
	
	@Autowired(required=false)
	@Qualifier("salesQuotationGrdDaoImpl")
	private SalesQuotationGrdDao salesQuotationGrdDao;
	
	@Autowired(required=false)
	@Qualifier("supplierGoodsDaoImpl")
	private SupplierGoodsDao supplierGoodsDao;
	
	
	
	/**
	 * 供应商报价商品列表
	 * @param key
	 * @param SalesQuotationGrd
	 * @return
	 */
	public JsonUtils addSalesQuotationGrd2Memcached(String key ,SalesQuotationGrd salesQuotationGrd){
		Map<String,SalesQuotationGrd> memcache=null;
		Object cache=MemcacheClient.get(key);
		String mapKey=salesQuotationGrd.getSalesQuotationId()+"_"+salesQuotationGrd.getGoodsId();//供应商报价单号_商品编号
		if(cache!=null){
			memcache=(Map<String,SalesQuotationGrd>)cache;
			SalesQuotationGrd goodGrd=memcache.get(mapKey);
			if(goodGrd!=null){//更新map对象
				logger.error("key "+key+",已经将其缓存在对象中 "+cache);
				salesQuotationGrd=goodGrd;
			}
		}else{
			memcache = new HashMap<String, SalesQuotationGrd>();
		}
		memcache.put(mapKey, salesQuotationGrd);
		MemcacheClient.set(key, memcache, CACHE_ONE_HOURE_TIME);//将带缓存的对象进行写入
		return new JsonUtils (true,"将销售报价商品缓存到内存中成功....");
	}
	
	
	/**
	 * 移除供应商商品列表
	 * @param key
	 * @param isDelete
	 * @param salesQuotationGrd
	 * @return
	 */
	public JsonUtils removeSalesQuotationGrd2Memecached(String key,boolean isDelete,SalesQuotationGrd salesQuotationGrd){
		
		String memo=salesQuotationGrd.getMemo();//该字段存放带删除的主键信息
		Map<String,SalesQuotationGrd> memcache=null;
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
			memcache=(Map<String, SalesQuotationGrd>) cache;
			String mapKey=null;
			if(memo.contains(",")){
				for(String goodsId:memo.split(",")){
					mapKey=salesQuotationGrd.getSalesQuotationId()+"_"+goodsId;//供应商报价号_商品编号
					memcache.remove(mapKey);//将key对应的对象进行删除
				}
			}else{
				mapKey=salesQuotationGrd.getSalesQuotationId()+"_"+memo;//供应商报价号_商品编号
				memcache.remove(mapKey);//将key对应的对象进行删除
			}
			jsonUtils.setSuccess(true);
			jsonUtils.setMessage("删除供应商报价商品缓存对象成功...");
		}
		MemcacheClient.set(key, memcache, CACHE_ONE_HOURE_TIME);//将带缓存的对象进行写入
		return jsonUtils;
	}
	
	public JsonUtils saveSalesQuotationInfo(String key,SalesQuotation salesQuotation){
		List<SalesQuotationGrd> list =SalesQuotationCompent.getMemcachedSalesQuotationGrd(key, salesQuotation);
		SalesQuotation SalesQuotationTemp=salesQuotationDao.getSalesQuotationById(salesQuotation.getSalesQuotationId());
		if(SalesQuotationTemp==null){
			//insert
			return   insertSalesQuotationInfo(list, salesQuotation);
		}
		//update
		return  updateSalesQuotationInfo(list, salesQuotation);
		
	}
	/**
	 * 
	 * @param list
	 * @param salesQuotation
	 * @return
	 */
	public JsonUtils insertSalesQuotationInfo(List<SalesQuotationGrd> list,SalesQuotation salesQuotation){
		boolean success=false;
		String message="添加销售报价操作失败...";
		String status=salesQuotation.getStatus();
		//1.供应商报价
		salesQuotationDao.insert(salesQuotation);
		if(list!=null&&!list.isEmpty()&&list.size()>0){
			//2.供应商报价商品
			salesQuotationGrdDao.batchInsertSaleQuotationGrd(list);
		}
		success=true;
		message="添加销售报价相关信息成功!!!";
		logger.info(message);
		JsonUtils result = new  JsonUtils(success,message);
		result.setChild(status);
		return result;
	}
	
	
	
	public JsonUtils updateSalesQuotationInfo(List<SalesQuotationGrd> list,SalesQuotation salesQuotation){
		boolean success=false;
		String message="更新操作销售报价失败...";
		String status=salesQuotation.getStatus();
		String salesQuotationId= salesQuotation.getSalesQuotationId();
		//1.更新采购询价表
		success = salesQuotationDao.updateStatusBySalesQuotationId(salesQuotation);
		//2.检查询价商品是否存在
		Integer count=salesQuotationGrdDao.getSalesQuotationGrdCountByQuotationId(salesQuotationId);
		if((count>0&&list.size()>0)||count==0){
			//1.删除库中数据
			salesQuotationGrdDao.deleteSalesQuotationGrdByQuotationId(salesQuotationId);
			//2.添加数据
			salesQuotationGrdDao.batchInsertSaleQuotationGrd(list);
			success=true;
		}else{
			SalesQuotationGrd salesQuotationGrd=new SalesQuotationGrd();
			salesQuotationGrd.setSalesQuotationId(salesQuotationId);
			salesQuotationGrd.setReviser(salesQuotation.getReviser());
			salesQuotationGrd.setVerifier(salesQuotation.getVerifier());
			salesQuotationGrdDao.updateSaleQuotationGrdByPk(salesQuotationGrd);
			success=true;
		}
		
		message="更新销售报价信息成功!!!";
		logger.info(message);
		JsonUtils result = new  JsonUtils(success,message);
		result.setChild(status);
		return result;
	}
	
	
	/**
	 * 获取供应商报价列表
	 * @param SalesQuotation
	 * @return
	 */
	public EasyuiSplitPager<SalesQuotation> getSalesQuotationList(SalesQuotation salesQuotation){
		 EasyuiSplitPager<SalesQuotation> pager=new EasyuiSplitPager<SalesQuotation>();
		 List<SalesQuotation>  list =  salesQuotationDao.getSalesQuotationList(salesQuotation);
		 if(list==null||list.isEmpty()){
			 list =new ArrayList<SalesQuotation>();
		 }
		 pager.setRows(list);
		 pager.setTotal(list.size());
		 return pager;
	}
	/**
	 * 通过供应商编号获取供应商商品列表
	 * @param SalesQuotationId
	 * @return
	 */
	public EasyuiSplitPager<SalesQuotationGrd> getSalesQuotationGrd(String salesQuotationId){
		EasyuiSplitPager<SalesQuotationGrd> pager=new EasyuiSplitPager<SalesQuotationGrd>();
		SalesQuotationGrd salesQuotationGrd=new SalesQuotationGrd();
		salesQuotationGrd.setSalesQuotationId(salesQuotationId);
		List<SalesQuotationGrd> list= salesQuotationGrdDao.getSaleQuotationGrdByCondition(salesQuotationGrd);
		if(list==null||list.isEmpty()){
			list =new ArrayList<SalesQuotationGrd>();
		}
		pager.setRows(list);
		pager.setTotal(list.size());
		return pager;
	}
	/**
	 * 获取供应商报价商品信息
	 * @param supplierGoods
	 * @return
	 */
	public EasyuiSplitPager<SupplierGoods> getSupplierGoodsList(SupplierGoods supplierGoods){
		EasyuiSplitPager<SupplierGoods> pager=new EasyuiSplitPager<SupplierGoods>();
		List<SupplierGoods> list =  supplierGoodsDao.getSupplierGoodsList(supplierGoods);
		if(list==null||list.isEmpty()){
			list =new ArrayList<SupplierGoods>();
		}
		pager.setRows(list);
		pager.setTotal(list.size());
		return pager;
	}
}
