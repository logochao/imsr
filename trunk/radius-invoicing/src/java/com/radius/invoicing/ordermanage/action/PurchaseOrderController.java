package com.radius.invoicing.ordermanage.action;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.radius.base.controller.BaseController;
import com.radius.base.utils.StockUtils;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 采购订单处理
 */
@Controller
@Scope("request")
public class PurchaseOrderController extends BaseController {

	private Logger  logger=Logger.getLogger(this.getClass());
	
	private final String prefix="/jsp/order/purchase/";
	
	private String purchase_order_view=null;
	
	@PostConstruct
	public void init(){
		if(purchase_order_view==null){
			purchase_order_view=prefix+"purchase_order_index.jsp";
		}
	}
	
	/**
	 * 进入采购订单管理界面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/order/manager/purchaseOrder/purchase_order_view.html")
	public ModelAndView purchaseOrder(HttpServletRequest request,HttpServletResponse response)throws Exception{
		ModelAndView mv=new ModelAndView(purchase_order_view);
		String orderId=StockUtils.getPurchaseOrderId();
		
		return mv;
	}
	
	
	
	
	@PreDestroy
	public void destroy(){
		if(purchase_order_view!=null){
			purchase_order_view=null;
		}
	}
}
