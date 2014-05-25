/**
 * 
 */
package com.radius.invoicing.institutionmanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.radius.base.page.EasyuiSplitPager;
import com.radius.base.utils.JsonUtils;
import com.radius.invoicing.institutionmanage.service.InstitutionService;
import com.radius.invoicing.ibatis.dao.InstitutionDao;
import com.radius.invoicing.ibatis.model.Institution;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
@Service
public class InstitutionServiceImpl implements InstitutionService {

	@Autowired(required=false)
	@Qualifier("institutionDaoImpl")
	private InstitutionDao institutionDao;
	
	/**
	 * 通过条件查询获取easyui的分页对象
	 * @param institution
	 * @return
	 */
	public EasyuiSplitPager<Institution> getInstitutionSplitPage(Institution institution){
		EasyuiSplitPager<Institution> splitPage=new EasyuiSplitPager<Institution>();
		List<Institution> list=institutionDao.getInstitutionByCondition(institution);
		splitPage.setRows(list);
		splitPage.setTotal(list.size());
		return splitPage;
	}
	
	
	/**
	 * 保存商品信息 <br> 1.如果存在,则更新;<br/>2.如果不存在,则添加
	 * @param institution
	 * @return
	 */
	public JsonUtils saveInstitutionInfo(Institution institution,String statusCode){
		Institution temp = institutionDao.getInstitution(institution.getInstId());
		if(temp!=null){
			return updateInstitutionInfo(institution,statusCode);
		}
		return addInstitutionInfo(institution,statusCode);
	}
	
	
	/**
	 * 更新商品信息
	 * @param institution
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public JsonUtils updateInstitutionInfo(Institution institution,String statusCode){
		JsonUtils jsonUtils =new JsonUtils();
		jsonUtils.setMessage("更新商品信息失败...");
		
		boolean success = institutionDao.updateInstitution(institution);
		if(success){
			jsonUtils.setMessage("更新商品信息成功...");
		}
		jsonUtils.setSuccess(success);
		jsonUtils.setChild(statusCode);
		return jsonUtils;
	}
	/**
	 * 添加商品信息
	 * @param institution
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public JsonUtils addInstitutionInfo(Institution institution,String statusCode){
		JsonUtils jsonUtils =new JsonUtils();
		jsonUtils.setMessage("添加商品信息失败...");
		institution.setInstId(institutionDao.getInstitutionMaxId());
		institutionDao.insert(institution);
		jsonUtils.setSuccess(true);
		jsonUtils.setMessage("添加商品信息成功...");
		institution.setBackup(statusCode);
		jsonUtils.setChild(institution);
		return jsonUtils;
	}
}
