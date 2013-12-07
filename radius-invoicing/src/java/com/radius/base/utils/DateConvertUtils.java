package com.radius.base.utils;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang.StringUtils;

public class DateConvertUtils {
	
	public static java.util.Date parse(String dateString,String dateFormat) {
		return parse(dateString, dateFormat,java.util.Date.class);
	}
	
	@SuppressWarnings("unchecked")
	public static <T extends java.util.Date> T parse(String dateString,String dateFormat,Class<T> targetResultType) {
		if(StringUtils.isEmpty(dateString))
			return null;
		DateFormat df = new SimpleDateFormat(dateFormat);
		try {
			java.util.Date t = targetResultType.getConstructor(long.class).newInstance(df.parse(dateString).getTime());
			return (T)t;
		} catch (ParseException e) {
			String errorInfo = "cannot use dateformat:"+dateFormat+" parse datestring:"+dateString;
			throw new IllegalArgumentException(errorInfo,e);
		} catch (Exception e) {
			throw new IllegalArgumentException("error targetResultType:"+targetResultType.getName(),e);
		}
	}
	public static String format(java.util.Date date,String format) {
		 if(date == null)
			 return null;
		 DateFormat df = new SimpleDateFormat(format);
		 return df.format(date);
	}
	public static String format(java.util.Date date) {
		 if(date == null)
			 return null;
		 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 
		 return df.format(date);
	}
	
	public static Integer getNowYearFormat(){
		java.util.Date date=new Date();
		SimpleDateFormat format=new SimpleDateFormat("yyyy");
		Integer year=Integer.parseInt(format.format(date));
		return year;
	}
	
	public static Integer getNowMonthFormat(){
		java.util.Date date=new Date();
		SimpleDateFormat format=new SimpleDateFormat("MM");
		Integer month=Integer.parseInt(format.format(date));
		return month;
	}
}
