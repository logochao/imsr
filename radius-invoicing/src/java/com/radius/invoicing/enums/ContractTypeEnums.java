/**
 * 
 */
package com.radius.invoicing.enums;

import org.apache.commons.lang.StringUtils;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public enum ContractTypeEnums {

	SALES(1,"销售合同"),
	PURCHASE(2,"采购合同");
	
	private Integer id=null;
	private String name="";
	
	private ContractTypeEnums(Integer id,String name) {
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
	
	public static ContractTypeEnums getContractTypeEnumsById(Integer id){
		if(id==null)return null;
		for(ContractTypeEnums enums:ContractTypeEnums.values()){
			if(enums.getId().intValue()==id.intValue()){
				return enums;
			}
		}
		
		return null;
	}
	
	public static ContractTypeEnums getContractTypeEnumsByName(String name){
		if(StringUtils.isBlank(name)){
			return null;
		}
		for(ContractTypeEnums enums:ContractTypeEnums.values()){
			if(name.equals(enums.getName())){
				return enums;
			}
		}
		return null;
	}
	
	/**
	 * 获取合同枚举json对象
	 * @return
	 */
	public static String getContractTypeEnumsJson(){
		StringBuffer bf=new StringBuffer("[");
		for(ContractTypeEnums enums:ContractTypeEnums.values()){
			bf.append("{\"id\":").append(enums.getId().intValue()).append(",");
			bf.append("\"name\":\"").append(enums.getName()).append("\"},");
		}
		bf.substring(0, bf.length()-1);
		return bf.substring(0, bf.length()-1)+"]";
	}
}
