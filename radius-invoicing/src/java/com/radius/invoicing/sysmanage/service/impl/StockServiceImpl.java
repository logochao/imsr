package com.radius.invoicing.sysmanage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.radius.invoicing.ibatis.dao.CategoryCodeDao;
import com.radius.invoicing.ibatis.dao.CategoryTypeDao;
import com.radius.invoicing.ibatis.model.CategoryCode;
import com.radius.invoicing.ibatis.model.CategoryType;
import com.radius.invoicing.sysmanage.service.StockService;

@Service
public class StockServiceImpl implements StockService {

	@Autowired(required=false)
	@Qualifier("categoryTypeDaoImpl")
	private CategoryTypeDao categoryTypeDao;
	@Autowired(required=false)
	@Qualifier("categoryCodeDaoImpl")
	private CategoryCodeDao categoryCodeDao;
	
	
	public boolean savecategory(){
		CategoryType type=new CategoryType();
		type.setId(5000);
		type.setName("test");
		
		CategoryCode code=new CategoryCode();
		code.setId(50001);
		code.setName("50001");
		code.setParentId("5000");
		
		categoryTypeDao.insertCategoryType(type);
		categoryCodeDao.insertCategoryCode(code);
		throw new RuntimeException("添加发生异常");
	}
}
