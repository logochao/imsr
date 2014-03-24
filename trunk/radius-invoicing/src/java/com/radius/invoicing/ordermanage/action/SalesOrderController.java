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
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.radius.base.controller.BaseController;
import com.radius.base.page.EasyuiSplitPager;
import com.radius.base.utils.JsonUtils;
import com.radius.base.utils.StockUtils;
import com.radius.invoicing.ibatis.model.Goods;
import com.radius.invoicing.ibatis.model.SalesOrder;
import com.radius.invoicing.ibatis.model.SalesOrderGoodsGrd;
import com.radius.invoicing.ordermanage.service.SalesOrderService;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 销售订单处理
 */
@Controller
@Scope("request")
public class SalesOrderController extends BaseController {

//	private Logger  logger=Logger.getLogger(this.getClass());
	
	private final String prefix="/jsp/order/sales/";
	
	private String sales_order_view=null; //销售订单视图
	
	@Autowired(required=false)
	@Qualifier("salesOrderServiceImpl")
	private SalesOrderService salesOrderService;
	
	
	@PostConstruct
	public void init(){
		if(sales_order_view==null){
			sales_order_view=prefix+"sales_order_index.jsp";
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
	/**
	 * 将销售订单商品列表添加memcached
	 * @param request
	 * @param response
	 * @param goodsGrd
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/order/manager/salesorder/order_product_info_memcached.html")
	@ResponseBody
	public JsonUtils addSalesOrderGoodsGrdInfo(HttpServletRequest request,HttpServletResponse response,SalesOrderGoodsGrd goodsGrd)throws Exception{
		String key=goodsGrd.getOrderId()+"_sales_order_add_order_product_info";//合同编号_sales_order_add_order_product_info
		return salesOrderService.addSalesOrderGoodsGrd2Memcached(key, goodsGrd);
	}
	/**
	 * 将memcached中的销售订单对应商品列表移除
	 * @param request
	 * @param response
	 * @param goodsGrd
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/order/manager/salesorder/order_product_info_remove_memcached.html")
	@ResponseBody
	public JsonUtils removeSalesOrderGoodsGrdInfo(HttpServletRequest request,HttpServletResponse response,SalesOrderGoodsGrd goodsGrd)throws Exception{
		String key=goodsGrd.getOrderId()+"_sales_order_add_order_product_info";//合同编号_sales_order_add_order_product_info
		boolean delete = ServletRequestUtils.getBooleanParameter(request, "delete", false);//表示是否全部删除 默认为 false
		return salesOrderService.removeSalesOrderGoodsGrd2Memcached(key,delete,goodsGrd);
	}
	
	/**
	 * 添加销售订单信息
	 * @param request
	 * @param response
	 * @param salesOrder
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/order/manager/salesorder/sales_order_infos_add.html")
	@ResponseBody
	public JsonUtils addSalesOrderInfos(HttpServletRequest request,HttpServletResponse response,SalesOrder salesOrder)throws Exception{
		String ledgerId = "000101";//帐套
		String operator="0001";//当前操作员
		//1.构建销售订单
		salesOrder.setLedgerId(ledgerId);
		salesOrder.setCreater(operator);
		//2.构建销售订单商品信息列表
		String salesOrderGoodsGrdMemcachedkey=salesOrder.getSalesOrderId()+"_sales_order_add_order_product_info";//合同编号_sales_order_add_order_product_info
		return salesOrderService.saveSalesOrderInfos(ledgerId, salesOrder, salesOrderGoodsGrdMemcachedkey, ServletRequestUtils.getStringParameter(request,"salesContractId"));
	}
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	
	public EasyuiSplitPager<SalesOrder> getSalesOrderInfoList(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String supplierId=ServletRequestUtils.getStringParameter(request,"supplierId");//获取供应商编号
		String customerName=ServletRequestUtils.getStringParameter(request,"customerName");//获取客户名称
		return salesOrderService.getSalesOrder(new Object[]{supplierId,customerName});
	}
	 */
	
	/**
	 * 通过供应商编号+商品信息获取销售订单列表
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/order/manager/salesorder/sales_order_2_goods.html")
	@ResponseBody
	public EasyuiSplitPager<SalesOrder> getSalesOrderInfoList(HttpServletRequest request,HttpServletResponse response,Goods goods)throws Exception{
		String salesOrderId=ServletRequestUtils.getStringParameter(request,"salesOrderId","");
		return salesOrderService.getSalesOrder(goods,salesOrderId);
	}
	
	/**
	 * 通过销售订单号获取销售订单商品列表
	 * @param request
	 * @param response
	 * @param goodsGrd
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/order/manager/salesorder/sales_order_goods_2_salesorderid.html")
	@ResponseBody
	public EasyuiSplitPager<SalesOrderGoodsGrd> getSalesOrderGoodsInfoList(HttpServletRequest request,HttpServletResponse response,SalesOrderGoodsGrd goodsGrd)throws Exception{
		return salesOrderService.getSalesOrderGoodsGrdByGoodsGrd(goodsGrd);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@PreDestroy
	public void destroy(){
		if(sales_order_view!=null){
			sales_order_view=null;
		}
	}
}
