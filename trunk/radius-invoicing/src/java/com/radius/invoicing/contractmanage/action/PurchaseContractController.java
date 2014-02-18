package com.radius.invoicing.contractmanage.action;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.radius.base.controller.BaseController;
import com.radius.base.utils.StockUtils;
import com.radius.invoicing.ibatis.model.PurchaseContract;

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
	
	
	@PostConstruct
	public void init(){
		if(purchase_view==null){
			purchase_view=prefix+"index.jsp";
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
		PurchaseContract purchaseContract=new PurchaseContract();
		purchaseContract.setId(StockUtils.getPurchaseContractId());
		
		ModelAndView mv = new ModelAndView(purchase_view);
		mv.addObject("purchaseContract", purchaseContract);
		return mv;
	}
}
