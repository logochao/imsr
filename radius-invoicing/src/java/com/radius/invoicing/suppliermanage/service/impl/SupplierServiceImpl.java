package com.radius.invoicing.suppliermanage.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.radius.base.cache.memcache.MemcacheClient;
import com.radius.base.page.EasyuiSplitPager;
import com.radius.base.utils.Constants;
import com.radius.base.utils.JsonUtils;
import com.radius.invoicing.enums.YesOrNoEnums;
import com.radius.invoicing.ibatis.dao.LinkManDao;
import com.radius.invoicing.ibatis.dao.SupplierDao;
import com.radius.invoicing.ibatis.model.LinkMan;
import com.radius.invoicing.ibatis.model.Supplier;
import com.radius.invoicing.suppliermanage.compent.SupplierCompent;
import com.radius.invoicing.suppliermanage.service.SupplierService;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 供应商Service 
 */
@Service
public class SupplierServiceImpl implements Constants, SupplierService {

	private Logger logger=Logger.getLogger(this.getClass());
	
	@Autowired(required=false)
	@Qualifier("supplierDaoImpl")
	private SupplierDao supplierDao;
	
	
	@Autowired(required=false)
	@Qualifier("linkManDaoImpl")
	LinkManDao linkManDao;
	
	private EasyuiSplitPager<Supplier> page=null;
	
	@PostConstruct
	public void init(){
		if(page==null){
			page=new EasyuiSplitPager<Supplier>();
		}
	}
	
	/**
	 * 获取供应商信息
	 * @param supplier
	 * @return
	 * @throws Exception
	 */
	public EasyuiSplitPager<Supplier> getSupplierInfo(Supplier supplier)throws Exception{
		List<Supplier> list=supplierDao.getSupplierByCondition(supplier);
		page.setRows(list);
		page.setTotal(list.size());
		return page;
	}

	
	/**
	 * 将供应商联系人添加到缓存中
	 * @param key
	 * @param grd
	 * @return
	 */
	@SuppressWarnings({ "unused", "unchecked" })
	public JsonUtils addSupplierLinkMan2Memcached(String key,LinkMan linkMan){
		Map<String,LinkMan> memcache=null;
		Object cache=MemcacheClient.get(key);
		String mapKey=linkMan.getCompanyId()+"_"+linkMan.getId();//客户编号_联系人编号
		if(cache!=null){
			memcache=(Map<String,LinkMan>)cache;
			LinkMan linkmancache=memcache.get(mapKey);
			if(linkmancache!=null){//更新map对象
				//暂时有更新具体内容
				logger.error("key "+key+",已经将其缓存在对象中 "+cache);
				//linkMan=goodGrd;
			}
		}else{
			memcache = new HashMap<String, LinkMan>();
		}
		memcache.put(mapKey, linkMan);
		MemcacheClient.set(key, memcache, CACHE_ONE_HOURE_TIME);//将带缓存的对象进行写入
		return new JsonUtils (true,"将销售订单商品缓存到内存中成功....");
	}
	
	
	
	/**
	 * 移除供应商联系人信息从memcached中
	 * @param key
	 * @param isDelete true表示删除整个对象
	 * @param grd
	 * @return
	 */
	public JsonUtils removeSupplierLinkMan2Memcached(String key,boolean isDelete,LinkMan linkMan){
		String memo=linkMan.getMome();//该字段存放带删除的主键信息
		Map<String,LinkMan> memcache=null;
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
			String mapKey=null;
			memcache=(Map<String,LinkMan>)cache;
			if(memo.contains(",")){
				for(String id:memo.split(",")){
					mapKey=linkMan.getCompanyId()+"_"+id;//客户编号_联系人编号
					memcache.remove(mapKey);//将key对应的对象进行删除
				}
			}else{
				mapKey=linkMan.getCompanyId()+"_"+memo;//客户编号_联系人编号
				memcache.remove(mapKey);//将key对应的对象进行删除
			}
			jsonUtils.setSuccess(true);
			jsonUtils.setMessage("删除缓存对象成功...");
		}
		MemcacheClient.set(key, memcache, CACHE_ONE_HOURE_TIME);//将带缓存的对象进行写入
		return jsonUtils;
	}
	
	/**
	 * 保存供应商信息(如果存在则更新、否则添加)
	 * @param key
	 * @param supplier
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public JsonUtils saveSupplierInfo(String key,Supplier supplier){
		String message="操作失败";
		boolean success =false;
		if(StringUtils.isNotBlank(supplier.getDeliveryNot())&&"1".equals(supplier.getDeliveryNot())){//是需要送货
			supplier.setYesOrNo(YesOrNoEnums.YES);
		}else{
			supplier.setYesOrNo(YesOrNoEnums.NO);
		}
		
		Object temp = supplierDao.getSupplierById(supplier.getSupplierId());
		if(temp==null){
			//insert
			String id = supplierDao.getSupplierMaxId();
			supplier.setSupplierId(SUPPLIER_PREFIX+id);//G0001
			supplierDao.insertSupplier(supplier);
			message="添加供应商信息操作成功...";
			success=true;
		}else{
			success = supplierDao.updateSupplier(supplier);
			message="更新供应商信息操作成功...";
		}
		if(success){
			//3.构建联系人对象
			List<LinkMan> list= SupplierCompent.getSupplierLinkManList(key, supplier);
			if(!list.isEmpty()&&list.size()>0){
				linkManDao.batchInsertLinkMan(list);
				MemcacheClient.delete(key);//清除memcached
				success=true;
			}
		}
		//--------------------------返回操作结果 -----------------------------------
		JsonUtils result = new  JsonUtils(success,message);
		result.setChild(supplier);
		return result;
	}
	
	
	
	
	
	
	@PreDestroy
	public void destroy(){
		if(page!=null){
			page=null;
		}
	}
}
