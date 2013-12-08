package com.radius.invoicing.enums;

import java.sql.SQLException;
import java.sql.Types;

import com.ibatis.sqlmap.client.extensions.ParameterSetter;
import com.ibatis.sqlmap.client.extensions.ResultGetter;
import com.ibatis.sqlmap.client.extensions.TypeHandlerCallback;

/**
 * @author 陈波宁 E-mail:goodluck.sunlight@gmail.com
 * @version 创建时间：2013-12-8 上午11:56:15
 * 类说明
 */
public class ResourceTypeEnumHandler implements TypeHandlerCallback {

	public Object getResult(ResultGetter getter) throws SQLException {
		Object result=null;
		if(null!=getter.getObject()){
			result=getEnums(getter.getInt());
		}
		
		return result;
	}

	public void setParameter(ParameterSetter setter, Object obj)throws SQLException {
		/* 
         * 在sqlMap中配parameterMap的属性typeHandler和sqlMapConfig中配全局typeHandler时才会触发 
         */
		if(null==obj){
			setter.setNull(Types.INTEGER);//若没有传值则null,表字段不允许则异常
			return ;
		}
		setter.setInt(((ResourceTypeEnum)obj).getTypeId());
		
	}

	/**
	 * 获取枚举对象
	 */
	public Object valueOf(String string) {
		Object result=null;
		int typeId=0;
		if(null!=string&&string.length()>0){
			try{
				typeId=Integer.parseInt(string);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		result=getEnums(typeId);
		
		return result;
	}

	private Object getEnums(int value){
		Object result=null;
		for(ResourceTypeEnum enums:ResourceTypeEnum.values()){
			result=enums;
			break;
		}
		
		return result;
	}
}
