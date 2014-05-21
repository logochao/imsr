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
import com.radius.invoicing.ibatis.model.PurchaseInquiry;
import com.radius.invoicing.ibatis.model.PurchaseInquiryGrd;
import com.radius.invoicing.inquirymanage.service.PurchaseInquiryService;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 采购询价
 */
@Controller
@Scope("request")
@SuppressWarnings("unchecked")
public class PurchaseInquiryController {

private Logger logger=Logger.getLogger(this.getClass());
	
	private final String prefix="/jsp/inquiry/purchase/";
	private String purchase_inquiry_manager_view=null;
	
	@Autowired(required=false)
	@Qualifier("purchaseInquiryServiceImpl")
	private PurchaseInquiryService purchaseInquiryService;
	
	
	@PostConstruct
	public void init(){
		if(purchase_inquiry_manager_view==null){
			purchase_inquiry_manager_view=prefix+"purchase_inquiry_index.jsp";
		}
	}
	@RequestMapping("/inquiry/manager/purchaseInquiry/purchase_inquiry_manage_view.html")
	public ModelAndView salesInquiryManage(){
		return new ModelAndView(purchase_inquiry_manager_view);
	}
	
	
	
	@RequestMapping("/inquiry/manager/purchaseInquiry/purchase_inquiry_info.html")
	@ResponseBody
	public JsonUtils getPurchaseInquiry(HttpServletRequest request,HttpServletResponse response)throws Exception{
		JsonUtils jsonUtils = new JsonUtils();
		jsonUtils.setMessage("获取采购询价编号失败...");
		try{
			String purchaseInquiryId=StockUtils.getPurchaseInquiryId();//获取采购询价单
			jsonUtils.setChild(purchaseInquiryId);
			jsonUtils.setSuccess(true);
			jsonUtils.setMessage("获取采购询价单号成功...");
		}catch(Exception e){
			e.printStackTrace();
			logger.equals(e.toString());
		}
		return jsonUtils;
	}
	
	@RequestMapping("/inquiry/manager/purchaseInquiry/purchase_inquiry_product_info_memcached.html")
	@ResponseBody
	public JsonUtils addPurchaseInquiryGoodsGrd(HttpServletRequest request,HttpServletResponse response,PurchaseInquiryGrd grd)throws Exception {
		String key=grd.getPurchaseInquiryId()+"_purchase_inquiry_add_inquiry_product_info";//编号_purchase_inquiry_add_inquiry_product_info
		JsonUtils result=null;
		try{
			result=purchaseInquiryService.addPurchaseInquiryGrd2Memecached(key, grd);
		}catch(Exception e){
			result=new JsonUtils();
			result.setMessage("缓存采购询价商品信息失败...");
			logger.error(e);
			e.printStackTrace();
		}
		return result;
	}
	@RequestMapping("/inquiry/manager/purchaseInquiry/purchase_inquiry_product_info_remove_memcached.html")
	@ResponseBody
	public JsonUtils removePurchaseInquiryGoodsGrd(HttpServletRequest request,HttpServletResponse response,PurchaseInquiryGrd grd)throws Exception {
		String key=grd.getPurchaseInquiryId()+"_purchase_inquiry_add_inquiry_product_info";//编号_purchase_inquiry_add_inquiry_product_info
		boolean delete = ServletRequestUtils.getBooleanParameter(request, "delete", false);//表示是否全部删除 默认为 false
		JsonUtils result=null;
		try{
			result=purchaseInquiryService.removePurchaseInquiryGrd2Memcached(key, delete, grd);
		}catch(Exception e){
			result=new JsonUtils();
			result.setMessage("移除采购询价商品缓存信息失败...");
			logger.error(e);
			e.printStackTrace();
		}
		return result;
	}
	
	
	@RequestMapping("/inquiry/manager/purchaseInquiry/purchase_inquiry_infos_add.html")
	@ResponseBody
	public JsonUtils addSalesInquiryInfo(HttpServletRequest request,HttpServletResponse response,PurchaseInquiry purchaseInquiry)throws Exception{
		String ledgerId = "000101";//帐套
		String operator="0001";//当前操作员
		purchaseInquiry.setLedgerId(ledgerId);
		purchaseInquiry.setOperator(operator);
		purchaseInquiry.setCreater(operator);
		String key=purchaseInquiry.getPurchaseInquiryId()+"_purchase_inquiry_add_inquiry_product_info";//编号_purchase_inquiry_add_inquiry_product_info
		JsonUtils result=null;
		try{
			String inqueryStatus =ServletRequestUtils.getStringParameter(request, "inqueryStatus","01");//默认状态为询价
			result=purchaseInquiryService.savePurchaseInquiryInfo(purchaseInquiry, key, inqueryStatus);
		}catch(Exception e){
			result=new JsonUtils();
			result.setMessage("保存采购询价失败...");
			logger.error(e);
			e.printStackTrace();
		}
		return result;
	}
	@RequestMapping("/inquiry/manager/purchaseInquiry/purchase_inquiry_info_list.html")
	@ResponseBody
	public EasyuiSplitPager<PurchaseInquiry> getPurchaseInquiryList(HttpServletRequest request,HttpServletResponse response,PurchaseInquiry purchaseInquiry)throws Exception{
		return purchaseInquiryService.getSalesInquiryList(purchaseInquiry);
	}
	
	
	@RequestMapping("/inquiry/manager/purchaseInquiry/purchase_inquiry_goods_2_purchaseinquiryid.html")
	@ResponseBody
	public EasyuiSplitPager<PurchaseInquiryGrd> getPurchaseInquiryGrdList(HttpServletRequest request,HttpServletResponse response){
		String purchaseInquiryId=ServletRequestUtils.getStringParameter(request, "purchaseInquiryId","");
		return purchaseInquiryService.getSalesInquiryGrdList(purchaseInquiryId);
	}
	
	@PreDestroy
	public void destroy(){
		if(purchase_inquiry_manager_view!=null){
			purchase_inquiry_manager_view=null;
		}
	}
}
