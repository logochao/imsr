package com.radius.invoicing.contractmanage.action;

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
import com.radius.invoicing.contractmanage.service.PurchaseContractService;
import com.radius.invoicing.ibatis.model.Goods;
import com.radius.invoicing.ibatis.model.PurchaseContract;
import com.radius.invoicing.ibatis.model.PurchaseContractGoodsGrd;
import com.radius.invoicing.ibatis.model.PurchaseContractPaymentGrd;
import com.radius.invoicing.ibatis.model.PurchaseOrder;
import com.radius.invoicing.ibatis.model.PurchaseOrderGrd;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 采购合同处理
 */
@Controller
@Scope("request")
public class PurchaseContractController extends BaseController{

	private Logger  logger=Logger.getLogger(this.getClass());
	
	private final String prefix="/jsp/contract/purchase/";
	
	private String purchase_view=null;
	
	
	@Autowired(required=false)
	@Qualifier("purchaseContractServiceImpl")
	private PurchaseContractService purchaseContractService;
	
	@PostConstruct
	public void init(){
		if(purchase_view==null){
			purchase_view=prefix+"purchase_contract_index.jsp";
		}
	}
	
	@PreDestroy
	public void destroy(){
		if(purchase_view!=null){
			purchase_view=null;
		}
	}
	
	@RequestMapping("/contract/manager/purchaseContract/purchase_view.html")
	public ModelAndView purchaseContract(HttpServletRequest request,HttpServletResponse response)throws Exception{
		logger.info("进入采购合同管理界面");
		return new ModelAndView(purchase_view);
	}
	
	/**
	 * 初始化采购合同
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/contract/manager/purchaseContract/purchase_contract_init.html")
	@ResponseBody
	public JsonUtils<String> initPurchaseContract(HttpServletRequest request,HttpServletResponse response)throws Exception{
		JsonUtils<String> result=new JsonUtils<String>();
		result.setMessage("初始化采购合同失败....");
		
		result.setChild(StockUtils.getPurchaseContractId());
		result.setMessage("初始化采购合同成功...");
		result.setSuccess(true);
		
		return  result;
	} 
	
	
	/**
	 * 通过商品信息查询采购订单信息
	 * @param request
	 * @param response
	 * @param goods
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/contract/manager/purchaseContract/purchase_order_2_goods.html")
	@ResponseBody
	public EasyuiSplitPager<PurchaseOrder> getPurchaseOrderInfo(HttpServletRequest request,HttpServletResponse response,Goods goods)throws Exception{
		String purchaseOrderId=ServletRequestUtils.getStringParameter(request,"purchaseOrderId","");
		return purchaseContractService.getPurchaseOrderInfon2Goods(goods, purchaseOrderId);
	}
	/**
	 * 添加采购合同商品信息到缓存中
	 * @param request
	 * @param response
	 * @param contractGoodsGrd
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/contract/manager/purchaseContract/contract_product_info_memcached.html")
	@ResponseBody
	public JsonUtils addPurchaseContractGoodsInfo(HttpServletRequest request,HttpServletResponse response,PurchaseContractGoodsGrd contractGoodsGrd)throws Exception{
		String key=contractGoodsGrd.getContractId()+"_purchase_contract_add_contract_product_info";//合同编号_purchase_contract_add_contract_product_info
		return purchaseContractService.addPurchaseContractGoodsGrd2Memcached(key, contractGoodsGrd);
	}
	/**
	 * 移除缓存中的采购商品信息
	 * @param request
	 * @param response
	 * @param contractGoodsGrd
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/contract/manager/purchaseContract/contract_product_info_remove_memcached.html")
	@ResponseBody
	public JsonUtils removePurchaseContractGoodsInfo(HttpServletRequest request,HttpServletResponse response,PurchaseContractGoodsGrd contractGoodsGrd)throws Exception{
		String key=contractGoodsGrd.getContractId()+"_purchase_contract_add_contract_product_info";//合同编号_purchase_contract_add_contract_product_info
		boolean delete = ServletRequestUtils.getBooleanParameter(request, "delete", false);//表示是否全部删除 默认为 false
		return purchaseContractService.removePurchaseContractGoodsGrd2Memcached(key, delete, contractGoodsGrd);
	}
	/**
	 * 通过采购订单号获取采购订单商品信息
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/contract/manager/purchaseContract/purchase_order_goods_2_purchase_order_id.html")
	@ResponseBody
	public EasyuiSplitPager<PurchaseOrderGrd> getPurchaseOrderGoodsInfo(HttpServletRequest request)throws Exception{
		String purchaseOrderId=ServletRequestUtils.getStringParameter(request,"purchaseOrderId","");
		return purchaseContractService.getPurchaseOrderProductInfo(purchaseOrderId);
	}
	/**
	 * 添加采购订单支付详情缓存
	 * @param request
	 * @param response
	 * @param contractPaymentGrd
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/contract/manager/purchaseContract/contract_pay_info_memcached.html")
	@ResponseBody
	public JsonUtils addPurchaseContractPayInfo(HttpServletRequest request,HttpServletResponse response,PurchaseContractPaymentGrd contractPaymentGrd)throws Exception{
		String key = contractPaymentGrd.getContractId()+"_add_purchase_contract_pay_detail";
		return purchaseContractService.addPurchaseContractPaymentGrd2Memcached(key, contractPaymentGrd);
	}
	/**
	 * 移除部分采购订单支付详情缓存
	 * @param request
	 * @param response
	 * @param contractPaymentGrd
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/contract/manager/purchaseContract/contract_pay_info_remove_memcached.html")
	@ResponseBody
	public JsonUtils removePurchaseContractPayInfo(HttpServletRequest request,HttpServletResponse response,PurchaseContractPaymentGrd contractPaymentGrd)throws Exception{
		String key = "";
		return purchaseContractService.removePurchaseContractPaymentGrd2Memcache(key, contractPaymentGrd);
	}
}
