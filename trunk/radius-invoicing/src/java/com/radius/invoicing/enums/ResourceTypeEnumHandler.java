package com.radius.invoicing.enums;

import java.sql.SQLException;
import java.sql.Types;

import com.ibatis.sqlmap.client.extensions.ParameterSetter;
import com.ibatis.sqlmap.client.extensions.ResultGetter;
import com.ibatis.sqlmap.client.extensions.TypeHandlerCallback;

/**
 * @author �²��� E-mail:goodluck.sunlight@gmail.com
 * @version ����ʱ�䣺2013-12-8 ����11:56:15
 * ��˵��
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
         * ��sqlMap����parameterMap������typeHandler��sqlMapConfig����ȫ��typeHandlerʱ�Żᴥ�� 
         */
		if(null==obj){
			setter.setNull(Types.INTEGER);//��û�д�ֵ��null,���ֶβ��������쳣
			return ;
		}
		setter.setInt(((ResourceTypeEnum)obj).getTypeId());
		
	}

	/**
	 * ��ȡö�ٶ���
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
