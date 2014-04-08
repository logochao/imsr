package com.radius.invoicing.contractmanage.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.radius.base.cache.memcache.MemcacheClient;
import com.radius.base.helper.PropertyConfigHelper;
import com.radius.base.page.EasyuiSplitPager;
import com.radius.base.utils.Constants;
import com.radius.base.utils.JsonUtils;
import com.radius.invoicing.contractmanage.compent.SalesContractCom;
import com.radius.invoicing.contractmanage.service.SalesContractService;
import com.radius.invoicing.ibatis.dao.ContractScanGrdDao;
import com.radius.invoicing.ibatis.dao.SalesContractDao;
import com.radius.invoicing.ibatis.dao.SalesContractGoodsGrdDao;
import com.radius.invoicing.ibatis.dao.SalesContractPaymentDao;
import com.radius.invoicing.ibatis.dao.SalesContractPaymentGrdDao;
import com.radius.invoicing.ibatis.model.ContractScanGrd;
import com.radius.invoicing.ibatis.model.SalesContract;
import com.radius.invoicing.ibatis.model.SalesContractGoodsGrd;
import com.radius.invoicing.ibatis.model.SalesContractPayment;
import com.radius.invoicing.ibatis.model.SalesContractPaymentGrd;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 销售合同service
 */
@Service
@SuppressWarnings("unchecked")
public class SalesContractServiceImpl implements SalesContractService,Constants {

	
	private Logger logger=Logger.getLogger(this.getClass());
	
	private JsonUtils jsonUtils=null;
	
	@Autowired(required=false)
	@Qualifier("salesContractDaoImpl")
	private SalesContractDao salesContractDao;
	
	@Autowired(required=false)
	@Qualifier("salesContractPaymentGrdDaoImpl")
	private SalesContractPaymentGrdDao contractPaymentGrdDao;
	
	@Autowired(required=false)
	@Qualifier("salesContractPaymentDaoImpl")
	private SalesContractPaymentDao contractPaymentDao;
	
	@Autowired(required=false)
	@Qualifier("salesContractGoodsGrdDaoImpl")
	private SalesContractGoodsGrdDao salesContractGoodsGrdDao;
	
	@Autowired(required=false)
	@Qualifier("contractScanGrdDaoImpl")
	private ContractScanGrdDao contractScanGrdDao;
	
	@Autowired(required=false)
	@Qualifier("propertyConfigHelper")
	private PropertyConfigHelper propertyConfigHelper;
	
	@PostConstruct
	public void init(){
		if(jsonUtils==null){
			jsonUtils=new JsonUtils();
		}
	}
	
	@PreDestroy
	public void destroy(){
		if(jsonUtils!=null){
			jsonUtils=null;
		}
	}
	
