/**
 * 
 */
package com.radius.invoicing.enums;

import java.sql.SQLException;
import java.sql.Types;

import com.ibatis.sqlmap.client.extensions.ParameterSetter;
import com.ibatis.sqlmap.client.extensions.ResultGetter;
import com.ibatis.sqlmap.client.extensions.TypeHandlerCallback;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 处理是否枚举对应的ibatis
 */
public class YesOrNoEnumsHandler implements TypeHandlerCallback {

	public Object getResult(ResultGetter getter) throws SQLException {
		Object result=null;
		if(null!=getter.getObject()){
			result=YesOrNoEnums.getYesOrNoEnumsById(getter.getInt());
		}
		return result;
	}

	public void setParameter(ParameterSetter setter, Object object) throws SQLException {
			/**
			* 在sqlMap中配parameterMap的属性typeHandler和sqlMapConfig中配全局typeHandler时才会触发 
	         */
			if(null==object){
				setter.setNull(Types.INTEGER);//若没有传值则null,表字段不允许则异常
				return ;
			}
			setter.setInt(((YesOrNoEnums)object).getId());
	}

	public Object valueOf(String str) {
		Object result=null;
		if(null!=str&&str.length()>0){
			result=YesOrNoEnums.getYesOrNoEnumsById(Integer.parseInt(str));
		}
		return result;
	}

}
