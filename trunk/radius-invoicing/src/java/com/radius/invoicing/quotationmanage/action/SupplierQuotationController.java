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
import com.radius.invoicing.ibatis.model.SupplierQuotation;
import com.radius.invoicing.ibatis.model.SupplierQuotationGrd;
import com.radius.invoicing.quotationmanage.service.SupplierQuotationService;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
@Controller
@Scope("request")
public class SupplierQuotationController {

	private Logger logger=Logger.getLogger(this.getClass());
	private final String prefix="/jsp/quotation/supplier/";
	private String supplier_quotation_manager_view=null;
	
	@Autowired(required=false)
	@Qualifier("supplierQuotationServiceImpl")
	private SupplierQuotationService supplierQuotationService;
	
	@PostConstruct
	public void init(){
		if(supplier_quotation_manager_view==null){
			supplier_quotation_manager_view=prefix+"quotation_supplier_index.jsp";
		}
	}
	/**
	 * 进入管理界面
	 * @return
	 */
	@RequestMapping("/quotation/manager/supplierQuotation/quotation_supplier_manage_view.html")
	public ModelAndView supplierQuotationManage(){
		return new ModelAndView(supplier_quotation_manager_view);
	}
	
	/**
	 * 获取供应商报价信息
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/quotation/manager/supplierQuotation/supplier_quotation_info.html")
	@ResponseBody
	public JsonUtils<String> getsupplierQuotation(HttpServletRequest request,HttpServletResponse response)throws Exception{
		JsonUtils<String> jsonUtils = new JsonUtils<String>();
		jsonUtils.setMessage("获取采购报价号失败...");
		try{
			String supplierQuotationId=StockUtils.getSupplierQuotationId();//获取供应商报价单号
			jsonUtils.setChild(supplierQuotationId);
			jsonUtils.setSuccess(true);
			jsonUtils.setMessage("获取采购报价单号成功...");
		}catch(Exception e){
			e.printStackTrace();
			logger.equals(e.toString());
		}
		return jsonUtils;
	}
	@RequestMapping("/quotation/manager/supplierQuotation/supplier_quotation_product_info_memcached.html")
	@ResponseBody
	public JsonUtils addSupplierQuotationGrd(HttpServletRequest request,HttpServletResponse response,SupplierQuotationGrd grd)throws Exception{
		String key=grd.getQuotationId()+"_supplier_quotation_add_quotation_product_info";//编号_supplier_quotation_add_quotation_product_info
		JsonUtils result=null;
		try{
			result=supplierQuotationService.addSupplierQuotationGrd2Memcached(key, grd);
		}catch(Exception e){
			result=new JsonUtils();
			result.setMessage("缓存供应商报价商品信息失败...");
			logger.error(e);
			e.printStackTrace();
		}
		return result;
	}
	@RequestMapping("/quotation/manager/supplierQuotation/supplier_quotation_product_info_remove_memcached.html")
	@ResponseBody
	public JsonUtils romveSupplierQuotationGrd(HttpServletRequest request,HttpServletResponse response,SupplierQuotationGrd grd)throws Exception{
		String key=grd.getQuotationId()+"_supplier_quotation_add_quotation_product_info";//编号_supplier_quotation_add_quotation_product_info
		boolean delete = ServletRequestUtils.getBooleanParameter(request, "delete", false);//表示是否全部删除 默认为 false
		JsonUtils result=null;
		try{
			result=supplierQuotationService.removeSupplierQuotationGrd2Memecached(key, delete, grd);
		}catch(Exception e){
			result=new JsonUtils();
			result.setMessage("移除供应商报价商品缓存信息失败...");
			logger.error(e);
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping("/quotation/manager/supplierQuotation/supplier_quotation_infos_add.html")
	@ResponseBody
	public JsonUtils addSupplierQuotationInfo(HttpServletRequest request,HttpServletResponse response,SupplierQuotation supplierQuotation)throws Exception{
		
		String ledgerId = "000101";//帐套
		String operator="0001";//当前操作员
		supplierQuotation.setLedgerId(ledgerId);
		supplierQuotation.setOperator(operator);
		supplierQuotation.setCreater(operator);
		String key=supplierQuotation.getSupplierQuotationId()+"_supplier_quotation_add_quotation_product_info";//编号_purchase_inquiry_add_inquiry_product_info
		JsonUtils result=null;
		try{
			result=supplierQuotationService.saveSupplierQuotationInfo(key, supplierQuotation);
		}catch(Exception e){
			result=new JsonUtils();
			result.setMessage("保存供应商报价失败...");
			logger.error(e);
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping("/quotation/manager/supplierQuotation/supplier_quotation_info_list.html")
	@ResponseBody
	public EasyuiSplitPager<SupplierQuotation> getPurchaseInquiryList(HttpServletRequest request,HttpServletResponse response,SupplierQuotation supplierQuotation)throws Exception{
		return supplierQuotationService.getSupplierQuotationList(supplierQuotation);
	}
	
	
	@RequestMapping("/quotation/manager/supplierQuotation/supplier_quotation_goods_2_supplierquotationid.html")
	@ResponseBody
	public EasyuiSplitPager<SupplierQuotationGrd> getPurchaseInquiryGrdList(HttpServletRequest request,HttpServletResponse response){
		String supplierQuotationId=ServletRequestUtils.getStringParameter(request, "supplierQuotationId","");
		return supplierQuotationService.getSupplierQuotationGrd(supplierQuotationId);
	}
	
	@PreDestroy
	public void destory(){
		if(supplier_quotation_manager_view!=null){
			supplier_quotation_manager_view=null;
		}
	}
}
