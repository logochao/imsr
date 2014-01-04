/**
 * 
 */
package com.radius.invoicing.ibatis.model;


/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2014-1-3 <br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明   分类项类型表
 */
public class CategoryType extends ExtInfo{

	private Integer  id ;//主键 分类项目类型编号
	private String name;//分类项目名称
	
	public CategoryType() {
	}
	
	
	public CategoryType(Integer id, String name) {
		this.id = id;
		this.name = name;
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
	
	
	
}
