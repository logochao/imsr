package com.radius.base.helper;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

/**
 * 
 * @author 陈波宁
 *
 * @2011-12-19
 * 
 * @描述 属性文件读取器
 *
 * @version 1.0
 *
 */
@SuppressWarnings("unchecked")
public class PropertyConfigHelper extends PropertyPlaceholderConfigurer {

	private static Map map;

	
	
	@SuppressWarnings("deprecation")
	@Override
	protected void processProperties(ConfigurableListableBeanFactory factory, Properties props) throws BeansException {
		// TODO Auto-generated method stub
		super.processProperties(factory, props);
		map =new HashMap();
		for(Object key:props.keySet()){
			String keyStr=key.toString();
			map.put(keyStr, parseStringValue(props.getProperty(keyStr), props, new HashSet()));
		}
	}
	
	public  Object getPropertyValue(String key){
		return map.get(key);
	}
	
	/**
	 * 通过遍历的方式查找制定的内容是否存在
	 * @param containValue
	 * @return
	 */
	public Object getPropertyValueByLoop(String containValue){
		Object result=null;
		Iterator iter = map.entrySet().iterator(); 
		while (iter.hasNext()) { 
		    Map.Entry entry = (Map.Entry) iter.next(); 
		    Object val = entry.getValue(); 
		    if(val.toString().contains(",")){//判断内容中是否包含","
			    String values[]=val.toString().split(",");
			    if(containValue.contains(getNewCharset(values[0]))){//是否包含制定的内容
			    	result=values[1];
			    	break;
			    }
		    }
		}
		
		return result;
	}
	
	
	private String getNewCharset(String value){
		try {
			return new String(value.getBytes("iso-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException(e.toString());
		}
	}
}
