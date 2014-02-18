package com.radius.invoicing.contractmanage.compent;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.web.bind.ServletRequestUtils;

import com.radius.base.cache.memcache.MemcacheClient;
import com.radius.invoicing.ibatis.model.ContractScanGrd;
import com.radius.invoicing.ibatis.model.SalesContractGoodsGrd;
import com.radius.invoicing.ibatis.model.SalesContractPayment;
import com.radius.invoicing.ibatis.model.SalesContractPaymentGrd;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 销售合同组件
 */
public class SalesContractCom {

	
	private static Logger logger=Logger.getLogger(SalesContractCom.class);
	/**
	 * 获取销售合同商品列表
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static List<SalesContractGoodsGrd> getSalesContractGoodsGrdByRequest(String ledgerId,String cacheKey,String contractId,String status){
		List<SalesContractGoodsGrd> goodsList=new ArrayList<SalesContractGoodsGrd>();
//		String key=contractId+"_add_sales_contract_proudct_info";
		//获取缓存中的Map销售合同商品信息
		Map<String,SalesContractGoodsGrd> cacheMap = (Map<String,SalesContractGoodsGrd>)MemcacheClient.get(cacheKey);
		String key = null;
		SalesContractGoodsGrd goods=null;
		if(cacheMap!=null&&!cacheMap.isEmpty()&&cacheMap.size()>0){//表示缓存内容不为空
			Iterator iter = cacheMap.entrySet().iterator();
			while (iter.hasNext()) { 
				Map.Entry entry = (Map.Entry) iter.next();
				key = (String) entry.getKey(); 
				goods=cacheMap.get(key);
				logger.info("合同商品列表 "+key +" ---> "+goods);
				//设置状态
				goods.setStats(status);
				goods.setLedgerId(ledgerId);
				goodsList.add(goods);
			}
		}
		//释放资源
		key=null;
		goods=null;
		return goodsList;
	}
	
	/**
	 * 	获取销售支付信息
	 * @param request
	 * @param contractId
	 * @return
	 */
	public static SalesContractPayment getSalesContractPaymentByRequest(String ledgerId,HttpServletRequest request,String contractId){
		SalesContractPayment payment = new  SalesContractPayment();
		payment.setContractId(contractId);//合同编号
		Float totalAmount = ServletRequestUtils.getFloatParameter(request, "totalAmount", 0f);
		Integer amount=Integer.valueOf(((Float)(totalAmount.floatValue()*100)).intValue()+"");
		payment.setTotalAmount(amount);
		payment.setPaymentType(ServletRequestUtils.getStringParameter(request, "paymentType",""));//支付类型
		payment.setCashType(ServletRequestUtils.getStringParameter(request, "cashType", ""));//币种类型
		payment.setUpperAmount(ServletRequestUtils.getStringParameter(request, "upperAmount", ""));//大写货币
		payment.setLedgerId(ledgerId);
		return payment;
	}
	/**
	 * 获取合同支付详情
	 * @param contractId
	 * @param cacheKey
	 * @param status
	 * @return
	 */
	public static List<SalesContractPaymentGrd> getSalesContractPaymentGrdByRequest(String contractId,String ledgerId,String cacheKey,String status){
		List<SalesContractPaymentGrd>  paymentsList=new ArrayList<SalesContractPaymentGrd>();
		Map<String,SalesContractPaymentGrd> memcache =(Map<String,SalesContractPaymentGrd>)MemcacheClient.get(cacheKey);
		String key = null;
		SalesContractPaymentGrd payment=null;
		if(memcache!=null&&!memcache.isEmpty()&&memcache.size()>0){//表示缓存内容不为空
			Iterator iter = memcache.entrySet().iterator();
			while (iter.hasNext()) { 
				Map.Entry entry = (Map.Entry) iter.next();
				key = (String) entry.getKey(); 
				payment=memcache.get(key);
				logger.info("合同支付详情列表 "+key +" ---> "+payment);
				payment.setStats(status);//设置状态
				payment.setLedgerId(ledgerId);
				paymentsList.add(payment);
			}
		}
		//释放资源
		key=null;
		payment=null;
		return paymentsList;
	} 
	
	/**
	 * 获取合同扫描件列表
	 * @param contractId
	 * @param cacheKey
	 * @return
	 */
	public static List<ContractScanGrd> getContractScanGrdsByRequest(String contractId,String cacheKey){
		List<ContractScanGrd> scansList=new ArrayList<ContractScanGrd>();
		Map<String,ContractScanGrd> memcache=(Map<String,ContractScanGrd>)MemcacheClient.get(cacheKey);
		String key = null;
		ContractScanGrd scan=null;
		if(memcache!=null&&!memcache.isEmpty()&&memcache.size()>0){//表示缓存内容不为空
			Iterator iter = memcache.entrySet().iterator();
			while (iter.hasNext()) { 
				Map.Entry entry = (Map.Entry) iter.next();
				key = (String) entry.getKey(); 
				scan=memcache.get(key);
				logger.info("合同扫描件列表 "+key +" ---> "+scan);
				scansList.add(scan);
			}
		}
		//释放资源
		key=null;
		scan=null;
		
		return scansList;
	}
}
