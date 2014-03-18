package com.radius.invoicing.suppliermanage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.radius.base.controller.BaseController;
import com.radius.base.page.EasyuiSplitPager;
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

	
	private Logger logger=Logger.getLogger(this.getClass());
	
	@Autowired(required=false)
	@Qualifier("supplierServiceImpl")
	private SupplierService supplierService;
	
	/**
	 * 获取供应商信息列表
	 * @param request
	 * @param response
	 * @param supplier
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/supplier/manager/supplier/supplier_info_list.html")
	@ResponseBody
	public EasyuiSplitPager<Supplier> getSupplierInfoList(HttpServletRequest request,HttpServletResponse response,Supplier supplier)throws Exception{
		return supplierService.getSupplierInfo(supplier);
	}
}
