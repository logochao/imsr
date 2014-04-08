/**
 * 
 */
package com.radius.invoicing.goodsmanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.radius.base.page.EasyuiSplitPager;
import com.radius.base.utils.JsonUtils;
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
public class GoodsServiceImpl implements GoodsService   {

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
	
	
	/**
	 * 保存商品信息 <br> 1.如果存在,则更新;<br/>2.如果不存在,则添加
	 * @param goods
	 * @return
	 */
	public JsonUtils saveGoodsInfo(Goods goods,String statusCode){
		List list = goodsDao.getGoods(goods);
		if(list!=null&&!list.isEmpty()&&list.size()>0){
			return updateGoodsInfo(goods,statusCode);
		}
		return addGoodsInfo(goods,statusCode);
	}
	
	
	/**
	 * 更新商品信息
	 * @param goods
	 * @return
	 */
	public JsonUtils updateGoodsInfo(Goods goods,String statusCode){
		JsonUtils jsonUtils =new JsonUtils();
		jsonUtils.setMessage("更新商品信息失败...");
		
		boolean success = goodsDao.updateGoods(goods);
		if(success){
			jsonUtils.setMessage("更新商品信息成功...");
		}
		jsonUtils.setSuccess(success);
		jsonUtils.setChild(statusCode);
		return jsonUtils;
	}
	/**
	 * 添加商品信息
	 * @param goods
	 * @return
	 */
	public JsonUtils addGoodsInfo(Goods goods,String statusCode){
		JsonUtils jsonUtils =new JsonUtils();
		jsonUtils.setMessage("添加商品信息失败...");
		
		goodsDao.insert(goods);
		jsonUtils.setSuccess(true);
		jsonUtils.setMessage("添加商品信息成功...");
		jsonUtils.setChild(statusCode);
		return jsonUtils;
	}
}
