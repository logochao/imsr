package com.radius.invoicing.cache.impl;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.radius.invoicing.cache.AbstractCache;
import com.radius.invoicing.ibatis.dao.CategoryCodeDao;
import com.radius.invoicing.ibatis.dao.CategoryTypeDao;
import com.radius.invoicing.ibatis.model.CategoryCode;
import com.radius.invoicing.ibatis.model.CategoryType;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 分类字段缓存
 */
@Component
@Scope("singleton")
public class CategoryCacheImpl extends AbstractCache{

	private Logger logger=Logger.getLogger(this.getClass());
	
	private static Map<Integer, CategoryType> categoryTypeCache=new ConcurrentHashMap<Integer, CategoryType>();
	private static Map<Integer, CategoryCode> categoryCodeCache=new ConcurrentHashMap<Integer, CategoryCode>();
	private static Map<Integer, List<CategoryCode>> categoryCodeListCache=new ConcurrentHashMap<Integer,  List<CategoryCode>>();
	
	@Autowired(required=false)
	@Qualifier("categoryTypeDaoImpl")
	private CategoryTypeDao categoryTypeDao;
	
	@Autowired(required=false)
	@Qualifier("categoryCodeDaoImpl")
	private CategoryCodeDao categoryCodeDao;
	
	public void updatecache() {
		try{
			updateCategorCache();
		}catch(Exception e){
			logger.error("将分类信息与分类代码缓存到内存中失败.....");
			e.printStackTrace();
		}
	}

	private void updateCategorCache(){
		//1.获取所有的分类信息
		List<CategoryType> categoryTypeList = categoryTypeDao.getCategoryTypeAllList();
		Map<Integer, CategoryType> categoryTypeCacheTemp=new ConcurrentHashMap<Integer, CategoryType>();
		Map<Integer, CategoryCode> categoryCodeCacheTemp=new ConcurrentHashMap<Integer, CategoryCode>();
		Map<Integer, List<CategoryCode>> categoryCodeListCacheTemp=new ConcurrentHashMap<Integer,  List<CategoryCode>>();
		//2.根据所有的分类编号获取分类代码
		for(CategoryType type:categoryTypeList){
			categoryTypeCacheTemp.put(type.getId(), type);
			
			List<CategoryCode> categoryCodeList = categoryCodeDao.getCategoryCodeByParentId(type.getId());
			
			if(categoryCodeList!=null&&categoryCodeList.size()>0){//根据分类信息获取分类代码列表
				categoryCodeListCacheTemp.put(type.getId(), categoryCodeList);
			}
			
			for(CategoryCode code:categoryCodeList){
				categoryCodeCacheTemp.put(code.getId(), code);
			}
		}
		
		if(!categoryTypeCacheTemp.isEmpty()&&categoryTypeCacheTemp.size()>0){//当前待缓存的对象不为空时才对内存中的缓存进行更新
			categoryTypeCache=null;
			categoryTypeCache = categoryTypeCacheTemp;
		}
		
		if(!categoryCodeCacheTemp.isEmpty()&&categoryCodeCacheTemp.size()>0){
			categoryCodeCache=null;
			categoryCodeCache = categoryCodeCacheTemp;
		}
		
		if(!categoryCodeListCacheTemp.isEmpty()&&categoryCodeListCacheTemp.size()>0){
			categoryCodeListCache=null;
			categoryCodeListCache=categoryCodeListCacheTemp;
		}
		
		categoryTypeCacheTemp=null;
		categoryCodeCacheTemp=null;
		categoryCodeListCacheTemp=null;
	}
	
	/**
	 * 根据主键获取分类对象
	 * @param id
	 * @return
	 */
	public static CategoryType getCategoryTypeById(Integer id){
		return categoryTypeCache.get(id);
	}
	
	/**
	 * 根据父id获取分类代码列表
	 * @return
	 */
	public static List<CategoryCode> getCategoryCodeListByParentId(Integer parentId){
		return categoryCodeListCache.get(parentId);
	}
	/**
	 * 根据分类代码编号获取分类代码信息
	 * @param id
	 * @return
	 */
	public static CategoryCode getCategoryCodeById(Integer id){
		return categoryCodeCache.get(id);
	}
}
