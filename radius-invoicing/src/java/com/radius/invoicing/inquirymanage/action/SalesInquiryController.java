package com.radius.invoicing.inquirymanage.action;

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
import com.radius.invoicing.ibatis.model.SalesInquiry;
import com.radius.invoicing.ibatis.model.SalesInquiryGrd;
import com.radius.invoicing.inquirymanage.service.SalesInquiryService;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 客户询价处理(销售询价)
 */
@Controller
@Scope("request")
public class SalesInquiryController {

	private Logger logger=Logger.getLogger(this.getClass());
	
	private final String prefix="/jsp/inquiry/customer/";
	private String sales_inquiry_manager_view=null;
	
	
	@Autowired(required=false)
	@Qualifier("salesInquiryServiceImpl")
	private SalesInquiryService salesInquiryService;
	
	@PostConstruct
	public void init(){
		if(sales_inquiry_manager_view==null){
			sales_inquiry_manager_view=prefix+"customer_inquiry_index.jsp";
		}
	}
	
	@RequestMapping("/inquiry/manager/salesInquiry/customer_inquiry_manage_view.html")
	public ModelAndView salesInquiryManage(){
		return new ModelAndView(sales_inquiry_manager_view);
	}
	
	@RequestMapping("/inquiry/manager/salesInquiry/customer_inquiry_info.html")
	@ResponseBody
	public JsonUtils getSalesInquiry(HttpServletRequest request,HttpServletResponse response)throws Exception{
		JsonUtils jsonUtils = new JsonUtils();
		jsonUtils.setMessage("获取客户询价编号失败...");
		try{
			String salesInquiryId = StockUtils.getSalesInquiryId();
			jsonUtils.setChild(salesInquiryId);
			jsonUtils.setSuccess(true);
		}catch(Exception e){
			e.printStackTrace();
			logger.error(e);
		}
		return jsonUtils;
	}
	
	
	@RequestMapping("/inquiry/manager/salesInquiry/customer_inquiry_product_info_memcached.html")
	@ResponseBody
	public JsonUtils addSalesInquiryGoodsGrd(HttpServletRequest request,HttpServletResponse response,SalesInquiryGrd salesInquiryGrd)throws Exception{
		String key=salesInquiryGrd.getSalesInquiryId()+"_customer_inquiry_add_inquiry_product_info";//编号_customer_inquiry_add_inquiry_product_info
		JsonUtils result=null;
		try{
			result=salesInquiryService.addSalesInquiryGrd2Memcached(key, salesInquiryGrd);
		}catch(Exception e){
			result=new JsonUtils();
			result.setMessage("缓存客户询价商品新型失败...");
			logger.error(e);
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping("/inquiry/manager/salesInquiry/customer_inquiry_product_info_remove_memcached.html")
	@ResponseBody
	public JsonUtils removeSalesInquiryGoodsGrd(HttpServletRequest request,HttpServletResponse response,SalesInquiryGrd salesInquiryGrd)throws Exception{
		String key=salesInquiryGrd.getSalesInquiryId()+"_customer_inquiry_add_inquiry_product_info";//编号_customer_inquiry_add_inquiry_product_info
		boolean delete = ServletRequestUtils.getBooleanParameter(request, "delete", false);//表示是否全部删除 默认为 false
		JsonUtils result=null;
		try{
			result=salesInquiryService.removeSalesInquiryGrd2Memcached(key, delete, salesInquiryGrd);
		}catch(Exception e){
			result=new JsonUtils();
			result.setMessage("移除缓存客户询价商品失败...");
			logger.error(e);
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping("/inquiry/manager/salesInquiry/customer_inquiry_infos_add.html")
	@ResponseBody
	public JsonUtils addSalesInquiryInfo(HttpServletRequest request,HttpServletResponse response,SalesInquiry salesInquiry)throws Exception{
		String ledgerId = "000101";//帐套
		String operator="0001";//当前操作员
		salesInquiry.setLedgerId(ledgerId);
		salesInquiry.setOperator(operator);
		salesInquiry.setCreater(operator);
		String key=salesInquiry.getSalesInquiryId()+"_customer_inquiry_add_inquiry_product_info";//编号_customer_inquiry_add_inquiry_product_info
		JsonUtils result=null;
		try{
			String inqueryStatus =ServletRequestUtils.getStringParameter(request, "inqueryStatus","01");//默认状态为询价
			result=salesInquiryService.saveSalesInquiryInfo(salesInquiry, key,inqueryStatus);
		}catch(Exception e){
			result=new JsonUtils();
			result.setMessage("保存客户询价失败...");
			logger.error(e);
			e.printStackTrace();
		}
		return result;
	}
	@RequestMapping("/inquiry/manager/salesInquiry/customer_inquiry_info_list.html")
	@ResponseBody
	public EasyuiSplitPager<SalesInquiry> getSalesInquiryList(HttpServletRequest request,HttpServletResponse response,SalesInquiry salesInquiry)throws Exception{
		return salesInquiryService.getSalesInquiryList(salesInquiry);
	}
	@RequestMapping("/inquiry/manager/salesInquiry/customer_inquiry_goods_2_salesinquiryid.html")
	@ResponseBody
	public EasyuiSplitPager<SalesInquiryGrd> getSalesInquiryGrdList(HttpServletRequest request,HttpServletResponse response){
		String salesInquiryId=ServletRequestUtils.getStringParameter(request, "salesInquiryId","");
		return salesInquiryService.getSalesInquiryGrdList(salesInquiryId);
	}
	
	@PreDestroy
	public void destroy(){
		if(sales_inquiry_manager_view!=null){
			sales_inquiry_manager_view=null;
		}
	}
}
