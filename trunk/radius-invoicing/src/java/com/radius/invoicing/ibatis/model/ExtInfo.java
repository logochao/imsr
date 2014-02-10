/**
 * 
 */
package com.radius.invoicing.ibatis.model;

import java.util.Date;

import org.codehaus.jackson.annotate.JsonIgnore;

import com.radius.base.BaseEntity;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2014-1-3 <br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明   拓展信息字段
 */
public class ExtInfo extends BaseEntity{

	
	protected String creater;//创建人
	protected Date createDate;//创建时间
	protected String reviser;//审核人
	protected Date reviseDate;//审核时间
	protected String verifier;//复核人
	protected Date verifyDate;//复核时间
	
	@JsonIgnore
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	@JsonIgnore
	public String getCreater() {
		return creater;
	}
	public void setCreater(String creater) {
		this.creater = creater;
	}
	@JsonIgnore
	public Date getReviseDate() {
		return reviseDate;
	}
	public void setReviseDate(Date reviseDate) {
		this.reviseDate = reviseDate;
	}
	@JsonIgnore
	public String getReviser() {
		return reviser;
	}
	
	public void setReviser(String reviser) {
		this.reviser = reviser;
	}
	@JsonIgnore
	public String getVerifier() {
		return verifier;
	}
	public void setVerifier(String verifier) {
		this.verifier = verifier;
	}
	@JsonIgnore
	public Date getVerifyDate() {
		return verifyDate;
	}
	public void setVerifyDate(Date verifyDate) {
		this.verifyDate = verifyDate;
	}
	
	
	
	
}
