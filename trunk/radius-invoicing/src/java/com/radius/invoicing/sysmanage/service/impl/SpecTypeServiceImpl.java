package com.radius.invoicing.sysmanage.service.impl;

import java.util.List;

import javax.annotation.PreDestroy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.radius.base.page.EasyuiSplitPager;
import com.radius.base.utils.JsonUtils;
import com.radius.invoicing.enums.StatusEnums;
import com.radius.invoicing.ibatis.dao.SpecTypeDao;
import com.radius.invoicing.ibatis.model.SpecType;
import com.radius.invoicing.sysmanage.service.SpecTypeService;

@Service
public class SpecTypeServiceImpl implements SpecTypeService {

	@Autowired(required=false)
	@Qualifier("specTypeDaoImpl")
	private SpecTypeDao specTypeDao;
	
	private String message=null;
	
	/**
	 * 保存规格信息
	 * @param specType
	 * @return
	 */
	public JsonUtils<SpecType> addSpecTypeInfo(SpecType specType){
		JsonUtils<SpecType> jsonUtils =new JsonUtils<SpecType>();
		message = "保存规格信息操作失败...";
		jsonUtils.setMessage(message);
		specType.setStatus(StatusEnums.RECOGNIZED.getId());//设置状态为可用
		Integer specId = specTypeDao.insert(specType);
		
		if(specId>0){
			message ="保存规格信息操作成功...";
			jsonUtils.setMessage(message);
			jsonUtils.setSuccess(true);
			specType.setSpecId(specId);
			jsonUtils.setChild(specType);
		}
		return jsonUtils;
	}
	/**
	 * 保存规格信息 <br/>当数据存在是为更新,当数据不存在则对其进行新增
	 * @param specType
	 * @return
	 */
	public JsonUtils saveSpecTypeInfo(SpecType specType){
		List list=specTypeDao.getSpecType(specType);
		if(list==null||list.isEmpty()||list.size()==0){
			return addSpecTypeInfo(specType);
		}
		return updateSpecTypeInfo(specType);
	} 
	
	/**
	 * 更新规格信息
	 * @param specType
	 * @return
	 */
	public JsonUtils updateSpecTypeInfo(SpecType specType){
		JsonUtils jsonUtils =new JsonUtils();
		jsonUtils.setMessage("带修改的数据不存在,请核对...");
		Integer specId = specType.getSpecId();
		if(specId!=null&&specId.intValue()>0){
			boolean success = specTypeDao.updateSpecType(specType);
			if(success){
				message= "修改规格信息操作已成功...";
				jsonUtils.setMessage(message);
				jsonUtils.setSuccess(success);
			}
		}
		
		return jsonUtils;
	}
	
	/**
	 * 获取规格信息
	 * @param specType
	 * @return
	 */
	public EasyuiSplitPager<SpecType> getSpecTypeInfoList(SpecType specType){
		 EasyuiSplitPager<SpecType> page =new EasyuiSplitPager<SpecType>();
		 
		 List<SpecType> list= specTypeDao.getSpecType(specType);
		 if(list!=null&&!list.isEmpty()&&list.size()>0){
			 page.setRows(list);
			 page.setTotal(list.size());
		 }
		 
		 return page;
	}
	
	
	
	@PreDestroy
	public void destroy(){
		if(message!=null){
			message=null;
		}
	}
}
