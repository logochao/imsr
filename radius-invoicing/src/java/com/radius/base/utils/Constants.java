/**
 * 
 */
package com.radius.base.utils;
/**
 * @author 陈波宁 E-mail:goodluck.sunlight@gmail.com
 * @version 创建时间：2013-12-7 下午10:59:13
 * 类说明 系统中使用到的一些常量
 */
/**
 * @author boning.cheng
 *
 */
public interface Constants {

	/**
	 * 用户编号的开始字母
	 */
	public String USER_PREFIX="U";
	/**
	 * 以采购开始的一些信息 如采购订单 CG-D
	 */
	public String STOCK_PREFIX="CG";//采购
	/**
	 * 供应商编号的开始字母
	 */
	public String SUPPLIER_PREFIX="G";//供运商
	
	/**
	 * 时间格式yyyyMMdd
	 */
	public String DATE_FORMAT_YEAR_MONTH_DAY="yyyyMMdd";//yyyyMMdd的时间格式
	
	final int CACHE_ONE_HOURE_TIME=60*60;//1小时
	
	final int CACHE_ONE_DAY_TIME=60*60*24;//缓存一天的时间
	
	String SALES_CONTRACT_PREFIX="H_X";//销售合同前缀
	
	String PURCHASE_CONTRACT_PREFIX="H_C";//采购合同前缀
	
	String SALES_ORDER_PREFIX="XH_D";//销售订单前缀
	
}