/**
 * 
 */
package com.radius.base.jstl;

import org.apache.commons.lang.StringUtils;

import com.radius.base.helper.PropertyConfigHelper;
import com.radius.invoicing.enums.ResourceTypeEnum;

/**
 * @author Administrator
 *
 */
public class RadiusFunctions {
	
	private static String menuTypeJson="";
	
	/**
	 * 获取属性值
	 * @param key
	 * @return
	 */
	public static String getPropertyValue(String key){
		if(StringUtils.isBlank(key)){
			return null;
		}
		Object value=PropertyConfigHelper.getPropertyValue(key);
		return value==null?null:value.toString();
	}
	
	
	public String getResourceTypeJson(){
		if(menuTypeJson.length()==0){
			StringBuilder b=new StringBuilder("[");
			for(ResourceTypeEnum enums:ResourceTypeEnum.values()){
				b.append("{\"").append("id\":\"");
				b.append(enums.getTypeId()).append("\",");
				b.append("\"name\":\"").append(enums.getTypeName()).append("\"},");
			}
			b.delete(b.length()-1, b.length());
			b.append("]");
			System.out.println("--------------------");
		}
		return menuTypeJson;
	}
}
