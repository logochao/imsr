/**
 * 
 */
package com.radius.invoicing.enums;
/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 支付方式枚举
 */
public enum PayTypeEnums {

	GUARANTEEPAYMENT(1,"保函付款"),
	GUARANTEERECEIVABLES(2,"保函收款"),
	SELLRECEIVABLES(3,"销售收款"),
	STOCKPAYMENT(4,"采购付款");
	
	private Integer id;
	
	private String name;
	
	private PayTypeEnums(Integer id,String name){
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
	 * 通过支付编号获取支付类型枚举
	 * @param id
	 * @return
	 */
	public static PayTypeEnums getPayTypeEnumById(Integer id){
		if(id==null) return null;
		for(PayTypeEnums enums:PayTypeEnums.values()){
			if(enums.getId().intValue()==id.intValue()){
				return enums;
			}
		}
		return null;
	}
	/**
	 * 通过支付编号获取支付方式描述
	 * @param id
	 * @return
	 */
	public static String getPayTypeNameById(Integer id){
		if(id==null)return null;
		for(PayTypeEnums enums:PayTypeEnums.values()){
			if(enums.getId().intValue()==id.intValue()){
				return enums.getName();
			}
		}
		return null;
	}
}
