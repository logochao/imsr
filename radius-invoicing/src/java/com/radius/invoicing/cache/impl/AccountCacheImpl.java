package com.radius.invoicing.cache.impl;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.radius.invoicing.cache.AbstractCache;
import com.radius.invoicing.ibatis.dao.AccountDao;
//import com.radius.invoicing.ibatis.dao.CategoryTypeDao;
import com.radius.invoicing.ibatis.model.Account;
//import com.radius.invoicing.ibatis.model.CategoryType;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 分类字段缓存
 */
@Component
@Scope("singleton")
public class AccountCacheImpl extends AbstractCache{

	private Logger logger=Logger.getLogger(this.getClass());
	
	//private static Map<Integer, CategoryType> categoryTypeCache=new ConcurrentHashMap<Integer, CategoryType>();
	private static Map<String, Account> accountCache=new ConcurrentHashMap<String, Account>();
	private static List li= new CopyOnWriteArrayList<Account>();
	
	@Autowired(required=false)
	@Qualifier("accountDaoImpl")
	private AccountDao accountDao;
	
	public void updatecache() {
		try{
			updateAccountCache();
		}catch(Exception e){
			logger.error("将分类信息与分类代码缓存到内存中失败.....");
			e.printStackTrace();
		}
	}

	private void updateAccountCache(){
		//1.获取所有的分类信息
		List<Account> accountList = accountDao.getAccountAllList();
		Map<String, Account> accountCacheTemp=new ConcurrentHashMap<String, Account>();
		//2.根据所有的分类编号获取分类代码
		for(Account code:accountList){
			accountCacheTemp.put(code.getId(), code);
		}

		if(!accountCacheTemp.isEmpty()&&accountCacheTemp.size()>0){
			accountCache=null;
			accountCache = accountCacheTemp;
			li = accountList;
			
		}
			
		accountCacheTemp=null;
	}
	
	/**
	 * 根据主键获取分类对象
	 * @param id
	 * @return
	 */
	/*
	public static CategoryType getCategoryTypeById(Integer id){
		return categoryTypeCache.get(id);
	}
	*/
	/**
	 * 根据父id获取分类代码列表
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static List<Account> getAccountInfoList( ){
		/*
		Iterator it= accountCache.keySet().iterator();
		List<Account> list=new ArrayList<Account>();
		String key= null;
		while(it.hasNext()){
			key = it.next().toString();
			list.add(accountCache.get(key));
		}
		*/
		return li;
	}
	/**
	 * 根据分类代码编号获取分类代码信息
	 * @param id
	 * @return
	 */
	public static Account getAccountInfoById(Integer id){
		return accountCache.get(id);
	}
}
