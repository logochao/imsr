/**
 * 
 */
package com.radius.invoicing.ibatis.model;

import java.util.Date;

import org.codehaus.jackson.annotate.JsonIgnore;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 销售商品信息
 */
public class Goods extends ExtInfo{

	private String  	id;//商品编号
	private String  	name;//商品名称
	private String  	realName;//真实品名
	private String  	goodsType;//商品类型
	private String  	machineSeries;//所属设备名称/型号(主机序列号)
	private String  	machinePosition;//设备位号
	private String  	partNo;//备件号
	private String  	mapSeries;//图号
	private String      company;//生产厂商
	private String  	goodStatus;//商品状态 液态/固态
	private Integer  	weightProp;//比重
	private String  	vulnerability;//易损性
	private String 		description;//商品说明
	private String  	useStatus;//使用状态
	private String  	memo;//备注
	private String  	ledgerId;//账套编号
	private Integer  	depositDeadline;//存放期限
	
	
	
	private String 		supplierId="";//供应商编号 -->为查询方便而提供的属性



	public String getCompany() {
		return company;
	}



	public void setCompany(String company) {
		this.company = company;
	}



	public Integer getDepositDeadline() {
		return depositDeadline;
	}



	public void setDepositDeadline(Integer depositDeadline) {
		this.depositDeadline = depositDeadline;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public String getGoodStatus() {
		return goodStatus;
	}



	public void setGoodStatus(String goodStatus) {
		this.goodStatus = goodStatus;
	}



	public String getGoodsType() {
		return goodsType;
	}



	public void setGoodsType(String goodsType) {
		this.goodsType = goodsType;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getLedgerId() {
		return ledgerId;
	}



	public void setLedgerId(String ledgerId) {
		this.ledgerId = ledgerId;
	}



	public String getMachinePosition() {
		return machinePosition;
	}



	public void setMachinePosition(String machinePosition) {
		this.machinePosition = machinePosition;
	}



	public String getMachineSeries() {
		return machineSeries;
	}



	public void setMachineSeries(String machineSeries) {
		this.machineSeries = machineSeries;
	}



	public String getMapSeries() {
		return mapSeries;
	}



	public void setMapSeries(String mapSeries) {
		this.mapSeries = mapSeries;
	}



	public String getMemo() {
		return memo;
	}



	public void setMemo(String memo) {
		this.memo = memo;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getPartNo() {
		return partNo;
	}



	public void setPartNo(String partNo) {
		this.partNo = partNo;
	}



	public String getRealName() {
		return realName;
	}



	public void setRealName(String realName) {
		this.realName = realName;
	}



	public String getSupplierId() {
		return supplierId;
	}



	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}



	public String getUseStatus() {
		return useStatus;
	}



	public void setUseStatus(String useStatus) {
		this.useStatus = useStatus;
	}



	public String getVulnerability() {
		return vulnerability;
	}



	public void setVulnerability(String vulnerability) {
		this.vulnerability = vulnerability;
	}



	public Integer getWeightProp() {
		return weightProp;
	}



	public void setWeightProp(Integer weightProp) {
		this.weightProp = weightProp;
	}



	
	
	
	
	
	
}
