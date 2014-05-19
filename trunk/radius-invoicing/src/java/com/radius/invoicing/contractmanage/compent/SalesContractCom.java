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
import com.radius.invoicing.ibatis.model.SalesContract;
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
	public static List<SalesContractGoodsGrd> getSalesContractGoodsGrdByRequest(String ledgerId,String cacheKey,String contractId,String status,String creater){
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
				goods.setStatus(status);
				goods.setLedgerId(ledgerId);
				goods.setCreater(creater);
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
	public static SalesContractPayment getSalesContractPaymentByRequest(String ledgerId,HttpServletRequest request,String contractId,String creater){
		SalesContractPayment payment = new  SalesContractPayment();
		payment.setContractId(contractId);//合同编号
		Float totalAmount = ServletRequestUtils.getFloatParameter(request, "totalAmount", 0f);
		Integer amount=Integer.valueOf(((Float)(totalAmount.floatValue()*100)).intValue()+"");
		payment.setTotalAmount(amount);
		payment.setPaymentType(ServletRequestUtils.getIntParameter(request, "paymentType",0));//支付类型
		payment.setCashType(ServletRequestUtils.getIntParameter(request, "cashType", 0));//币种类型
		payment.setUpperAmount(ServletRequestUtils.getStringParameter(request, "upperAmount", ""));//大写货币
		payment.setLedgerId(ledgerId);
		payment.setCreater(creater);
		return payment;
	}
	/**
	 * 获取合同支付详情
	 * @param contractId
	 * @param cacheKey
	 * @param status
	 * @return
	 */
	public static List<SalesContractPaymentGrd> getSalesContractPaymentGrdByRequest(String contractId,String ledgerId,String cacheKey,String status,String creater){
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
				payment.setStatus(status);//设置状态
				payment.setLedgerId(ledgerId);
				payment.setCreater(creater);
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
	public static List<ContractScanGrd> getContractScanGrdsByRequest(String contractId,String cacheKey,String creater,String filePath){
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
				scan.setCreater(creater);
				scan.setFilePath(filePath);
				scansList.add(scan);
			}
		}
		//释放资源
		key=null;
		scan=null;
		
		return scansList;
	}
	
	/**
	 * 获取保函条款记录
	 * @param request
	 * @param salesContract
	 * @return
	 */
	public static List<SalesContractPaymentGrd> getSalesContractGuaranteePaymentGrd(HttpServletRequest request,SalesContract salesContract){
		List<SalesContractPaymentGrd> list =new ArrayList<SalesContractPaymentGrd>();
		String guaranteeName =ServletRequestUtils.getStringParameter(request, "guaranteeName","");//支付#收款
		int payamount=ServletRequestUtils.getIntParameter(request, "payamount", 0);
		String guaranteeReceiveType=ServletRequestUtils.getStringParameter(request, "guaranteeReceiveType","");//收付款类型 付款类型#收款类型
		String upperAmount =ServletRequestUtils.getStringParameter(request, "quaranteeUpperAmount","");//大写金额
		String[]names=guaranteeName.split("#");
		String[]receiveTypes=guaranteeReceiveType.split("#");
		String contractId=salesContract.getId();
		SalesContractPaymentGrd receivables =new SalesContractPaymentGrd();//收款
		receivables.setName(names[0]);
		receivables.setContractId(contractId);
		receivables.setAmount(payamount);
		receivables.setUpperAmount(upperAmount);
		receivables.setReceiveType(receiveTypes[0]);
		receivables.setValidityDate(salesContract.getPayTime());
		receivables.setStatus(salesContract.getStatus());
		list.add(receivables);
		
		SalesContractPaymentGrd payment =new SalesContractPaymentGrd();//付款
		payment.setName(names[0]);
		payment.setContractId(contractId);
		payment.setAmount(payamount);
		payment.setUpperAmount(upperAmount);
		payment.setReceiveType(receiveTypes[0]);
		payment.setValidityDate(salesContract.getPayTime());
		payment.setStatus(salesContract.getStatus());
		list.add(payment);
		return list;
	}
}
