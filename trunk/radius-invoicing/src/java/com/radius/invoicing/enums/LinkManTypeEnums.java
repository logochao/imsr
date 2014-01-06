/**
 * 
 */
package com.radius.invoicing.enums;
/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 联系人类型
 */
public enum LinkManTypeEnums {

	CUSTOMER(1,"客户"),
	SUPPLIER(2,"供应商");
	
	private Integer id;
	private String  name;
	
	private LinkManTypeEnums(Integer id,String name) {
		this.id=id;
		this.name=name;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	/**
	 * 通过Id获取联系人枚举
	 * @param id
	 * @return
	 */
	public static LinkManTypeEnums getLinkManTypeEnumsById(Integer id){
		if(id==null)return null;
		for(LinkManTypeEnums enums:LinkManTypeEnums.values()){
			if(enums.getId().intValue()==id.intValue()){
				return enums;
			}
		}
		return null;
	}
	
	/**
	 * 通过Id获取联系人枚举对应的描述
	 * @param id
	 * @return
	 */
	public static String getLinkManTypeNameById(Integer id){
		if(id==null) return null;
		for(LinkManTypeEnums enums:LinkManTypeEnums.values()){
			if(enums.getId().intValue()==id.intValue()){
				return enums.getName();
			}
		}
		return null;
	}
	
	
	
}
