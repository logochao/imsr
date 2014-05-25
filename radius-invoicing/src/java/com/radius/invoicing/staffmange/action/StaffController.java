/**
 * 
 */
package com.radius.invoicing.staffmange.action;

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
import com.radius.invoicing.staffmange.service.StaffService;
import com.radius.invoicing.ibatis.model.Staff;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 商品处理
 */
@Controller
@Scope("request")
public class StaffController {

//	private Logger logger=Logger.getLogger(this.getClass());
	
	private final String prefix="/jsp/business/staff/";
	
	private String staff_manager_view=null;
	
	
	@PostConstruct
	public void init(){
		if(staff_manager_view==null){
			staff_manager_view=prefix+"business_staff_index.jsp";
		}
	}
	
	
	@Autowired(required=false)
	@Qualifier("staffServiceImpl")
	private StaffService staffService;
	
	
	
	
	
	@RequestMapping({"/staff/split_page.html","/staff/manager/staff/staff_list.html","/staff/manager/staff/info_2_staff.html"})
	@ResponseBody
	public EasyuiSplitPager<Staff> getStaffSplitPage(HttpServletRequest request,HttpServletResponse response,Staff staff)throws Exception{
		return staffService.getStaffSplitPage(staff);
	}
	
	/**
	 * 进入商品管理界面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/staff/manager/staff/staff_manager_view.html")
	public ModelAndView staffManager(HttpServletRequest request,HttpServletResponse response)throws Exception{
		ModelAndView mv = new ModelAndView(staff_manager_view);
		Staff staff = new Staff();
		staff.setId(Long.toString(System.currentTimeMillis(), 36));
		mv.addObject("staff", staff);
		return mv;
	}
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/staff/manager/staff/staff_infos_add.html")
	@ResponseBody
	public JsonUtils addStaffInfo(HttpServletRequest request,HttpServletResponse response,Staff staff)throws Exception{
		String ledgerId = "0010";
		String creater = "0001";
		staff.setLedgerId(ledgerId);
		staff.setCreater(creater);
		return staffService.saveStaffInfo(staff, Long.toString(System.currentTimeMillis(), 36));
	}
	
	
	
	@PreDestroy
	public void destroy(){
		if(staff_manager_view!=null){
			staff_manager_view=null;
		}
	}
}
