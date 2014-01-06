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
 * 类说明 货币枚举ibatis处理
 */
public class CurrencyEnumHandler implements TypeHandlerCallback {

	public Object getResult(ResultGetter getter) throws SQLException {
		if(null!=getter.getObject()){
			return CurrencyEnum.getCurrencyEnumById(getter.getInt());
		}
		return null;
	}

	public void setParameter(ParameterSetter setter, Object obj)
			throws SQLException {
		if(obj==null){
			setter.setNull(Types.INTEGER);//若没有传值则null,表字段不允许则异常
			return ;
		}
		setter.setInt(((CurrencyEnum)obj).getId());
	}

	public Object valueOf(String str) {
		Object result=null;
		Integer id=null;
		if(null!=str&&str.length()>0){
			id= Integer.parseInt(str);
		}
		result=CurrencyEnum.getCurrencyEnumById(id);
		return result;
	}
}
