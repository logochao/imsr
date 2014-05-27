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
public class Institution extends ExtInfo{

	private String  	instId="";    
	private String  	instName="";  
	private String  	instTel="";   
	private String  	instHead="";  
	private String  	approRev="";  
	private Integer  	amountLmt; 
	private String  	fatherInst="";
	private String  	instAddr="";  
	private String  	postCode="";  
	private String  	instUrl="";   
	private String  	linkMan="";   
	private String  	instFax="";   
	private String  	instMail="";
	
	
	public Integer getAmountLmt() {
		return amountLmt;
	}
	public void setAmountLmt(Integer amountLmt) {
		this.amountLmt = amountLmt;
	}
	public String getApproRev() {
		return approRev;
	}
	public void setApproRev(String approRev) {
		this.approRev = approRev;
	}
	public String getFatherInst() {
		return fatherInst;
	}
	public void setFatherInst(String fatherInst) {
		this.fatherInst = fatherInst;
	}
	public String getInstAddr() {
		return instAddr;
	}
	public void setInstAddr(String instAddr) {
		this.instAddr = instAddr;
	}
	public String getInstFax() {
		return instFax;
	}
	public void setInstFax(String instFax) {
		this.instFax = instFax;
	}
	public String getInstHead() {
		return instHead;
	}
	public void setInstHead(String instHead) {
		this.instHead = instHead;
	}
	public String getInstId() {
		return instId;
	}
	public void setInstId(String instId) {
		this.instId = instId;
	}
	public String getInstMail() {
		return instMail;
	}
	public void setInstMail(String instMail) {
		this.instMail = instMail;
	}
	public String getInstName() {
		return instName;
	}
	public void setInstName(String instName) {
		this.instName = instName;
	}
	public String getInstTel() {
		return instTel;
	}
	public void setInstTel(String instTel) {
		this.instTel = instTel;
	}
	public String getInstUrl() {
		return instUrl;
	}
	public void setInstUrl(String instUrl) {
		this.instUrl = instUrl;
	}
	public String getLinkMan() {
		return linkMan;
	}
	public void setLinkMan(String linkMan) {
		this.linkMan = linkMan;
	}
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	
	
}
