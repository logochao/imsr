package com.radius.invoicing.enums;

import org.apache.commons.lang.StringUtils;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 询价枚举
 */
public enum GoodsInquiryTypeEnums {

	INQUIRYED("00","已询价"),
	INQUIRYING("01","询价中");
	
	private String id;
	private String name;
	
	private GoodsInquiryTypeEnums(String id,String name) {
		this.id=id;
		this.name=name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public static GoodsInquiryTypeEnums getGoodsInquiryTypeEnumsById(String id){
		if(StringUtils.isBlank(id))
			return INQUIRYING;
		
		for(GoodsInquiryTypeEnums enums:GoodsInquiryTypeEnums.values()){
			if(enums.getId().equals(id)){
				return enums;
			}
		}
		return INQUIRYING;
	}
	
	public static GoodsInquiryTypeEnums getGoodsInquiryTypeEnumsByName(String name){
		if(name==null)
			return INQUIRYING;
		
		for(GoodsInquiryTypeEnums enums:GoodsInquiryTypeEnums.values()){
			if(enums.getName().equals(name)){
				return enums;
			}
		}
		return INQUIRYING;
	}
	
	/**
	 * 获取状态枚举json对象
	 * @return
	 */
	public static String getInquiryTypeEnumsJson(){
		StringBuffer bf=new StringBuffer("[");
		for(GoodsInquiryTypeEnums enums:GoodsInquiryTypeEnums.values()){
			bf.append("{\"id\":").append(enums.getId()).append(",");
			bf.append("\"name\":\"").append(enums.getName()).append("\"},");
		}
		bf.substring(0, bf.length()-1);
		return bf.substring(0, bf.length()-1)+"]";
	}
}