	/**
	 * 将对象缓存到memcache中
	 * @param key
	 * @param obj
	 */
	public void addObject2Memcache(String key,Object obj){
		Object cache=MemcacheClient.get(key);
		if(cache!=null){
			logger.error("key "+key+",已经将其缓存在对象中 "+cache);
		}
		MemcacheClient.set(key, obj,this.CACHE_ONE_HOURE_TIME );//将带缓存的对象进行写入
	}
	/**
	 * 将memcache中的缓存对象进行删除
	 * @param key
	 * @return
	 */
	public boolean deleteObject2Memcache(String key){
		Object cache=MemcacheClient.get(key);
		if(cache!=null){
			logger.error("缓存对象存在...."+cache);
			MemcacheClient.delete(key);
			logger.error("缓存对象已经删除....");
			return true;
		}
		logger.error("缓存对象不存在, key "+key);
		return false;
	}
	/**
	 * 将制定的进行缓存 memcache 合同编号_---->Map<合同号_批次号,支付详情>
	 * @param key
	 * @param payment
	 * @return  
	 */
	public boolean addObject2MemcacheByPayDetail(String key,SalesContractPaymentGrd payment){
		Map<String,SalesContractPaymentGrd> memcache=null;
		
		Object cache=MemcacheClient.get(key);
		String mapKey=payment.getContractId()+"_"+payment.getBatch();
		if(cache!=null){
			memcache=(Map<String,SalesContractPaymentGrd>)cache;
			@SuppressWarnings("unused")
			SalesContractPaymentGrd grd=memcache.get(payment.getContractId()+"_"+payment.getBatch());//根据(合同号_批次号）
			if(grd!=null){//对象存在则将对象进行更新处理，否则直接添加到Map对象
				logger.info("存在相同的缓存对象，暂时不对其进行处理");
				//1.暂时不处理
				//2.将新对象替换旧对象
				logger.error("key "+key+",已经将其缓存在对象中 "+cache);
			}
		}else{
			memcache = new HashMap<String, SalesContractPaymentGrd>();
		}
		memcache.put(mapKey, payment);
		MemcacheClient.set(key, memcache, CACHE_ONE_HOURE_TIME);//将带缓存的对象进行写入
		return true;
	}
	/**
	 * 将销售合同商品列表进行缓存 memcache 合同编号_---->Map<合同号_商品编号,销售商品信息>
	 * @param key
	 * @param payment
	 * @return  
	 */
	public JsonUtils addSalesContractProductInfo2Memcache(String key,SalesContractGoodsGrd goods){
		Map<String,SalesContractGoodsGrd> memcache=null;
		
		Object cache=MemcacheClient.get(key);
		String mapKey=goods.getContractId()+"_"+goods.getGoodsId();
		if(cache!=null){
			memcache=(Map<String,SalesContractGoodsGrd>)cache;
			@SuppressWarnings("unused")
			SalesContractGoodsGrd grd=memcache.get(mapKey);//根据(合同号_商品编号）
			if(grd!=null){//更新map对象
				logger.info("销售合同商品存在相同的缓存对象，暂时不对其进行处理");
				//更新金额与数量
				grd.setAmount(goods.getAmount());
				grd.setQuantityUnit(goods.getQuantityUnit());
				logger.error("key "+key+",已经将其缓存在对象中 "+cache);
				goods=grd;
			}
		}else{
			memcache = new HashMap<String, SalesContractGoodsGrd>();
		}
		memcache.put(mapKey, goods);
		MemcacheClient.set(key, memcache, CACHE_ONE_HOURE_TIME);//将带缓存的对象进行写入
		return new JsonUtils (true,"将销售合同商品缓存到内存中成功....");
	}
	
	/**
	 * 删除memcache中的缓存对象
	 * @param key
	 * @param payment
	 * @return
	 */
	public JsonUtils removeObject2MemcacheByPayDetail(String key,SalesContractPaymentGrd payment){
//		JsonUtils jsonUtils=new JsonUtils();
		String memo=payment.getMemo();//该字段存放带删除的主键信息
		Map<String,SalesContractPaymentGrd> memcache=null;
		Object cache=MemcacheClient.get(key);
		if(cache!=null){
			memcache=(Map<String,SalesContractPaymentGrd>)cache;
			String mapKey=null;
			if(memo.contains(",")){//表示需要删除多行数据
				for(String batch:memo.split(",")){
					mapKey=payment.getContractId()+"_"+batch;
					memcache.remove(mapKey);//将key对应的对象进行删除
				}
			}else{
				mapKey=payment.getContractId()+"_"+memo;
				memcache.remove(mapKey);//将key对应的对象进行删除
			}
			jsonUtils.setSuccess(true);
			jsonUtils.setMessage("删除缓存对象成功...");
		}else{
			jsonUtils.setSuccess(false);
			jsonUtils.setMessage("不存在对应的缓存对象");
		}
		MemcacheClient.set(key, memcache, CACHE_ONE_HOURE_TIME);//将带缓存的对象进行写入
		return jsonUtils;
	}
	/**
	 * 删除memcache中的缓存对象
	 * @param key
	 * @param payment
	 * @return
	 */
	public JsonUtils removeSalesContractProductInfo2Memcache(String key,SalesContractGoodsGrd goods){
//		JsonUtils jsonUtils=new JsonUtils();
		String memo=goods.getMemo();//该字段存放带删除的主键信息
		Map<String,SalesContractGoodsGrd> memcache=null;
		Object cache=MemcacheClient.get(key);
		if(cache!=null){
			memcache=(Map<String,SalesContractGoodsGrd>)cache;
			String mapKey=null;
			if(memo.contains(",")){//表示需要删除多行数据
				for(String batch:memo.split(",")){
					mapKey=goods.getContractId()+"_"+batch;
					memcache.remove(mapKey);//将key对应的对象进行删除
				}
			}else{
				mapKey=goods.getContractId()+"_"+memo;
				memcache.remove(mapKey);//将key对应的对象进行删除
			}
			jsonUtils.setSuccess(true);
			jsonUtils.setMessage("销售合同商品删除缓存对象成功...");
		}else{
			jsonUtils.setSuccess(false);
			jsonUtils.setMessage("销售合同商品不存在对应的缓存对象");
		}
		MemcacheClient.set(key, memcache, CACHE_ONE_HOURE_TIME);//将带缓存的对象进行写入
		return jsonUtils;
	}
	
