package com.radius.base;

import java.io.Serializable;

import org.codehaus.jackson.annotate.JsonIgnore;

public class BaseEntity implements Serializable {

	protected int perPageSize=10;
	protected int pageNo=1;
	protected String contextPath="";//项目名称
	
	protected int page=1;//jquery中的页码
	protected String order="";//排序列名称
	protected String sort="";//排序关键字
	
	protected String condition="";//where条件
	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPerPageSize() {
		return perPageSize;
	}
	public void setPerPageSize(int perPageSize) {
		this.perPageSize = perPageSize;
	}
	@JsonIgnore
	public String getContextPath() {
		return contextPath;
	}
	public void setContextPath(String contextPath) {
		this.contextPath = contextPath;
	}
	@JsonIgnore
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public int getPage() {
		return this.getPageNo();
	}
	public void setPage(int page) {
		this.pageNo = page;
	}
	@JsonIgnore
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	@JsonIgnore
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	
}
