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
import com.radius.invoicing.ibatis.model.SalesOrder;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 销售订单处理
 */
@Controller
@Scope("request")
public class SalesOrderController extends BaseController {

	private Logger  logger=Logger.getLogger(this.getClass());
	
	private final String prefix="/jsp/order/sales/";
	
	private String sales_order_view=null; //销售订单视图
	
	@PostConstruct
	public void init(){
		if(sales_order_view==null){
			sales_order_view=prefix+"sales_order.jsp";
		}
	}
	
	/**
	 * 进入销售订单管理界面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/order/manager/salesOrder/sales_order_view.html")
	public ModelAndView salesOrder(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String salesOrderId=StockUtils.getSalesOrderId();
		SalesOrder salesOrder=new  SalesOrder();
		salesOrder.setSalesOrderId(salesOrderId);//销售订单号
		
		ModelAndView mv=new ModelAndView(sales_order_view);
		mv.addObject("salesOrder", salesOrder);
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@PreDestroy
	public void destroy(){
		if(sales_order_view!=null){
			sales_order_view=null;
		}
	}
}
