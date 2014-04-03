/**
 * 
 */
package com.radius.invoicing.enums;

import org.apache.commons.lang.StringUtils;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 使用状态
 */
public enum UseStatusEnums {

	UNKNOWN(-1,"未知"),
	DISABLE(0,"停用"),
	USE(1,"使用");
	
	private Integer id;
	
	private String value;
	
	private UseStatusEnums(Integer id,String value) {
		this.id=id;
		this.value=value;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	
	public static UseStatusEnums getUseStatusEnums(Integer id){
		if(id==null){
			return null;
		}
		for(UseStatusEnums enums:UseStatusEnums.values()){
			if(enums.getId().intValue()==id.intValue()){
				return enums;
			}
		}
		return null;
	}
	
	
	public static UseStatusEnums getUseStatusEnums(String value){
		if(StringUtils.isBlank(value)){
			return null;
		}
		for(UseStatusEnums enums:UseStatusEnums.values()){
			if(enums.getValue().equalsIgnoreCase(value)){
				return enums;
			}
		}
		return null;
	}
	
	public static String getUseStatusEnums2Json(){
		StringBuffer bf=new StringBuffer("[");
		for(UseStatusEnums enums:UseStatusEnums.values()){
			bf.append("{\"id\":").append(enums.getId().intValue()).append(",");
			bf.append("\"name\":\"").append(enums.getValue()).append("\"},");
		}
		bf.substring(0, bf.length()-1);
		
		return bf.substring(0, bf.length()-1)+"]";
	}
}
