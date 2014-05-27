package com.radius.invoicing.quotationmanage.action;

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

import com.radius.base.page.EasyuiSplitPager;
import com.radius.base.utils.JsonUtils;
import com.radius.base.utils.StockUtils;
import com.radius.invoicing.ibatis.model.SalesQuotation;
import com.radius.invoicing.ibatis.model.SalesQuotationGrd;
import com.radius.invoicing.ibatis.model.SupplierGoods;
import com.radius.invoicing.quotationmanage.service.SalesQuotationService;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 销售报价处理
 */
@Controller
@Scope("request")
public class SalesQuotationController {

	private Logger logger=Logger.getLogger(this.getClass());
	
	private final String prefix="/jsp/quotation/sales/";
	private String sales_quotation_manager_view=null;
	
	@Autowired(required=false)
	@Qualifier("salesQuotationServiceImpl")
	private SalesQuotationService salesQuotationService;
	
	@PostConstruct
	public void init(){
		if(sales_quotation_manager_view==null){
			sales_quotation_manager_view=prefix+"quotation_sales_index.jsp";
		}
	}
	/**
	 * 进入管理界面
	 * @return
	 */
	@RequestMapping("/quotation/manager/salesQuotation/quotation_sales_manage_view.html")
	public ModelAndView supplierQuotationManage(){
		return new ModelAndView(sales_quotation_manager_view);
	}
	
	/**
	 * 获取供应商报价信息
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/quotation/manager/salesQuotation/sales_quotation_info.html")
	@ResponseBody
	public JsonUtils<String> getsupplierQuotation(HttpServletRequest request,HttpServletResponse response)throws Exception{
		JsonUtils<String> jsonUtils = new JsonUtils<String>();
		jsonUtils.setMessage("获取销售报价号失败...");
		try{
			String supplierQuotationId=StockUtils.getSalesQuotationId();//获取销售报价单号
			jsonUtils.setChild(supplierQuotationId);
			jsonUtils.setSuccess(true);
			jsonUtils.setMessage("获取销售报价单号成功...");
		}catch(Exception e){
			e.printStackTrace();
			logger.equals(e.toString());
		}
		return jsonUtils;
	}
	
	@RequestMapping("/quotation/manager/salesQuotation/sales_quotation_product_info_memcached.html")
	@ResponseBody
	public JsonUtils addSupplierQuotationGrd(HttpServletRequest request,HttpServletResponse response,SalesQuotationGrd grd)throws Exception{
		String key=grd.getSalesQuotationId()+"_sales_quotation_add_quotation_product_info";//编号_sales_quotation_add_quotation_product_info
		JsonUtils result=null;
		try{
			result=salesQuotationService.addSalesQuotationGrd2Memcached(key, grd);
		}catch(Exception e){
			result=new JsonUtils();
			result.setMessage("缓存销售报价商品信息失败...");
			logger.error(e);
			e.printStackTrace();
		}
		return result;
	}
	@RequestMapping("/quotation/manager/salesQuotation/sales_quotation_product_info_remove_memcached.html")
	@ResponseBody
	public JsonUtils romveSupplierQuotationGrd(HttpServletRequest request,HttpServletResponse response,SalesQuotationGrd grd)throws Exception{
		String key=grd.getSalesQuotationId()+"_sales_quotation_add_quotation_product_info";//编号_sales_quotation_add_quotation_product_info
		boolean delete = ServletRequestUtils.getBooleanParameter(request, "delete", false);//表示是否全部删除 默认为 false
		JsonUtils result=null;
		try{
			result=salesQuotationService.removeSalesQuotationGrd2Memecached(key, delete, grd);
		}catch(Exception e){
			result=new JsonUtils();
			result.setMessage("移除销售报价商品缓存信息失败...");
			logger.error(e);
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping("/quotation/manager/salesQuotation/sales_quotation_infos_add.html")
	@ResponseBody
	public JsonUtils addSupplierQuotationInfo(HttpServletRequest request,HttpServletResponse response,SalesQuotation salesQuotation)throws Exception{
		
		String ledgerId = "000101";//帐套
		String operator="0001";//当前操作员
		salesQuotation.setLedgerId(ledgerId);
		salesQuotation.setOperator(operator);
		salesQuotation.setCreater(operator);
		String key=salesQuotation.getSalesQuotationId()+"_sales_quotation_add_quotation_product_info";//编号_sales_quotation_add_quotation_product_info
		JsonUtils result=null;
		try{
			result=salesQuotationService.saveSalesQuotationInfo(key, salesQuotation);
		}catch(Exception e){
			result=new JsonUtils();
			result.setMessage("保存销售报价失败...");
			logger.error(e);
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping("/quotation/manager/salesQuotation/sales_quotation_info_list.html")
	@ResponseBody
	public EasyuiSplitPager<SalesQuotation> getPurchaseInquiryList(HttpServletRequest request,HttpServletResponse response,SalesQuotation salesQuotation)throws Exception{
		return salesQuotationService.getSalesQuotationList(salesQuotation);
	}
	
	
	@RequestMapping("/quotation/manager/salesQuotation/sales_quotation_goods_2_salesquotationid.html")
	@ResponseBody
	public EasyuiSplitPager<SalesQuotationGrd> getPurchaseInquiryGrdList(HttpServletRequest request,HttpServletResponse response){
		String salesQuotationId=ServletRequestUtils.getStringParameter(request, "salesQuotationId","");
		return salesQuotationService.getSalesQuotationGrd(salesQuotationId);
	}
	
	@RequestMapping("/quotation/manager/salesQuotation/supplier_goods_list.html")
	@ResponseBody
	public EasyuiSplitPager<SupplierGoods> getSupplierGoodsList(HttpServletRequest request,HttpServletResponse response,SupplierGoods supplierGoods)throws Exception{
		return salesQuotationService.getSupplierGoodsList(supplierGoods);
	}
	
	@PreDestroy
	public void destroy(){
		if(sales_quotation_manager_view!=null){
			sales_quotation_manager_view=null;
		}
	}
}
