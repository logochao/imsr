/**
 * 
 */
package com.radius.invoicing.contractmanage.action;


import java.util.List;

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
import com.radius.invoicing.contractmanage.compent.SalesContractCom;
import com.radius.invoicing.contractmanage.service.SalesContractService;
import com.radius.invoicing.enums.ContractTypeEnums;
import com.radius.invoicing.enums.StatusEnums;
import com.radius.invoicing.ibatis.model.ContractScanGrd;
import com.radius.invoicing.ibatis.model.SalesContract;
import com.radius.invoicing.ibatis.model.SalesContractGoodsGrd;
import com.radius.invoicing.ibatis.model.SalesContractPayment;
import com.radius.invoicing.ibatis.model.SalesContractPaymentGrd;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 销售合同处理
 */
@Controller
@Scope("request")
public class SalesContractController extends BaseController{

	private Logger  logger=Logger.getLogger(this.getClass());
	
	private final String prefix="/jsp/contract/sales/";
	
	private String sales_view=null;
	
	
	@PostConstruct
	public void init(){
		if(sales_view==null){
			sales_view=prefix+"contract_sales_index.jsp";
		}
	}
	
	@PreDestroy
	public void destroy(){
		if(sales_view!=null){
			sales_view=null;
		}
	}
	
	@Autowired(required=false)
	@Qualifier("salesContractServiceImpl")
	private  SalesContractService contractService; 
	
	
	
	@RequestMapping(value={"/contract/manager/sales_view.html"})
	public ModelAndView salesContract(HttpServletRequest request,HttpServletResponse response)throws Exception{
		logger.info("进入销售合同管理界面");
		//SalesContract salesContract=new SalesContract();
		//salesContract.setId(StockUtils.getSalesContractId());//设置销售合同编号
		
		ModelAndView mv = new ModelAndView(sales_view); 
		//mv.addObject("salesContract", salesContract);
		return mv;
	}
	
	
	@RequestMapping("/contract/manager/salescontract/get_sales_contract_info.html")
	@ResponseBody
	public JsonUtils getSalesContractInfo(HttpServletRequest request,HttpServletResponse response,SalesContract salesContract)throws Exception{
		JsonUtils<SalesContract> jsonUtils =new JsonUtils<SalesContract>();
		salesContract.setId(StockUtils.getSalesContractId());
		jsonUtils.setChild(salesContract);
		jsonUtils.setSuccess(true);
		jsonUtils.setMessage("获取销售合同信息成功...");
		return jsonUtils;
	}
	
	@RequestMapping("/contract/manager/sales_status_json.html")
	public void getStatusInfoJson(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String json=StatusEnums.getStatusEnumsJson();
		super.ajaxMethod(response, json, "获取状态枚举json对象发生异常");
	}
	@RequestMapping("/contract/manager/sales_contract_type_json.html")
	public void getContractTypeJson(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String json=ContractTypeEnums.getContractTypeEnumsJson();
		super.ajaxMethod(response, json, "获取合同类型枚举json对象发生异常");
	}
	
	
	
