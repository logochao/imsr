package com.radius.invoicing.suppliermanage.service.impl;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.radius.base.page.EasyuiSplitPager;
import com.radius.invoicing.ibatis.dao.SupplierDao;
import com.radius.invoicing.ibatis.model.Supplier;
import com.radius.invoicing.suppliermanage.service.SupplierService;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 供应商Service 
 */
@Service
public class SupplierServiceImpl implements SupplierService {

	private Logger logger=Logger.getLogger(this.getClass());
	
	@Autowired(required=false)
	@Qualifier("supplierDaoImpl")
	private SupplierDao supplierDao;
	
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

	@PreDestroy
	public void destroy(){
		if(page!=null){
			page=null;
		}
	}
}
