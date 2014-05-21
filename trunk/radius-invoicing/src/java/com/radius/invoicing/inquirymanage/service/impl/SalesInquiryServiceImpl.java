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
import com.radius.invoicing.ibatis.dao.SalesInquiryDao;
import com.radius.invoicing.ibatis.dao.SalesInquiryGrdDao;
import com.radius.invoicing.ibatis.model.SalesInquiry;
import com.radius.invoicing.ibatis.model.SalesInquiryGrd;
import com.radius.invoicing.inquirymanage.compent.SalesInquiryCompent;
import com.radius.invoicing.inquirymanage.service.SalesInquiryService;

@Service
@SuppressWarnings("unchecked")
public class SalesInquiryServiceImpl implements Constants, SalesInquiryService{

	private Logger logger =Logger.getLogger(this.getClass());
	
	@Autowired(required=false)
	@Qualifier("salesInquiryDaoImpl")
	private SalesInquiryDao salesInquiryDao;
	
	@Autowired(required=false)
	@Qualifier("salesInquiryGrdDaoImpl")
	private SalesInquiryGrdDao salesInquiryGrdDao;
	/**
	 * 将销售询价商品添加到memcached中
	 * @param key
	 * @param grd
	 * @return
	 */
	public JsonUtils addSalesInquiryGrd2Memcached(String key,SalesInquiryGrd grd){
		Map<String,SalesInquiryGrd> memcache=null;
		Object cache=MemcacheClient.get(key);
		String mapKey=grd.getSalesInquiryId()+"_"+grd.getGoodsId();//销售询价单号_商品编号
		if(cache!=null){
			memcache=(Map<String,SalesInquiryGrd>)cache;
			SalesInquiryGrd goodGrd=memcache.get(mapKey);
			if(goodGrd!=null){//更新map对象
				goodGrd.setQuantityUnit(grd.getQuantityUnit());
				logger.error("key "+key+",已经将其缓存在对象中 "+cache);
				grd=goodGrd;
			}
		}else{
			memcache = new HashMap<String, SalesInquiryGrd>();
		}
		memcache.put(mapKey, grd);
		MemcacheClient.set(key, memcache, CACHE_ONE_HOURE_TIME);//将带缓存的对象进行写入
		return new JsonUtils (true,"将销售询价商品缓存到内存中成功....");
	}
	
	
	/**
	 * 移除销售订单商品从memcached中
	 * @param key
	 * @param isDelete true表示删除整个对象
	 * @param grd
	 * @return
	 */
	public JsonUtils removeSalesInquiryGrd2Memcached(String key,boolean isDelete,SalesInquiryGrd grd){
		String memo=grd.getMemo();//该字段存放带删除的主键信息
		Map<String,SalesInquiryGrd> memcache=null;
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
			memcache=(Map<String, SalesInquiryGrd>) cache;
			String mapKey=null;
			if(memo.contains(",")){
				for(String goodsId:memo.split(",")){
					mapKey=grd.getSalesInquiryId()+"_"+goodsId;//销售询价号_商品编号
					memcache.remove(mapKey);//将key对应的对象进行删除
				}
			}else{
				mapKey=grd.getSalesInquiryId()+"_"+memo;//销售询价号_商品编号
				memcache.remove(mapKey);//将key对应的对象进行删除
			}
			jsonUtils.setSuccess(true);
			jsonUtils.setMessage("删除缓存对象成功...");
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
	public JsonUtils saveSalesInquiryInfo(SalesInquiry inquiry,String salesInquiryGrdkey,String inqueryStatus){
		JsonUtils result = null;
		String status = inquiry.getStatus();
		List<SalesInquiryGrd> list=SalesInquiryCompent.getMemcachedSalesInquiryGrd(salesInquiryGrdkey, inquiry,inqueryStatus);
		SalesInquiry inquiryTemp= salesInquiryDao.getSalesInquiryById(inquiry.getSalesInquiryId());
		if(inquiryTemp==null){
			result=insertSalesInquiryInfo(inquiry, list);
		}else{
			result=updateSalesInquiryInfo(inquiry, list);
		}
		
		if(!result.isSuccess()){
			logger.error("保存客户询价操作发生异常");
			throw new RuntimeException("保存客户询价操作发生异常");
		}
		//移除memcached缓存
		MemcacheClient.delete(salesInquiryGrdkey);
		result.setChild(status);
		return result;
	}
	
	public JsonUtils insertSalesInquiryInfo(SalesInquiry salesInquiry,List<SalesInquiryGrd> list){
		boolean success=false;
		String message="添加客户询价操作失败...";
		String status =salesInquiry.getStatus();
		salesInquiryDao.insert(salesInquiry);
		if(list!=null&&!list.isEmpty()&&list.size()>0){
			salesInquiryGrdDao.batchInsertSalesInquiryGrd(list);
		}
		success=true;
		message="添加客户询价相关信息成功!!!";
		logger.info(message);
		JsonUtils result = new  JsonUtils(success,message);
		result.setChild(status);
		return result;
	}
	
	public JsonUtils updateSalesInquiryInfo(SalesInquiry salesInquiry,List<SalesInquiryGrd> list){
		boolean success=false;
		String message="添加合同操作失败...";
		String status=salesInquiry.getStatus();
		String salesInquiryId= salesInquiry.getSalesInquiryId();
		//1.更新客户询价表
		success = salesInquiryDao.updateSalesInquiry(salesInquiry);
		//2.检查询价商品是否存在
		Integer count=salesInquiryGrdDao.getSalesInquiryGrdCountBySalesInquiryId(salesInquiryId);
		if((count>0&&list.size()>0)||count==0){
			//1.删除库中数据
			salesInquiryGrdDao.deleteSalesInquiryGrdBySalesInquiryId(salesInquiryId);
			//2.添加数据
			salesInquiryGrdDao.batchInsertSalesInquiryGrd(list);
			success=true;
		}else{
			SalesInquiryGrd salesInquiryGrd=new SalesInquiryGrd();
			salesInquiryGrd.setSalesInquiryId(salesInquiryId);
			salesInquiryGrd.setStatus(salesInquiry.getStatus());
			salesInquiryGrd.setReviser(salesInquiry.getReviser());
			salesInquiryGrd.setVerifier(salesInquiry.getVerifier());
			salesInquiryGrdDao.updateSalesInquiryGrd(salesInquiryGrd);
			success=true;
		}
		message="更新采购合同相关信息成功!!!";
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
	public EasyuiSplitPager<SalesInquiry> getSalesInquiryList(SalesInquiry salesInquiry){
		EasyuiSplitPager<SalesInquiry> pager=new EasyuiSplitPager<SalesInquiry>();
		List<SalesInquiry> list= salesInquiryDao.getSalesInquiryList(salesInquiry);
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
	public EasyuiSplitPager<SalesInquiryGrd> getSalesInquiryGrdList(String salesInquiryId){
		EasyuiSplitPager<SalesInquiryGrd> pager=new EasyuiSplitPager<SalesInquiryGrd>();
		if(StringUtils.isNotBlank(salesInquiryId)){
			SalesInquiryGrd salesInquiryGrd = new SalesInquiryGrd();
			salesInquiryGrd.setSalesInquiryId(salesInquiryId);
			List<SalesInquiryGrd> list = salesInquiryGrdDao.getSalesInquiryGrdList(salesInquiryGrd);
			if(list!=null&&!list.isEmpty()&&list.size()>0){
				pager.setRows(list);
				pager.setTotal(list.size());
			}
		}
		return pager;
	}
}
