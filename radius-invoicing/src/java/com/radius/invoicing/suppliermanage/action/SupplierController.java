package com.radius.invoicing.suppliermanage.action;

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
import com.radius.invoicing.ibatis.model.LinkMan;
import com.radius.invoicing.ibatis.model.Supplier;
import com.radius.invoicing.suppliermanage.service.SupplierService;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 供应商处理
 */
@Controller
@Scope("request")
public class SupplierController extends BaseController {

	
	private final String prefix="/jsp/business/supplier/";
	
	private String supplier_manager_view= null;//客户信息管理界面
//	private Logger logger=Logger.getLogger(this.getClass());
	
	@Autowired(required=false)
	@Qualifier("supplierServiceImpl")
	private SupplierService supplierService;
	
	
	@PostConstruct
	public void init(){
		if(supplier_manager_view==null){
			supplier_manager_view=prefix+"business_supplier_index.jsp";
		}
	}
	
	/**
	 * 获取供应商信息列表
	 * @param request
	 * @param response
	 * @param supplier
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value={"/supplier/manager/supplier/supplier_info_list.html","/supplier/manager/supplier/supplier_info_detail_2_supplier.html"})
	@ResponseBody
	public EasyuiSplitPager<Supplier> getSupplierInfoList(HttpServletRequest request,HttpServletResponse response,Supplier supplier)throws Exception{
		return supplierService.getSupplierInfo(supplier);
	}
	@RequestMapping("/supplier/manager/supplier/supplier_manager_view.html")
	public ModelAndView supplierManager(HttpServletRequest request,HttpServletResponse response)throws Exception{
		ModelAndView mv = new  ModelAndView(supplier_manager_view);
		Supplier supplier =new Supplier();
		supplier.setSupplierId(Long.toString(System.currentTimeMillis(), 36));
		mv.addObject("supplier", supplier);
		return mv;
	}
	
	@RequestMapping("/supplier/manager/supplier/supplier_link_man_info_memcached.html")
	@ResponseBody
	public JsonUtils addSupplierLinkManInfo(HttpServletRequest request,HttpServletResponse response,LinkMan linkMan)throws Exception{
		String key =linkMan.getCompanyId()+"_supplier_add_supplier_link_man_info";
		return supplierService.addSupplierLinkMan2Memcached(key, linkMan);
	}
	
	@RequestMapping("/supplier/manager/supplier/supplier_link_man_info_remove_memcached.html")
	@ResponseBody
	public JsonUtils removeSupplierLinkManInfo(HttpServletRequest request,HttpServletResponse response,LinkMan linkMan)throws Exception{
		String key =linkMan.getCompanyId()+"_supplier_add_supplier_link_man_info";
		boolean delete = ServletRequestUtils.getBooleanParameter(request, "delete", false);//表示是否全部删除 默认为 false
		return supplierService.removeSupplierLinkMan2Memcached(key, delete, linkMan);
	}
	
	@RequestMapping("/supplier/manager/supplier/supplier_infos_add.html")
	@ResponseBody
	public JsonUtils saveSupplierInfo(HttpServletRequest request,HttpServletResponse response,Supplier supplier)throws Exception{
		String key =supplier.getSupplierId() + "_supplier_add_supplier_link_man_info";
		String ledgerId = "0010";
		String creater  = "0101";
		
		supplier.setLedgerId(ledgerId);
		supplier.setCreater(creater);
		
		JsonUtils result = supplierService.saveSupplierInfo(key, supplier);
		supplier =(Supplier)result.getChild();
		supplier.setDeliveryNot(Long.toString(System.currentTimeMillis(), 36));//获取新的临时客户编号
		result.setChild(supplier);
		return result;
	}
	
	
	@PreDestroy
	public void destroy(){
		if(supplier_manager_view!=null){
			supplier_manager_view=null;
		}
	}
}
