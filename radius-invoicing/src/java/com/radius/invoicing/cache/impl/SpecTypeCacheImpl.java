package com.radius.invoicing.cache.impl;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.radius.base.helper.PropertyConfigHelper;
import com.radius.invoicing.cache.AbstractCache;
import com.radius.invoicing.ibatis.dao.CategoryCodeDao;
import com.radius.invoicing.ibatis.dao.SpecTypeDao;
import com.radius.invoicing.ibatis.model.CategoryCode;
import com.radius.invoicing.ibatis.model.SpecType;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
@Component
@Scope("singleton")
public class SpecTypeCacheImpl extends AbstractCache {

	private Logger logger=Logger.getLogger(SpecTypeCacheImpl.class);
	
	
	private static Map<Integer,SpecType> specTypeCached=new ConcurrentHashMap<Integer, SpecType>();
	private static Map<String,List<SpecType>> specTypeCachedList=new ConcurrentHashMap<String, List<SpecType>>();
	
	@Autowired(required=false)
	@Qualifier("specTypeDaoImpl")
	private SpecTypeDao specTypeDao;
	
	@Autowired(required=false)
	@Qualifier("propertyConfigHelper")
	private PropertyConfigHelper propertyConfigHelper;
	
	@Autowired(required=false)
	@Qualifier("categoryCodeDaoImpl")
	private CategoryCodeDao categoryCodeDao;
	
	private int parentId =0;
	
	@Override
	public void updatecache() {
		try{
			updateSpecTypeCache();
		}catch(Exception e){
			logger.error("将规格信息缓存到内存中失败.....");
			e.printStackTrace();
		}
	}

	/**
	 * 更新规格缓存信息
	 */
	@SuppressWarnings("static-access")
	private void updateSpecTypeCache(){
		//1.获取所有的规格信息
		List<SpecType> list = specTypeDao.getSpecTypeAllList();
		parentId =Integer.valueOf(propertyConfigHelper.getPropertyValue("measure.unit.parent.id").toString());
		//2.获取计量单位所有信息
		List<CategoryCode> codeList =categoryCodeDao.getCategoryCodeByParentId(parentId);
		//支持并发缓存map
		Map<Integer,SpecType> specTypeCachedTemp=new ConcurrentHashMap<Integer, SpecType>();
		Map<String,List<SpecType>> specTypeCachedListTemp=new ConcurrentHashMap<String, List<SpecType>>();
		String specUnitName =null;
		String equivalentUnitName=null;
		for(SpecType specType:list){
			 specUnitName =getCategoryCodeName(specType.getSpecUnit(), codeList);
			 equivalentUnitName =getCategoryCodeName(specType.getEquivalentUnit(), codeList);
			 //将对应的计量单位名称对应上
			 specType.setSpecUnitName(specUnitName);
			 specType.setEquivalentUnitName(equivalentUnitName);
			 specTypeCachedTemp.put(specType.getSpecId().intValue(), specType);
		}
		specTypeCachedListTemp.put(propertyConfigHelper.getPropertyValue("spec.type.cached.root").toString(), list);
		if(!specTypeCachedTemp.isEmpty()&&specTypeCachedTemp.size()>0){
			specTypeCached= null;
			specTypeCached = specTypeCachedTemp;
		}
		if(!specTypeCachedListTemp.isEmpty()&&specTypeCachedListTemp.size()>0){
			specTypeCachedList =null;
			specTypeCachedList = specTypeCachedListTemp;
		}
		//---------------------------释放资源----------------
		list = null;
		codeList = null;
		specTypeCachedTemp= null;
		specUnitName =null;
		equivalentUnitName =null;
	}
	
	private String getCategoryCodeName(Integer id,List<CategoryCode> list){
		String name ="";
		if(id==null) return name;
		for(CategoryCode code:list){
			if(id.intValue()==code.getId()){
				name =code.getName();
				break;
			}
		}
		return name;
	}
	
	/**
	 * 通过主键获取规格信息
	 * @param id
	 * @return
	 */
	public static SpecType getSpecTypeBySpecTypeId(Integer id){
		return specTypeCached.get(id);
	}
	
	/**
	 * 通过key获取规格类型列表
	 * @param key
	 * @return
	 */
	public static List<SpecType> getSpecTypeList(String key){
		return specTypeCachedList.get(key);
	}
	
}