	/**
	 * 添加销售合同扫描件列表到memcache中
	 * @param key
	 * @param scan
	 * @return
	 */
	@SuppressWarnings("static-access")
	public JsonUtils addContractScanInfo2Memcache(String key,ContractScanGrd scan){
		Map<String,ContractScanGrd> memcache=null;
		
		Object cache=MemcacheClient.get(key);
		String mapKey=scan.getContractId()+"_"+scan.getScanCode();//合同编号_文件编号
		if(cache!=null){
			memcache=(Map<String,ContractScanGrd>)cache;
			@SuppressWarnings("unused")
			ContractScanGrd grd=memcache.get(mapKey);//根据(合同号_文件编号）
			if(grd!=null){//更新map对象
				logger.info("合同扫描件 存在相同的缓存对象，暂时不对其进行处理");
				logger.error("key "+key+",已经将其缓存在对象中 "+cache);
//				scan=grd;
			}
		}else{
			memcache = new HashMap<String, ContractScanGrd>();
		}
		Object path=propertyConfigHelper.getPropertyValue("contract.image.file.path");
		if(path!=null){
			path=propertyConfigHelper.getPropertyValue("contract.image.file.web.path");
		}
		memcache.put(mapKey, scan);
		MemcacheClient.set(key, memcache, CACHE_ONE_HOURE_TIME);//将带缓存的对象进行写入
		JsonUtils result=new JsonUtils (true,"将合同扫描件缓存到内存中成功....");
		result.setChild(path);
		return result;
	}
	
	
	/**
	 * 删除memcache中的缓存对象
	 * @param key
	 * @param payment
	 * @return
	 */
	public JsonUtils removeContractScanInfo2Memcache(String key,ContractScanGrd scan){
//		JsonUtils jsonUtils=new JsonUtils();
		String memo=scan.getMemo();//该字段存放带删除的主键信息
		Map<String,ContractScanGrd> memcache=null;
		Object cache=MemcacheClient.get(key);
		if(cache!=null){
			memcache=(Map<String,ContractScanGrd>)cache;
			String mapKey=null;
			if(memo.contains(",")){//表示需要删除多行数据
				for(String scanCode:memo.split(",")){
					mapKey=scan.getContractId()+"_"+scanCode; //合同号_文件编号
					memcache.remove(mapKey);//将key对应的对象进行删除
				}
			}else{
				mapKey=scan.getContractId()+"_"+memo;
				memcache.remove(mapKey);//将key对应的对象进行删除
			}
			jsonUtils.setSuccess(true);
			jsonUtils.setMessage("合同扫描件删除缓存对象成功...");
		}else{
			jsonUtils.setSuccess(false);
			jsonUtils.setMessage("合同扫描件不存在对应的缓存对象");
		}
		MemcacheClient.set(key, memcache, CACHE_ONE_HOURE_TIME);//将带缓存的对象进行写入
		return jsonUtils;
	}
	
