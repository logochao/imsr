/**
 * 
 */
package com.radius.invoicing.enums;
/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public enum StatusEnums {

	UNRECOGNIZED(0,"未确认"),
	RECOGNIZED(1,"已确认");
	
	private Integer id=null;
	private String name="";
	
	private StatusEnums(Integer id,String name) {
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
	
	public static StatusEnums getStatusEnumsById(Integer id){
		if(id==null)return null;
		for(StatusEnums enums:StatusEnums.values()){
			if(enums.getId().intValue()==id.intValue()){
				return enums;
			}
		}
		return null;
	}
	
	public static StatusEnums getStatusEnumsByName(String name){
		if(name==null)return null;
		for(StatusEnums enums:StatusEnums.values()){
			if(name.equals(enums.getName())){
				return enums;
			}
		}
		return null;
	}
	/**
	 * 获取状态枚举json对象
	 * @return
	 */
	public static String getStatusEnumsJson(){
		StringBuffer bf=new StringBuffer("[");
		for(StatusEnums enums:StatusEnums.values()){
			bf.append("{\"id\":").append(enums.getId().intValue()).append(",");
			bf.append("\"name\":\"").append(enums.getName()).append("\"},");
		}
		bf.substring(0, bf.length()-1);
		return bf.substring(0, bf.length()-1)+"]";
	}
	
}
