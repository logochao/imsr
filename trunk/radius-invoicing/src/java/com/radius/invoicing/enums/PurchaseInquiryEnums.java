package com.radius.invoicing.enums;

import org.apache.commons.lang.StringUtils;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 采购询价
 */
public enum PurchaseInquiryEnums {

	UNRECOGNIZED("6000","未确认"),
	RECOGNIZED("6001","已确认"),
	QUOTED("6002","已报价");
	
	private String id="";
	private String name="";
	
	private PurchaseInquiryEnums(String id,String name) {
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
	
	public static PurchaseInquiryEnums getPurchaseInquiryEnumsById(String id){
		if(StringUtils.isBlank(id))
			return PurchaseInquiryEnums.UNRECOGNIZED;
		for(PurchaseInquiryEnums enums:PurchaseInquiryEnums.values()){
			if(enums.getId().equals(id)){
				return enums;
			}
		}
		return PurchaseInquiryEnums.UNRECOGNIZED;
	}
	
	public static String purchaseInquiryStatus(String id){
		if(StringUtils.isBlank(id))
			return PurchaseInquiryEnums.UNRECOGNIZED.getName();
		for(PurchaseInquiryEnums enums:PurchaseInquiryEnums.values()){
			if(enums.getId().equals(id)){
				return enums.getName();
			}
		}
		return PurchaseInquiryEnums.UNRECOGNIZED.getName();
	}
	
	public static PurchaseInquiryEnums getPurchaseInquiryEnumsByName(String name){
		if(StringUtils.isBlank(name))
			return PurchaseInquiryEnums.UNRECOGNIZED;
		for(PurchaseInquiryEnums enums:PurchaseInquiryEnums.values()){
			if(enums.getName().equals(name)){
				return enums;
			}
		}
		return PurchaseInquiryEnums.UNRECOGNIZED;
	}
}
