/**
 * 
 */
package com.radius.invoicing.enums;
/**
 * @author �²��� E-mail:goodluck.sunlight@gmail.com
 * @version ����ʱ�䣺2013-12-8 ����11:49:11
 * ��˵�� ��Դ����ö��
 */
public enum ResourceTypeEnum {

	MENU(1,"�˵�"),FUNCTION(2,"����");
	
	
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
