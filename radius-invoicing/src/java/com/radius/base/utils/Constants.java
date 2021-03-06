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
	 * 库存前缀
	 */
	@Deprecated
	public String STOCK_PREFIX="KC";//库存
	/**
	 * 以采购开始的一些信息 如采购订单 CG-D
	 */
	public String PURCHASE_PREFIX="CG";//采购
	/**
	 * 以销售开始的一些信息 如销售订单 XS-D
	 */
	public String SALES_PREFIX="XS";//销售
	
	/**
	 * 付款单编号前缀 F
	 */
	public String PAYMENT_RECEIPT="F";//付款单
	/**
	 * 收款单编号前缀 S
	 */
	public String RECEIVABLES_RECEIPT="S";//收款单
	
	/**
	 * 供应商编号的开始字母
	 */
	public String SUPPLIER_PREFIX="G";//供运商
	/**
	 * 客户编号的开始字母
	 */
	public String CUSTOMER_PREFIX="K";//客户
	
	/**
	 * 时间格式yyyyMMdd
	 */
	public String DATE_FORMAT_YEAR_MONTH_DAY="yyyyMMdd";//yyyyMMdd的时间格式
	
	final int CACHE_ONE_HOURE_TIME=60*60;//1小时
	
	final int CACHE_ONE_DAY_TIME=60*60*24;//缓存一天的时间
	
	final int CACHE_ONE_MONTH_TIME=CACHE_ONE_DAY_TIME*30;//缓存一个月的时间
	
	/**
	 * 销售合同前缀
	 */
	String SALES_CONTRACT_PREFIX=SALES_PREFIX+"_S";//销售合同前缀
	/**
	 * 采购合同前缀
	 */
	String PURCHASE_CONTRACT_PREFIX=PURCHASE_PREFIX+"_C";//采购合同前缀
	/**
	 * 销售订单前缀 XS_D
	 */
	String SALES_ORDER_PREFIX=SALES_PREFIX+"_D";//销售订单前缀
	/**
	 * 销售报价前缀 XS_B
	 */
	String SALES_QUOTATION_PREFIX=SALES_PREFIX+"_B";//销售报价前缀
	/**
	 * 销售询价前缀 XS_X
	 */
	String SALES_INQUIRY_PREFIX=SALES_PREFIX+"_X";//销售询价前缀
	/**
	 * 采购询价前缀 CG_X
	 */
	String PURCHASE_INQUIRY_PREFIX=PURCHASE_PREFIX+"_X";//采购询价前缀
	/**
	 * 供应商报价前缀 CG_B
	 */
	String PURCHASE_QUOTATION_PREFIX=PURCHASE_PREFIX+"_B";//供应商报价前缀
	
	/**
	 * 采购订单前缀 CG_D
	 */
	String PURCHASE_ORDER_PREFIX=PURCHASE_PREFIX+"_D";//采购订单前缀
	
	/**
	 * 库存入库前缀 KC_R
	 */
	String STOCK_STORAGE=STOCK_PREFIX+"_R";
	
	/**
	 * 库存出库前缀 KC_C
	 */
	String STOCK_OUTSTORE=STOCK_PREFIX+"_C";//
	
}