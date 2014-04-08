/**
 * 
 */
package com.radius.invoicing.goodsmanage.action;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.radius.base.page.EasyuiSplitPager;
import com.radius.base.utils.JsonUtils;
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

//	private Logger logger=Logger.getLogger(this.getClass());
	
	private final String prefix="/jsp/business/goods/";
	
	private String goods_manager_view=null;
	
	
	@PostConstruct
	public void init(){
		if(goods_manager_view==null){
			goods_manager_view=prefix+"business_goods_index.jsp";
		}
	}
	
	
	@Autowired(required=false)
	@Qualifier("goodsServiceImpl")
	private GoodsService goodsService;
	
	
	
	
	
	@RequestMapping({"/goods/split_page.html","/goods/manager/goods/goods_list.html"})
	@ResponseBody
	public EasyuiSplitPager<Goods> getGoodsSplitPage(HttpServletRequest request,HttpServletResponse response,Goods goods)throws Exception{
		return goodsService.getGoodsSplitPage(goods);
	}
	/**
	 * 进入商品管理界面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/goods/manager/goods/goods_manager_view.html")
	public ModelAndView goodsManager(HttpServletRequest request,HttpServletResponse response)throws Exception{
		return new ModelAndView(goods_manager_view);
	}
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public JsonUtils addGoodInfo(HttpServletRequest request,HttpServletResponse response)throws Exception{
		
		
		return null;
	}
	
	
	
	@PreDestroy
	public void destroy(){
		if(goods_manager_view!=null){
			goods_manager_view=null;
		}
	}
}
