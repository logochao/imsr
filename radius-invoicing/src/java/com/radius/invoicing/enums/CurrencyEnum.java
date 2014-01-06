/**
 * 
 */
package com.radius.invoicing.enums;
/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 货币类型枚举
 */
public enum CurrencyEnum {
	/**
	 * 人民币
	 */
	CHY(1,"人民币","￥"),
	/**
	 * 美元
	 */
	USD(2,"美元","$"),
	/**
	 * 英镑
	 */
	GBP(3,"英镑","£"),
	/**
	 * 日元
	 */
	JPY(4,"日元","¥"),
	/**
	 * 新台币
	 */
	NTD(5,"新台币","NT＄"),
	/**
	 * 欧元
	 */
	ECU(6,"欧元","€");
	
	private Integer id;//编号
	private String name;//货币名称
	private String logo;//简称
	CurrencyEnum(Integer id,String name,String logo){
		this.id=id;
		this.name=name;
		this.logo=logo;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	/**
	 * 通过货币编号获取货币枚举
	 * @param id
	 * @return
	 */
	public static CurrencyEnum getCurrencyEnumById(Integer id){
		if(id==null)
			return null;
		
		for(CurrencyEnum enums:CurrencyEnum.values()){
			if(enums.getId().intValue()==id.intValue()){
				return enums;
			}
		}
		return null;
	}
	/**
	 * 通过货币编号获取货币名称
	 * @param id
	 * @return
	 */
	public static String getCurrencyNameById(Integer id){
		if(id==null)
			return "";
		
		for(CurrencyEnum enums:CurrencyEnum.values()){
			if(enums.getId().intValue()==id.intValue()){
				return enums.getName();
			}
		}
		return "";
	}
	
	/**
	 * 通过货币编号获取货币的标志
	 * @param id
	 * @return
	 */
	public static String getCurrencyLogoById(Integer id){
		if(id==null)
			return "";
		
		for(CurrencyEnum enums:CurrencyEnum.values()){
			if(enums.getId().intValue()==id.intValue()){
				return enums.getLogo();
			}
		}
		return "";
	}
}
