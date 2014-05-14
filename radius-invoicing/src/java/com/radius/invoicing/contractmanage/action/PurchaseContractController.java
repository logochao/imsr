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
import com.radius.invoicing.contractmanage.compent.PurchaseContractCompent;
import com.radius.invoicing.contractmanage.service.PurchaseContractService;
import com.radius.invoicing.ibatis.model.ContractScanGrd;
import com.radius.invoicing.ibatis.model.Goods;
import com.radius.invoicing.ibatis.model.PurchaseContract;
import com.radius.invoicing.ibatis.model.PurchaseContractGoodsGrd;
import com.radius.invoicing.ibatis.model.PurchaseContractPayment;
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
		return purchaseContractService.getPurchaseOrderList(goods, purchaseOrderId);
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
		String key = contractPaymentGrd.getContractId()+"_add_purchase_contract_pay_detail";
		boolean delete = ServletRequestUtils.getBooleanParameter(request, "delete", false);//表示是否全部删除 默认为 false
		return purchaseContractService.removePurchaseContractPaymentGrd2Memcache(key, contractPaymentGrd,delete);
	}
	
	/**
	 * 添加采购合同扫描件缓存
	 * @param request
	 * @param response
	 * @param contractScanGrd
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/contract/manager/purchaseContract/contract_scan_info_memcached.html")
	@ResponseBody
	public JsonUtils addPurchaseContractScanInfo(HttpServletRequest request,HttpServletResponse response,ContractScanGrd contractScanGrd)throws Exception{
		String key =contractScanGrd.getContractId()+"_"+contractScanGrd.getContractType().intValue()+"_add_contract_scan_info";//合同编号_合同类型_xxxxxxxx
		return purchaseContractService.addPurchaseContractScanGrd2Memcached(key, contractScanGrd);
	}
	
	/**
	 * 移除缓存中的合同扫描件
	 * @param request
	 * @param response
	 * @param contractScanGrd
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/contract/manager/purchaseContract/contract_scan_info_remove_memcached.html")
	public JsonUtils removePurchaseContractScanInfo(HttpServletRequest request,HttpServletResponse response,ContractScanGrd contractScanGrd)throws Exception{
		String key =contractScanGrd.getContractId()+"_"+contractScanGrd.getContractType().intValue()+"_add_contract_scan_info";//合同编号_合同类型_xxxxxxxx
		boolean delete = ServletRequestUtils.getBooleanParameter(request, "delete", false);//表示是否全部删除 默认为 false
		return purchaseContractService.removeContractScanInfo2Memcache(key, contractScanGrd, delete);
	}
	
	
	/**
	 * 保存采购合同信息
	 * @param request
	 * @param response
	 * @param purchaseContract
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/contract/manager/purchaseContract/purchase_contract_infos_add.html")
	@ResponseBody
	public JsonUtils savePurchaseContractInfo(HttpServletRequest request,HttpServletResponse response,PurchaseContract purchaseContract)throws Exception{
		String ledgerId ="0001";//帐套
		String operator ="0001";//当前操作人员编号
		purchaseContract.setLedgerId(ledgerId);
		purchaseContract.setCreater(operator);
		
		//1.采购商品信息缓存key
		String productKey=purchaseContract.getId()+"_purchase_contract_add_contract_product_info";
		//2.采购支付详情缓存key
		String payDetailKey=purchaseContract.getId()+"_add_purchase_contract_pay_detail";
		//3.采购合同扫描缓存key
		String scanKey=purchaseContract.getId()+ServletRequestUtils.getStringParameter(request, "contractType","")+"_add_contract_scan_info";
		//4.构建支付对象
		PurchaseContractPayment payment =PurchaseContractCompent.getPurchaseContractPaymentByRequest(request, ledgerId, operator, purchaseContract.getId()) ;
		//5.获取当前操作的合同目标状态 如未确认-->确认 statusCode 为确认状态代码
		String statusCode = ServletRequestUtils.getStringParameter(request, "statusCode", "");
		return purchaseContractService.savePurchaseContractInfo(statusCode, purchaseContract, payment, productKey, payDetailKey, scanKey);
	}
	/**
	 * 获取采购合同信息
	 * @param request
	 * @param response
	 * @param purchaseContract
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/contract/manager/purchaseContract/purchase_contract_info_list.html")
	@ResponseBody
	public EasyuiSplitPager<PurchaseContract> getPurchaseOrderList(HttpServletRequest request,HttpServletResponse response,PurchaseContract purchaseContract)throws Exception{
		return purchaseContractService.getPurchaseContract(purchaseContract);
	}
	
	@RequestMapping("/contract/manager/purchaseContract/purchase_order_goods_list.html")
	@ResponseBody
	public EasyuiSplitPager<PurchaseOrderGrd> getPurchaseOrderGrdList(HttpServletRequest request,HttpServletResponse response)throws Exception{
		PurchaseOrderGrd purchaseOrderGrd=new PurchaseOrderGrd();
		String purchaseOrderId =  ServletRequestUtils.getStringParameter(request, "purchaseOrderId", "");
		purchaseOrderGrd.setPurchaseOrderId(purchaseOrderId);
		
		return purchaseContractService.getPurchaseOrderGrdList(purchaseOrderGrd);
	}
}