	/**
	 * 保存销售合同信息
	 * @param salesContract
	 * @param goodsMemcacheKey
	 * @param paymentMemcacheKey
	 * @param scansMemecacheKey
	 * @param payment
	 * @return
	 */
	public JsonUtils saveSalesContractInfos(String ledgerId,SalesContract salesContract,String goodsMemcacheKey,String paymentMemcacheKey,String scansMemecacheKey,SalesContractPayment payment)throws Exception{
		boolean success=false;
		String message="操作失败";
		String code="-1";
//		try{
				//1.通过memcache获取所有带保存的对象
				//2.构建相关的待保存对象
				salesContract.setLedgerId(ledgerId);
				//销售合同商品
				List<SalesContractGoodsGrd> goodsList=SalesContractCom.getSalesContractGoodsGrdByRequest(ledgerId,goodsMemcacheKey, salesContract.getId(), salesContract.getStatus());
				//合同支付
		//		SalesContractPayment payment = SalesContractCom.getSalesContractPaymentByRequest(request, salesContract.getId());
				//合同支付列表
				List<SalesContractPaymentGrd> paymentsList = SalesContractCom.getSalesContractPaymentGrdByRequest(salesContract.getId(),ledgerId, paymentMemcacheKey, salesContract.getStatus());
				//保函条款
				
				//合同扫描件列表
				List<ContractScanGrd> scansList = SalesContractCom.getContractScanGrdsByRequest(salesContract.getId(), scansMemecacheKey);
				//3.根据当前提供的合同编号，判断数据库中是否存在对用的合同信息
				SalesContract temp=salesContractDao.getSalesContractById(salesContract.getId());
				if(temp==null){//添加//3.2 不存在则调用insert
					//添加销售合同
					salesContractDao.insertSalesContract(salesContract);
					//添加销售合同商品列表
					salesContractGoodsGrdDao.batchInsertSalesContractGoodsGrd(goodsList);
					
					//添加支付		
					contractPaymentDao.insertSalesContractPayment(payment);
					//添加支付列表
					contractPaymentGrdDao.batchInsertSalesContractPaymentGrd(paymentsList);
					//添加合同扫描件列表
					contractScanGrdDao.batchInsertContractScanGrd(scansList);
					success=true;
					message="添加销售合同相关信息成功!!!";
					code="1";
					logger.info(message);
				}else if(temp!=null){////3.1 存在则调用更新对象 只更新对应的状态值和修改时间
					String status=salesContract.getStatus();
					String contractId=salesContract.getId();
					//保存销售合同
					//salesContractDao.updateSalesContractById(salesContract);
					salesContractDao.updateSalesContractStatusById(salesContract);
					//销售合同商品列表
					SalesContractGoodsGrd goodsGrd=new SalesContractGoodsGrd();
					goodsGrd.setStatus(status);
					goodsGrd.setContractId(contractId);
					salesContractGoodsGrdDao.updateSalesContractGoodsGrdStatusByContractId(goodsGrd);
					
					//保存支付		
					SalesContractPayment salesContractPayment=new SalesContractPayment();
					salesContractPayment.setContractId(contractId);
					salesContractPayment.setStatus(status);
					contractPaymentDao.updateSalesContractPaymentStatusByContractId(salesContractPayment);
					//保存支付列表
					SalesContractPaymentGrd paymentGrd=new SalesContractPaymentGrd();
					paymentGrd.setContractId(contractId);
					paymentGrd.setStatus(status);
					
					contractPaymentGrdDao.updateSalesContractPaymentGrdStatusBycontractId(paymentGrd);
					//保存合同扫描件列表
					contractScanGrdDao.batchUpdateContractScanGrdByPrimaryKey(scansList);
					success=true;
					message="更新销售合同相关信息成功!!!";
					logger.info(message);
					code="0";
				}
				
				if(success){
					//4.清理memcache缓存对象
					//4.1 删除合同销售商品
					MemcacheClient.delete(goodsMemcacheKey);
					//4.2 删除支付列表
					MemcacheClient.delete(paymentMemcacheKey);
					//4.3 删除扫描件列表
					MemcacheClient.delete(scansMemecacheKey);
				}
				
//		}catch(Exception e){
//			logger.error(e);
//			e.printStackTrace();
//			throw new RuntimeException(e);
//		}
		//5.返回json对象
				JsonUtils result = new  JsonUtils(success,message);
				result.setChild(code);
		return result;
	}
	
	/**
	 * 通过客户编号获取销售合同信息
	 * @param salesContract
	 * @return
	 */
	public EasyuiSplitPager<SalesContract> getSalesContractByCustomerId(SalesContract salesContract){
		EasyuiSplitPager<SalesContract> pager=new EasyuiSplitPager<SalesContract>();
		List<SalesContract> list= salesContractDao.getSalesContractByCustomerId(salesContract);
		pager.setRows(list);
		if(list!=null&&!list.isEmpty()){
			pager.setTotal(list.size());
		}
		return pager;
	}
	
	/**
	 * 通过SalesContractGoodsGrd 条件进行查询 获取销售商品列表
	 * @param salesContractGoodsGrd
	 * @return
	 */
	public EasyuiSplitPager<SalesContractGoodsGrd> getSalesContractGoodsGrd(SalesContractGoodsGrd salesContractGoodsGrd){
		EasyuiSplitPager<SalesContractGoodsGrd> pager=new EasyuiSplitPager<SalesContractGoodsGrd>();
		List<SalesContractGoodsGrd> list=salesContractGoodsGrdDao.getSalesContractGoodsGrd(salesContractGoodsGrd);
		pager.setRows(list);
		if(list!=null&&!list.isEmpty()){
			pager.setTotal(list.size());
		}
		return pager;
	}
}
