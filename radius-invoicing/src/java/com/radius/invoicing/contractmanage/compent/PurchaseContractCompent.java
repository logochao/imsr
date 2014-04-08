/**
 * 
 */
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
import com.radius.invoicing.ibatis.model.PurchaseContractGoodsGrd;
import com.radius.invoicing.ibatis.model.PurchaseContractPayment;
import com.radius.invoicing.ibatis.model.PurchaseContractPaymentGrd;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 采购合同处理组件
 */
@SuppressWarnings("unchecked")
public class PurchaseContractCompent {

	private static Logger logger =Logger.getLogger(PurchaseContractCompent.class);  
	
	
	/**
	 * 构建采购支付信息
	 * @param request
	 * @param ledgerId
	 * @param creator
	 * @param contractId
	 * @return
	 */
	public static PurchaseContractPayment getPurchaseContractPaymentByRequest(HttpServletRequest request,String ledgerId,String creator,String contractId){
		PurchaseContractPayment payment=new PurchaseContractPayment();
		payment.setContractId(contractId);//合同编号
		payment.setCashType(ServletRequestUtils.getStringParameter(request, "cashType", ""));//币种
		payment.setTotalAmount(ServletRequestUtils.getIntParameter(request, "totalAmount", 0));//合同总金额
		payment.setUpperAmount(ServletRequestUtils.getStringParameter(request, "upperAmount", ""));//大写金额
		payment.setPaymentType(ServletRequestUtils.getStringParameter(request, "paymentType",""));//付款方式
		payment.setLedgerId(ledgerId);//账套编号
		return payment;
	}
	
	
	
	/**
	 * 获取采购商品列表信息
	 * @param ledgerId
	 * @param cacheKey
	 * @param status
	 * @return
	 */
	public static List<PurchaseContractGoodsGrd> getPurchaseContractGoodsGrdList(String creater,String ledgerId,String cacheKey,String status){
		 List<PurchaseContractGoodsGrd> list =new ArrayList<PurchaseContractGoodsGrd> ();
		 Map<String,PurchaseContractGoodsGrd> memcached= (Map<String,PurchaseContractGoodsGrd>)MemcacheClient.get(cacheKey);
		 String key = null;
		 PurchaseContractGoodsGrd product=null;
		if(memcached!=null&&!memcached.isEmpty()&&memcached.size()>0){//表示缓存内容不为空
			Iterator iter = memcached.entrySet().iterator();
			while (iter.hasNext()) { 
				Map.Entry entry = (Map.Entry) iter.next();
				key = (String) entry.getKey(); 
				product=memcached.get(key);
				logger.info("采购合同商品列表 "+key +" ---> "+product);
				//设置状态
				product.setStatus(status);
				product.setLedgerId(ledgerId);
				product.setCreater(creater);
				list.add(product);
			}
		}
		//释放资源
		key = null;
		product = null;
		return list;
	}
	 
	/**
	 * 获取采购合同支付详情列表
	 * @param ledgerId
	 * @param cacheKey
	 * @param status
	 * @return
	 */
	public static List<PurchaseContractPaymentGrd> getPurchaseContractPaymentGrdList(String creater,String ledgerId,String cacheKey,String status){
		List<PurchaseContractPaymentGrd> list = new ArrayList<PurchaseContractPaymentGrd>();
		
		Map<String, PurchaseContractPaymentGrd> memcached =(Map<String, PurchaseContractPaymentGrd>)MemcacheClient.get(cacheKey);
		String key = null; 
		PurchaseContractPaymentGrd payment =null;
		if(memcached!=null&&!memcached.isEmpty()&&memcached.size()>0){//表示缓存内容不为空
			Iterator iter = memcached.entrySet().iterator();
			while (iter.hasNext()) { 
				Map.Entry entry = (Map.Entry) iter.next();
				key = (String) entry.getKey(); 
				payment=memcached.get(key);
				logger.info("采购合同支付列表 "+key +" ---> "+payment);
				//设置状态
				payment.setStatus(status);
				payment.setLedgerId(ledgerId);
				payment.setCreater(creater);
				list.add(payment);
			}
		}
		//释放资源
		key = null;
		payment = null;
		return list;
	}
	/**
	 * 获取采购合同扫描件列表
	 * @param creater
	 * @param ledgerId
	 * @param cacheKey
	 * @param status
	 * @return
	 */
	public static List<ContractScanGrd> getPurchaseContractScanGrdList(String creater,String ledgerId,String cacheKey,String status){
		List<ContractScanGrd> list =new  ArrayList<ContractScanGrd>();
		Map<String,ContractScanGrd> memcached = (Map<String,ContractScanGrd>)MemcacheClient.get(cacheKey);
		String key  = null;
		ContractScanGrd scan =null;
		if(memcached!=null&&!memcached.isEmpty()&&memcached.size()>0){//表示缓存内容不为空
			Iterator iter = memcached.entrySet().iterator();
			while (iter.hasNext()) { 
				Map.Entry entry = (Map.Entry) iter.next();
				key = (String) entry.getKey(); 
				scan=memcached.get(key);
				logger.info("采购合同扫描列表 "+key +" ---> "+scan);
				//设置状态
				scan.setLedgerId(ledgerId);
				scan.setCreater(creater);
				list.add(scan);
			}
		}
		//释放资源
		key = null;
		scan = null;
		return list;
	}
}
