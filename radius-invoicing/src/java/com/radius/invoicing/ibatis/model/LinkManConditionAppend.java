package com.radius.invoicing.ibatis.model;

import org.apache.commons.lang.StringUtils;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public class LinkManConditionAppend {

	public static void setCondition(LinkMan model){
		StringBuffer bf=new StringBuffer();
		bf.append(" WHERE 1=1 ");
		if(model.getId()!=null&&model.getId()>0){
			bf.append(" AND  link_man_id =").append(model.getId().intValue());
			
		}
		if(model.getLinkType()!=null&&model.getLinkType()>0){
			bf.append(" AND link_type =").append(model.getLinkType().intValue());
			
		}
		if(StringUtils.isNotBlank(model.getOther())){
			bf.append(" AND other_id = '").append(model.getOther()).append("'");
		}
		if(StringUtils.isNotBlank(model.getName())){
			bf.append(" AND link_man_name like '%").append(model.getName()).append("%'");
		}
		if(model.getSex()!=null&&model.getSex().getId()!=null&&model.getSex().getId().intValue()>0){
			bf.append(" AND other_id = '").append(model.getSex().getId().intValue()).append("'");
		}
		if(StringUtils.isNotBlank(model.getCardNo())){
			bf.append(" AND card_no = '").append(model.getCardNo()).append("'");
		}
		if(StringUtils.isNotBlank(model.getMobile())){
			bf.append(" AND link_mobile = '").append(model.getMobile()).append("'");
		}
		if(StringUtils.isNotBlank(model.getTel())){
			bf.append(" AND link_tel = '").append(model.getTel()).append("'");
		}
		if(StringUtils.isNotBlank(model.getEmail())){
			bf.append(" AND email = '").append(model.getEmail()).append("'");
		}
		if(StringUtils.isNotBlank(model.getQq())){
			bf.append(" AND qq = '").append(model.getQq()).append("'");
		}
		if(StringUtils.isNotBlank(model.getAddress())){
			bf.append(" AND address = '").append(model.getAddress()).append("'");
		}
		model.setCondition(bf.toString());
		
		bf=null;
	}
}
