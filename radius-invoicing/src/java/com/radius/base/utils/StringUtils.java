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
public class StringUtils {

	/**
	 * 获取自定的字符 在字符之前添加指定的字符内容
	 * @param value 待处理的字符
	 * @param strLength 带生成的字符长度
	 * @param insteadStr 代替字符
	 * @return
	 */
	public static String getSpecifyStringByLengthBefore(String value,int strLength,String insteadStr){
		return appendString(value, strLength, insteadStr,true);
	}
	
	public static String getSpecifyStringByLengthAfter(String value,int strLength,String insteadStr){
		return appendString(value, strLength, insteadStr,false);
	}

	private static String appendString(String value, int strLength, String insteadStr,boolean before) {
		if(strLength==0){
			return value;
		}
		if(org.apache.commons.lang.StringUtils.isBlank(value)){
			return value;
		}
		if(value.trim().length()==strLength){
			return value;
		}
		
		if(strLength>value.trim().length()){
			StringBuffer b=new StringBuffer();
			int stemp=strLength-value.trim().length();
			if(!before){
				b.append(value.trim());
			}
			for(int i=0;i<stemp;i++){
				b.append(insteadStr);
			}
			if(before){
				b.append(value.trim());
			}
			
			return b.toString();
		}
		
		return value;
	}
}
