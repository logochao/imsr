/**
 * 
 */
package com.radius.invoicing.enums;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/> Copyright (c) 2013 by 陈波宁.<br/> 类说明
 *          正反两面的枚举 是、否
 */
public enum YesOrNoEnums {

	YES(1, "是"), NO(0, "否");

	private Integer id;

	private String name;

	private YesOrNoEnums(Integer id, String name) {
		this.id = id;
		this.name = name;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 通過沒空編號獲取枚舉對象
	 * 
	 * @param id
	 * @return
	 */
	public static YesOrNoEnums getYesOrNoEnumsById(Integer id) {
		if (id == null)
			return null;
		for (YesOrNoEnums enums : YesOrNoEnums.values()) {
			if (enums.getId().intValue() == id.intValue()) {
				return enums;
			}
		}

		return null;
	}

	/**
	 * 通過枚舉編號獲取枚舉對應的描述
	 * 
	 * @param id
	 * @return
	 */
	public static String getYesOrNoEnumsNameById(Integer id) {
		if (id == null)
			return null;

		for (YesOrNoEnums enums : YesOrNoEnums.values()) {
			if (enums.getId().intValue() == id.intValue()) {
				return enums.getName();
			}
		}
		return null;
	}
	
	public static String getYesOrNoEnums2Json(){
		StringBuffer bf=new StringBuffer("[");
		for(YesOrNoEnums enums:YesOrNoEnums.values()){
			bf.append("{\"id\":").append(enums.getId().intValue()).append(",");
			bf.append("\"name\":\"").append(enums.getName()).append("\"},");
		}
		bf.substring(0, bf.length()-1);
		
		return bf.substring(0, bf.length()-1)+"]";
	}
}