	/**
	 * 将内容添加到memcache中
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/contract/manager/sales_contract_pay_detail_memcache.html")
	@ResponseBody
	public JsonUtils addSalesContractPayDetail2Memcache(HttpServletRequest request,HttpServletResponse response,SalesContractPaymentGrd contractPaymentGrd)throws Exception{
		//将缓存到内存中
		contractService.addObject2MemcacheByPayDetail(contractPaymentGrd.getContractId()+"_add_sales_contract_pay_detail", contractPaymentGrd);
		return new JsonUtils(true,"销售合同支付明细保存内存成功....");
	}
	
	/**
	 * 删除memcach中存在的数据
	 * @param request
	 * @param response
	 * @param contractPaymentGrd
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/contract/manager/sales_contract_pay_detail_remove_memcache.html")
	@ResponseBody
	public JsonUtils removeSaleContractPayDetail2Memcache(HttpServletRequest request,HttpServletResponse response,SalesContractPaymentGrd contractPaymentGrd)throws Exception{
		//将缓存对象进行删除
		boolean delete = ServletRequestUtils.getBooleanParameter(request, "delete", false);//表示是否全部删除 默认为 false
		return contractService.removeObject2MemcacheByPayDetail(contractPaymentGrd.getContractId()+"_add_sales_contract_pay_detail", contractPaymentGrd,delete);
	}
	/**
	 * 将销售合同商品添加到内存里
	 * @param request
	 * @param response
	 * @param contractPaymentGrd
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value={"/contract/manager/sales_contract_product_info_memcache.html","/contract/manager/salescontract/sales_contract_product_info_memcache.html"})
	@ResponseBody
	public JsonUtils addSalesContractProductInfo2Memcache(HttpServletRequest request,HttpServletResponse response,SalesContractGoodsGrd goods)throws Exception{
		//将销售合同商品添加到内存中
		return contractService.addSalesContractProductInfo2Memcache(goods.getContractId()+"_add_sales_contract_proudct_info", goods);
	}
	
	/**
	 * 删除memcache中销售合同中的商品信息
	 * @param request
	 * @param response
	 * @param contractPaymentGrd
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value={"/contract/manager/sales_contract_product_info_remove_memcache.html","/contract/manager/salescontract/sales_contract_product_info_remove_memcache.html"})
	@ResponseBody
	public JsonUtils removeSaleContractProductInfo2Memcache(HttpServletRequest request,HttpServletResponse response,SalesContractGoodsGrd goods)throws Exception{
		boolean delete = ServletRequestUtils.getBooleanParameter(request, "delete", false);//表示是否全部删除 默认为 false
		return contractService.removeSalesContractProductInfo2Memcache(goods.getContractId()+"_add_sales_contract_proudct_info", goods,delete);
	}
	
	/**
	 * 将销售合同扫描件添加到memcache中
	 * @param request
	 * @param response
	 * @param goods
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/contract/manager/salescontract/contract_scan_info_memcache.html")
	@ResponseBody
	public JsonUtils addContractScanInfo2Memcache(HttpServletRequest request,HttpServletResponse response,ContractScanGrd scan)throws Exception{
		String key =scan.getContractId()+"_add_contract_scan_info";//合同编号_合同类型_xxxxxxxx
		return contractService.addContractScanInfo2Memcache(key, scan);
	}
	/**
	 * 将合同扫描件移除memcache中
	 * @param request
	 * @param response
	 * @param goods
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/contract/manager/salescontract/contract_scan_info_remove_memcache.html")
	@ResponseBody
	public JsonUtils removeContractScanInfo2Memcache(HttpServletRequest request,HttpServletResponse response,ContractScanGrd scan)throws Exception{
		String key =scan.getContractId()+"_add_contract_scan_info";//合同编号_合同类型_xxxxxxxx
		boolean delete = ServletRequestUtils.getBooleanParameter(request, "delete", false);//表示是否全部删除 默认为 false
		return contractService.removeContractScanInfo2Memcache(key, scan,delete);
	}
	
	/**
	 * 保存销售合同相关信息
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/contract/manager/salescontract/sale_contract_infos_add.html")
	@ResponseBody
	public JsonUtils  addSaleContractInfos(HttpServletRequest request,HttpServletResponse response,SalesContract salesContract)throws Exception{
		String ledgerId="00000001";
		String creater ="0001";
		salesContract.setLedgerId(ledgerId);
		salesContract.setCreater(creater);
		//1.构建对象
		String goodsMemcacheKey=salesContract.getId()+"_add_sales_contract_proudct_info";
		//销售合同商品
		//合同支付
		SalesContractPayment payment = SalesContractCom.getSalesContractPaymentByRequest(ledgerId,request, salesContract.getId(),creater);
		//合同支付列表
		String paymentMemcacheKey=salesContract.getId()+"_add_sales_contract_pay_detail";
		//保函条款
		List<SalesContractPaymentGrd> guaranteePaymentList = SalesContractCom.getSalesContractGuaranteePaymentGrd(request, salesContract);
		//合同扫描件列表
		String scansMemecacheKey = salesContract.getId()+"_add_contract_scan_info";//合同编号_合同类型_xxxxxxxx
		//2.保存相关对象
		JsonUtils result=null;
		try{
			result=contractService.saveSalesContractInfos(ledgerId,salesContract, goodsMemcacheKey, paymentMemcacheKey, scansMemecacheKey, payment,guaranteePaymentList);
		}catch(Exception e){
			logger.error(e);
			e.printStackTrace();
		}
		return result==null? new JsonUtils(false,"操作失败"):result;
	}
	
	/**
	 * 通过客户信息获取销售合同信息
	 * @param request
	 * @param response
	 * @param salesContract
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/contract/manager/salescontract/sales_contract_info_by_customer.html")
	@ResponseBody
	public EasyuiSplitPager<SalesContract>  getSalesContract(HttpServletRequest request,HttpServletResponse response,SalesContract salesContract)throws Exception{
//		String customerId=ServletRequestUtils.getStringParameter(request, "customerId", "0");//获取客户编号 默认为0
		return contractService.getSalesContractByCustomerId(salesContract);
	}
	
	/**
	 * 通过合同编号获取销售商品信息列表
	 * @param request
	 * @param response
	 * @param salesContractGoodsGrd
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/contract/manager/salescontract/sales_contract_goods_grd_by_contract_id.html")
	@ResponseBody
	public EasyuiSplitPager<SalesContractGoodsGrd> getSalesContractGoodsGrd(HttpServletRequest request,HttpServletResponse response,SalesContractGoodsGrd salesContractGoodsGrd)throws Exception{
		return contractService.getSalesContractGoodsGrd(salesContractGoodsGrd);
	}
	
	@RequestMapping("/contract/manager/salescontract/sales_contract_info_list.html")
	@ResponseBody
	public EasyuiSplitPager<SalesContract> getSalesContractInfoList(HttpServletRequest request,HttpServletResponse response,SalesContract contract){
		return contractService.getSalesContractInfoList(contract);
	}
	/**
	 * 获取销售合同支付
	 * @param request
	 * @param response
	 * @param salesContractPayment
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/contract/manager/salescontract/sales_contract_payment_list.html")
	@ResponseBody
	public EasyuiSplitPager<SalesContractPayment> getSalesContractPayment(HttpServletRequest request,HttpServletResponse response,SalesContractPayment salesContractPayment)throws Exception{
		return contractService.getSalesContractPayment(salesContractPayment);
	}
	
	/**
	 * 获取销售合同支付明细
	 * @param request
	 * @param response
	 * @param salesContractPaymentGrd
	 * @return
	 */
	@RequestMapping("/contract/manager/salescontract/sales_contract_payment_grd_list.html")
	@ResponseBody
	public EasyuiSplitPager<SalesContractPaymentGrd> getSalesContractPaymentGrd(HttpServletRequest request,HttpServletResponse response,SalesContractPaymentGrd salesContractPaymentGrd)throws Exception{
		return contractService.getSalesContractPaymentGrd(salesContractPaymentGrd);
	}
	
	/**
	 * 获取销售合同扫描件
	 * @param request
	 * @param response
	 * @param contractScanGrd
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/contract/manager/salescontract/contract_scan_list.html")
	@ResponseBody
	public EasyuiSplitPager<ContractScanGrd> getContractScanGrd(HttpServletRequest request,HttpServletResponse response,ContractScanGrd contractScanGrd)throws Exception{
		return contractService.getContractScanGrd(contractScanGrd);
	}
}
