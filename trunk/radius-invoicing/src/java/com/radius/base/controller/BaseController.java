package com.radius.base.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public class BaseController {

	private Logger logger=Logger.getLogger(this.getClass());
	/**
	 * 提供异步方法
	 * @param response
	 * @param outMsg 客户端发送的信息（数据）
	 * @param exceptionMsg(可能发生的异常信息)
	 */
	public void ajaxMethod(HttpServletResponse response,String outMsg,String exceptionMsg){
		PrintWriter out=null;
		try {
			response.setCharacterEncoding("UTF-8");   
			response.setHeader("Cache-Control", "no-cache,must-revalidate");// 清楚缓存   
			response.setHeader("Pragma", "no-cache"); // HTTP 1.0   
			response.setDateHeader("Expires", 0); // prevents caching at the   
			out = response.getWriter();
			out.print(outMsg);
			out.flush();
		} catch (Exception e) {
			logger.error(exceptionMsg+"\n"+e.toString());
			throw new RuntimeException(exceptionMsg+"\n"+e.toString());
		}finally{
			if(out!=null){
				out.close();
			}
		}
	}
}
