/**
 * 
 */
package com.radius.invoicing.enums;
/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 性别枚举类型
 */
public enum SexEnums {
	UNKNOW(2,"未知"),
	MALE(1,"男"),
	FEMALE(0,"女");
	
	private Integer id;
	private String name;
	
	private SexEnums(Integer id,String name) {
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
	 * 通过id获取性别枚举
	 * @param id
	 * @return
	 */
	public static SexEnums getSexEnumsById(Integer id){
		SexEnums result=null;
		if(id==null) return null;
		for(SexEnums enums:SexEnums.values()){
			if(enums.getId().intValue()==id.intValue()){
				result= enums;
				break;
			}
		}
		return result;
	}
	
	/**
	 * 通过枚举编号获取枚举对应的描述
	 * @param id
	 * @return
	 */
	public static String getSexEnumsNameById(Integer id){
		String result=null;
		if(id==null) return null;
		for(SexEnums enums:SexEnums.values()){
			if(enums.getId().intValue()==id.intValue()){
				result= enums.getName();
				break;
			}
		}
		return result;
	}
}
