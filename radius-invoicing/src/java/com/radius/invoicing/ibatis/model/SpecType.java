/**
 * 
 */
package com.radius.invoicing.ibatis.model;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2014-3-26 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 规格类型
 */
public class SpecType extends ExtInfo{
	private Integer specId;//规格编码
	private String specName;//规格名称
	private Integer specUnit;//规格单位
	private String  specUnitName;//规格单位名称
	private Integer equivalentUnit;//折合单位
	private String  equivalentUnitName;//折合单位名称
	private Integer quantityEuUnit;//折合数量/规格单位
	private Integer status;//状态
	private String mome;//描述
	private String ledgerId;//装套
	
	
	public Integer getEquivalentUnit() {
		return equivalentUnit;
	}
	public void setEquivalentUnit(Integer equivalentUnit) {
		this.equivalentUnit = equivalentUnit;
	}
	public String getLedgerId() {
		return ledgerId;
	}
	public void setLedgerId(String ledgerId) {
		this.ledgerId = ledgerId;
	}
	public String getMome() {
		return mome;
	}
	public void setMome(String mome) {
		this.mome = mome;
	}
	public Integer getQuantityEuUnit() {
		return quantityEuUnit;
	}
	public void setQuantityEuUnit(Integer quantityEuUnit) {
		this.quantityEuUnit = quantityEuUnit;
	}
	public Integer getSpecId() {
		return specId;
	}
	public void setSpecId(Integer specId) {
		this.specId = specId;
	}
	public String getSpecName() {
		return specName;
	}
	public void setSpecName(String specName) {
		this.specName = specName;
	}
	public Integer getSpecUnit() {
		return specUnit;
	}
	public void setSpecUnit(Integer specUnit) {
		this.specUnit = specUnit;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getEquivalentUnitName() {
		return equivalentUnitName;
	}
	public void setEquivalentUnitName(String equivalentUnitName) {
		this.equivalentUnitName = equivalentUnitName;
	}
	public String getSpecUnitName() {
		return specUnitName;
	}
	public void setSpecUnitName(String specUnitName) {
		this.specUnitName = specUnitName;
	}
	
	
	
}
