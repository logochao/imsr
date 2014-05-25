/**
 * 
 */
package com.radius.invoicing.institutionmanage.action;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.radius.base.page.EasyuiSplitPager;
import com.radius.base.utils.JsonUtils;
import com.radius.invoicing.institutionmanage.service.InstitutionService;
import com.radius.invoicing.ibatis.model.Institution;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 商品处理
 */
@Controller
@Scope("request")
public class InstitutionController {

//	private Logger logger=Logger.getLogger(this.getClass());
	
	private final String prefix="/jsp/business/institution/";
	
	private String institution_manager_view=null;
	
	
	@PostConstruct
	public void init(){
		if(institution_manager_view==null){
			institution_manager_view=prefix+"business_institution_index.jsp";
		}
	}
	
	
	@Autowired(required=false)
	@Qualifier("institutionServiceImpl")
	private InstitutionService institutionService;
	
	
	
	
	
	@RequestMapping({"/institution/split_page.html","/institution/manager/institution/institution_list.html","/institution/manager/institution/institution_info_2_institution.html"})
	@ResponseBody
	public EasyuiSplitPager<Institution> getInstitutionSplitPage(HttpServletRequest request,HttpServletResponse response,Institution institution)throws Exception{
		return institutionService.getInstitutionSplitPage(institution);
	}
	/**
	 * 进入商品管理界面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/institution/manager/institution/institution_manager_view.html")
	public ModelAndView institutionManager(HttpServletRequest request,HttpServletResponse response)throws Exception{
		ModelAndView mv = new ModelAndView(institution_manager_view);
		Institution institution = new Institution();
		institution.setInstId(Long.toString(System.currentTimeMillis(), 36));
		mv.addObject("institution", institution);
		return mv;
	}
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/institution/manager/institution/institution_infos_add.html")
	@ResponseBody
	public JsonUtils addInstitutionInfo(HttpServletRequest request,HttpServletResponse response,Institution institution)throws Exception{
		String ledgerId = "0010";
		String creater = "0010";
		institution.setLedgerId(ledgerId);
		institution.setCreater(creater);
		return institutionService.saveInstitutionInfo(institution, Long.toString(System.currentTimeMillis(), 36));
	}
	
	
	
	@PreDestroy
	public void destroy(){
		if(institution_manager_view!=null){
			institution_manager_view=null;
		}
	}
}
