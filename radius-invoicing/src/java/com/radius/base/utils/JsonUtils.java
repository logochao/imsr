/**
 * 
 */
package com.radius.base.utils;
/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public class JsonUtils<E> {

	private boolean success=false;//通讯是否成功
	
	private String message="";//信息描述
	
	private E child;//带处理的对象
	
	public JsonUtils() {
	}
	
	
	public JsonUtils(boolean success,String message) {
		this.success=success;
		this.message=message;
	}
	

	public E getChild() {
		return child;
	}

	public void setChild(E child) {
		this.child = child;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}
	
	
	
	
	
	
}
