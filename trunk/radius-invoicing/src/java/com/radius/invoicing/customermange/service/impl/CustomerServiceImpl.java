/**
 * 
 */
package com.radius.invoicing.customermange.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import sun.awt.image.ImageWatched.Link;

import com.radius.base.cache.memcache.MemcacheClient;
import com.radius.base.page.EasyuiSplitPager;
import com.radius.base.utils.Constants;
import com.radius.base.utils.JsonUtils;
import com.radius.invoicing.customermange.compent.CustomerCompent;
import com.radius.invoicing.customermange.service.CustomerService;
import com.radius.invoicing.ibatis.dao.CustomerDao;
import com.radius.invoicing.ibatis.dao.LinkManDao;
import com.radius.invoicing.ibatis.model.ContractScanGrd;
import com.radius.invoicing.ibatis.model.Customer;
import com.radius.invoicing.ibatis.model.LinkMan;
import com.radius.invoicing.ibatis.model.SalesOrderGoodsGrd;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 客户处理service层
 */
@Service
public class CustomerServiceImpl implements Constants, CustomerService {

	
	private Logger logger =Logger.getLogger(this.getClass());
	
	@Resource(name="customerDaoImpl")
	CustomerDao customerDao;
	
	@Resource(name="linkManDaoImpl")
	LinkManDao linkManDao;
	
	
	
	
	/**
	 * 通过条件查询获取easyui对象的分页对象
	 * @param customer
	 * @return
	 */
	public EasyuiSplitPager<Customer> getCustomerInfoSplitPage(Customer customer){
		EasyuiSplitPager<Customer> customerEasyuiSplitPage=new EasyuiSplitPager<Customer>();
		List<Customer> list=customerDao.getCustomerByCondition(customer);
		customerEasyuiSplitPage.setRows(list);
		customerEasyuiSplitPage.setTotal(list.size());
		return customerEasyuiSplitPage;
	}
	/**
	 * 根据条件查询联系人信息
	 * @param linkman
	 * @return
	 */
	public EasyuiSplitPager<LinkMan> getLinkManInfoSplitPage(LinkMan linkman){
		EasyuiSplitPager<LinkMan> customerEasyuiSplitPage=new EasyuiSplitPager<LinkMan>();
		List<LinkMan> list= linkManDao.getLinkManByCondition(linkman);
		customerEasyuiSplitPage.setRows(list);
		customerEasyuiSplitPage.setTotal(list.size());
		return customerEasyuiSplitPage;
	}
	
	
	
	/**
	 * 将客户联系人添加到缓存中
	 * @param key
	 * @param grd
	 * @return
	 */
	public JsonUtils addCustomerLinkMan2Memcached(String key,LinkMan linkMan){
		Map<String,LinkMan> memcache=null;
		Object cache=MemcacheClient.get(key);
		String mapKey=linkMan.getCompanyId()+"_"+linkMan.getId();//客户编号_联系人编号
		if(cache!=null){
			memcache=(Map<String,LinkMan>)cache;
			LinkMan goodGrd=memcache.get(mapKey);
			if(linkMan!=null){//更新map对象
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
	 * 移除客户联系人信息从memcached中
	 * @param key
	 * @param isDelete true表示删除整个对象
	 * @param grd
	 * @return
	 */
	public JsonUtils removeCustomerLinkMan2Memcached(String key,boolean isDelete,LinkMan linkMan){
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
	
	
	//保存客户信息
	public JsonUtils saveCustomerInfo(String key,Customer customer){
		String message="操作失败";
		boolean success =false;
		try{
			//1.将数据完成化
			
			//2.检查数据是否存在
			Customer temp = customerDao.getCustomerById(customer.getId());
			if(temp ==null){//说明是添加
				//3.添加数据
				customerDao.insertCustomer(customer);
				message="添加客户信息操作成功...";
				success=true;
			}else{
				//4.更新数据
				success = customerDao.updateCustomerById(customer);
				message="更新客户信息操作成功...";
			}
			if(success){
				//3.构建联系人对象
				List<LinkMan> list= CustomerCompent.getCustomerLinkManList(key, customer);
				if(!list.isEmpty()&&list.size()>0){
					linkManDao.batchInsertLinkMan(list);
					MemcacheClient.delete(key);//清除memcached
					success=true;
				}
			}
		}catch(Exception e){
			logger.error(e);
			e.printStackTrace();
		}
		//--------------------------返回操作结果 -----------------------------------
		JsonUtils result = new  JsonUtils(success,message);
		result.setChild(customer);
		return result;
	}
}
