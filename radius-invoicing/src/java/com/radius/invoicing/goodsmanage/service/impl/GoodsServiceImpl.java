/**
 * 
 */
package com.radius.invoicing.goodsmanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.radius.base.page.EasyuiSplitPager;
import com.radius.invoicing.goodsmanage.service.GoodsService;
import com.radius.invoicing.ibatis.dao.GoodsDao;
import com.radius.invoicing.ibatis.model.Goods;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
@Service
public class GoodsServiceImpl implements GoodsService {

	@Autowired(required=false)
	@Qualifier("goodsDaoImpl")
	private GoodsDao goodsDao;
	
	/**
	 * 通过条件查询获取easyui的分页对象
	 * @param goods
	 * @return
	 */
	public EasyuiSplitPager<Goods> getGoodsSplitPage(Goods goods){
		EasyuiSplitPager<Goods> splitPage=new EasyuiSplitPager<Goods>();
		List<Goods> list=goodsDao.getGoodsByCondition(goods);
		splitPage.setRows(list);
		splitPage.setTotal(list.size());
		return splitPage;
	}
	
	
}
