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
public class ResponseUtils<E> {

	private boolean success=false;//是否成功
	
	private String message="";//提示信息
	
	private E e;

	

	public E getE() {
		return e;
	}

	public void setE(E e) {
		this.e = e;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
}
