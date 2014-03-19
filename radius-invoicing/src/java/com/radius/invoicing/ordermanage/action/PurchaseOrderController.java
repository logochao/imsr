package com.radius.invoicing.ordermanage.action;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.radius.base.controller.BaseController;
import com.radius.base.utils.JsonUtils;
import com.radius.base.page.EasyuiSplitPager;
import com.radius.base.utils.StockUtils;
import com.radius.invoicing.ibatis.model.PurchaseOrder;
import com.radius.invoicing.ibatis.model.PurchaseOrderGrd;
import com.radius.invoicing.ordermanage.service.PurchaseOrderService;

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
	
	@Autowired(required=false)
	@Qualifier("purchaseOrderServiceImpl")
	private PurchaseOrderService purchaseOrderService;
	
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
		PurchaseOrder purchaseOrder =new PurchaseOrder();
		purchaseOrder.setPurchaseOrderId(orderId);
		mv.addObject("purchaseOrder", purchaseOrder);
		return mv;
	}
	
	
	/**
	 * 将采购订单商品信息添加到内存中
	 * @param request
	 * @param response
	 * @param purchaseOrderGrd
	 * @return
	 */
	@RequestMapping("/order/manager/purchaseOrder/purchase_product_info_memcached.html")
	@ResponseBody
	public JsonUtils addPurchaseOrderGoodsGrdInfo(HttpServletRequest request,HttpServletResponse response,PurchaseOrderGrd purchaseOrderGrd)throws Exception{
		String key=purchaseOrderGrd.getPurchaseOrderId()+"_purchase_order_add_purchase_product_info";//采购订单编号_purchase_order_add_purchase_product_info
		return purchaseOrderService.addPurchaseOrderGoodsGrd2Memcached(key, purchaseOrderGrd);
	}
	
	/**
	 * 保存采购订单信息
	 * @param request
	 * @param response
	 * @param purchaseOrder
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/order/manager/purchaseOrder/purchase_order_infos_add.html")
	@ResponseBody
	public JsonUtils addPurchaseOrderInfo(HttpServletRequest request,HttpServletResponse response,PurchaseOrder purchaseOrder)throws Exception{
		String ledgerId = "000101";//帐套
		String operator="0001";//当前操作员
		//1.构建采购订单信息
		purchaseOrder.setLedgerId(ledgerId);
		purchaseOrder.setOperator(operator);
		//2.
		String purchaseOrderGrdMemcachedKey=purchaseOrder.getPurchaseOrderId()+"_purchase_order_add_purchase_product_info";
		return purchaseOrderService.savePurchaseOrderInfo(purchaseOrderGrdMemcachedKey, purchaseOrder);
	}
	
	@PreDestroy
	public void destroy(){
		if(purchase_order_view!=null){
			purchase_order_view=null;
		}
	}
}
