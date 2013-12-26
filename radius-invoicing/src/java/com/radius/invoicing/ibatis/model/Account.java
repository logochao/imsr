/**
 * 
 */
package com.radius.invoicing.ibatis.model;

import java.util.Date;

import com.radius.base.BaseEntity;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 账号信息表
 */
public class Account extends BaseEntity {

	private String id;//账号编号
	private String name;//帐套名称
	private String institution;//所属机构
	private String father;//父帐套
	private String creater;//创建人
	private Date createDate;//创建时间
	private String reviser;//审核人
	private Date reviseDate;//审核时间
	private String verifier;//复核人
	private Date verifyDate;//复核时间
	
	
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getCreater() {
		return creater;
	}
	public void setCreater(String creater) {
		this.creater = creater;
	}
	public String getFather() {
		return father;
	}
	public void setFather(String father) {
		this.father = father;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getInstitution() {
		return institution;
	}
	public void setInstitution(String institution) {
		this.institution = institution;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getReviseDate() {
		return reviseDate;
	}
	public void setReviseDate(Date reviseDate) {
		this.reviseDate = reviseDate;
	}
	public String getReviser() {
		return reviser;
	}
	public void setReviser(String reviser) {
		this.reviser = reviser;
	}
	public String getVerifier() {
		return verifier;
	}
	public void setVerifier(String verifier) {
		this.verifier = verifier;
	}
	public Date getVerifyDate() {
		return verifyDate;
	}
	public void setVerifyDate(Date verifyDate) {
		this.verifyDate = verifyDate;
	}
	
	
	
}
