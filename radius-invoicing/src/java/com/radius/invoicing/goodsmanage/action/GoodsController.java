/**
 * 
 */
package com.radius.invoicing.goodsmanage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.radius.base.page.EasyuiSplitPager;
import com.radius.invoicing.goodsmanage.service.GoodsService;
import com.radius.invoicing.ibatis.model.Goods;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 商品处理
 */
@Controller
@Scope("request")
public class GoodsController {

	
	@Autowired(required=false)
	@Qualifier("goodsServiceImpl")
	private GoodsService goodsService;
	
	
	
	
	@RequestMapping("/goods/split_page.html")
	@ResponseBody
	public EasyuiSplitPager<Goods> getGoodsSplitPage(HttpServletRequest request,HttpServletResponse response,Goods goods)throws Exception{
		return goodsService.getGoodsSplitPage(goods);
	}
}
