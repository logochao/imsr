/**
 * 
 */
package com.radius.invoicing.enums;
/**
 * @author 陈波宁 E-mail:goodluck.sunlight@gmail.com
 * @version 创建时间：2013-12-8 上午11:49:11
 * 类说明 资源类型枚举
 */
public enum ResourceTypeEnum {

	MENU(1,"菜单"),FUNCTION(2,"功能");
	
	
	ResourceTypeEnum(int typeId,String typeName) {
		this.typeId=typeId;
		this.typeName=typeName;
	}
	private int typeId;
	private String typeName;
	
	
	public int getTypeId() {
		return typeId;
	}
	public String getTypeName() {
		return typeName;
	}
	
	
}
