package com.radius.invoicing.contractmanage.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.radius.base.cache.memcache.MemcacheClient;
import com.radius.base.helper.PropertyConfigHelper;
import com.radius.base.page.EasyuiSplitPager;
import com.radius.base.utils.Constants;
import com.radius.base.utils.JsonUtils;
import com.radius.base.utils.StringUtils;
import com.radius.invoicing.contractmanage.compent.PurchaseContractCompent;
import com.radius.invoicing.contractmanage.service.PurchaseContractService;
import com.radius.invoicing.ibatis.dao.ContractScanGrdDao;
import com.radius.invoicing.ibatis.dao.GoodsDao;
import com.radius.invoicing.ibatis.dao.PurchaseContractDao;
import com.radius.invoicing.ibatis.dao.PurchaseContractGoodsGrdDao;
import com.radius.invoicing.ibatis.dao.PurchaseContractPaymentDao;
import com.radius.invoicing.ibatis.dao.PurchaseContractPaymentGrdDao;
import com.radius.invoicing.ibatis.dao.PurchaseOrderDao;
import com.radius.invoicing.ibatis.dao.PurchaseOrderGrdDao;
import com.radius.invoicing.ibatis.model.ContractScanGrd;
import com.radius.invoicing.ibatis.model.Goods;
import com.radius.invoicing.ibatis.model.PurchaseContract;
import com.radius.invoicing.ibatis.model.PurchaseContractGoodsGrd;
import com.radius.invoicing.ibatis.model.PurchaseContractPayment;
import com.radius.invoicing.ibatis.model.PurchaseContractPaymentGrd;
import com.radius.invoicing.ibatis.model.PurchaseOrder;
import com.radius.invoicing.ibatis.model.PurchaseOrderGrd;
import com.radius.invoicing.ibatis.model.SalesOrderGoodsGrd;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 采购合同Service
 */
@Service
@SuppressWarnings({"unchecked","static-access"})
public class PurchaseContractServiceImpl implements Constants, PurchaseContractService {

	private Logger logger=Logger.getLogger(this.getClass());
	
	@Autowired(required=false)
	@Qualifier("goodsDaoImpl")
	private GoodsDao goodsDao;
	
	@Autowired(required=false)
	@Qualifier("purchaseOrderDaoImpl")
	private PurchaseOrderDao purchaseOrderDao;
	
	@Autowired(required=false)
	@Qualifier("purchaseOrderGrdDaoImpl")
	private PurchaseOrderGrdDao purchaseOrderGrdDao;
	
	@Autowired(required=false)
	@Qualifier("propertyConfigHelper")
	private PropertyConfigHelper propertyConfigHelper;
	
	@Autowired(required=false)
	@Qualifier("purchaseContractDaoImpl")
	private PurchaseContractDao purchaseContractDao;
	
	@Autowired(required=false)
	@Qualifier("purchaseContractPaymentDaoImpl")
	private PurchaseContractPaymentDao purchaseContractPaymentDao;
	
	@Autowired(required=false)
	@Qualifier("purchaseContractPaymentGrdDaoImpl")
	private PurchaseContractPaymentGrdDao purchaseContractPaymentGrdDao;
	
	@Autowired(required=false)
	@Qualifier("purchaseContractGoodsGrdDaoImpl")
	private PurchaseContractGoodsGrdDao purchaseContractGoodsGrdDao;
	
	@Autowired(required=false)
	@Qualifier("contractScanGrdDaoImpl")
	private ContractScanGrdDao contractScanGrdDao;
	
	/**
	 * 通过商品信息+供应商编号、采购订单号获取采购订单信息
	 * @param goods
	 * @param purchaseOrderId
	 * @return
	 * @throws Exception
	 */
	public EasyuiSplitPager<PurchaseOrder> getPurchaseOrderInfon2Goods(Goods goods,String purchaseOrderId)throws Exception{
		EasyuiSplitPager<PurchaseOrder> pager = new EasyuiSplitPager<PurchaseOrder>();
		List<String> goodsIdList= goodsDao.getGoodsInfoBySupplierAndGoods(goods);
		String goodsIds=StringUtils.ArrayList2SQLString(goodsIdList, ",");
		if(goodsIds.length()>0){
			List<PurchaseOrder>  list = purchaseOrderDao.getPurchaseOrderByGoodsIds(purchaseOrderId, goodsIds);
			pager.setRows(list);
			pager.setTotal(list.size());
		}
		return pager;
	}
	/**
	 * 采购额合同商品信息缓存
	 * @param key
	 * @param purchaseContractGoodsGrd
	 * @return
	 * @throws Exception
	 */
	
	public JsonUtils addPurchaseContractGoodsGrd2Memcached(String key,PurchaseContractGoodsGrd purchaseContractGoodsGrd)throws Exception{
		Map<String,PurchaseContractGoodsGrd> memcache=null;
		Object cache=MemcacheClient.get(key);
		String mapKey=purchaseContractGoodsGrd.getContractId()+"_"+purchaseContractGoodsGrd.getGoodsId();//采购合同号_商品编号
		if(cache!=null){
			memcache=(HashMap<String, PurchaseContractGoodsGrd>)cache;
			PurchaseContractGoodsGrd goods=memcache.get(key);
			if(goods!=null){//更新map对象
				goods.setAmount(purchaseContractGoodsGrd.getAmount());
				goods.setQuantityUnit(purchaseContractGoodsGrd.getQuantityUnit());
				logger.error("key "+key+",已经将其缓存在对象中 "+cache);
				goods=purchaseContractGoodsGrd;
			}
		}else{
			memcache = new  HashMap<String, PurchaseContractGoodsGrd>();
		}
		memcache.put(mapKey, purchaseContractGoodsGrd);
		MemcacheClient.set(key, memcache, CACHE_ONE_HOURE_TIME);//将带缓存的对象进行写入
		return new JsonUtils (true,"将采购合同商品缓存到内存中成功....");
	}
	
	/**
	 * 移除缓存中采购合同商品信息
	 * @param key
	 * @param delete
	 * @param contractGoodsGrd
	 * @return
	 * @throws Exception
	 */
	public JsonUtils removePurchaseContractGoodsGrd2Memcached(String key,boolean delete,PurchaseContractGoodsGrd contractGoodsGrd)throws Exception{
		JsonUtils jsonUtils =new  JsonUtils();
		//		默认
		jsonUtils.setSuccess(false);
		jsonUtils.setMessage("不存在对应的缓存对象");
		if(delete){//全部删除
			MemcacheClient.delete(key);
			jsonUtils.setSuccess(true);
			jsonUtils.setMessage("删除缓存对象成功...");
			return jsonUtils;
		}
		String memo=contractGoodsGrd.getMemo();//该字段存放带删除的主键信息
		Map<String,SalesOrderGoodsGrd> memcache=null;

		
		Object cache=MemcacheClient.get(key);
		if(cache!=null){
			String mapKey=null;
			if(memo.contains(",")){
				for(String goodsId:memo.split(",")){
					mapKey=contractGoodsGrd.getContractId()+"_"+goodsId;//采购合同订单号_商品编号
					memcache.remove(mapKey);//将key对应的对象进行删除
				}
			}else{
				mapKey=contractGoodsGrd.getContractId()+"_"+memo;//采购合同号_商品编号
				memcache.remove(mapKey);//将key对应的对象进行删除
			}
			jsonUtils.setSuccess(true);
			jsonUtils.setMessage("删除缓存对象成功...");
		}
		MemcacheClient.set(key, memcache, CACHE_ONE_HOURE_TIME);//将带缓存的对象进行写入
		return jsonUtils;
	}
	
	
	/**
	 * 采购合同扫描件信息缓存
	 * @param key
	 * @param purchaseContractGoodsGrd
	 * @return
	 * @throws Exception
	 */
	
	public JsonUtils addPurchaseContractScanGrd2Memcached(String key,ContractScanGrd scan)throws Exception{
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
	 * 删除memcache中的合同扫描件信息对象
	 * @param key
	 * @param scan
	 * @param delete
	 * @return
	 */
	public JsonUtils removeContractScanInfo2Memcache(String key,ContractScanGrd scan,boolean delete){
		JsonUtils jsonUtils=new JsonUtils();
		jsonUtils.setSuccess(false);
		jsonUtils.setMessage("合同扫描件不存在对应的缓存对象");
		
		if(delete){//全部删除
			MemcacheClient.delete(key);
			jsonUtils.setSuccess(true);
			jsonUtils.setMessage("删除缓存对象成功...");
			return jsonUtils;
		}
		
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
		}
		MemcacheClient.set(key, memcache, CACHE_ONE_HOURE_TIME);//将带缓存的对象进行写入
		return jsonUtils;
	}
	
	/**
	 * 采购合同扫描件信息缓存
	 * @param key
	 * @param purchaseContractGoodsGrd
	 * @return
	 * @throws Exception
	 */
	public JsonUtils addPurchaseContractPaymentGrd2Memcached(String key,PurchaseContractPaymentGrd grd)throws Exception{
		Map<String,PurchaseContractPaymentGrd> memcache=null;
		Object cache=MemcacheClient.get(key);
		String mapKey=grd.getContractId()+"_"+grd.getBatch();
		if(cache!=null){
			memcache=(Map<String,PurchaseContractPaymentGrd>)cache;
			@SuppressWarnings("unused")
			PurchaseContractPaymentGrd temp=memcache.get(grd.getContractId()+"_"+grd.getBatch());//根据(合同号_批次号）
			if(grd!=null){//对象存在则将对象进行更新处理，否则直接添加到Map对象
				logger.info("存在相同的缓存对象，暂时不对其进行处理");
				//1.暂时不处理
				//2.将新对象替换旧对象
				logger.error("key "+key+",已经将其缓存在对象中 "+cache);
			}
		}else{
			memcache = new HashMap<String, PurchaseContractPaymentGrd>();
		}
		memcache.put(mapKey, grd);
		MemcacheClient.set(key, memcache, CACHE_ONE_HOURE_TIME);//将带缓存的对象进行写入
		JsonUtils result=new JsonUtils (true,"将采购合同支付详情缓存到内存中成功....");
		return result;
	}
	
	/**
	 * 删除memcache中的合同支付信息对象
	 * @param key
	 * @param contractPaymentGrd
	 * @param delete
	 * @return
	 */
	public JsonUtils removePurchaseContractPaymentGrd2Memcache(String key,PurchaseContractPaymentGrd contractPaymentGrd,boolean delete){
		JsonUtils jsonUtils=new JsonUtils();
		jsonUtils.setSuccess(false);
		jsonUtils.setMessage("采购合同支付详情不存在对应的缓存对象");
		
		if(delete){//全部删除
			MemcacheClient.delete(key);
			jsonUtils.setSuccess(true);
			jsonUtils.setMessage("删除缓存对象成功...");
			return jsonUtils;
		}
		
		String memo=contractPaymentGrd.getMemo();//该字段存放带删除的主键信息
		Map<String,PurchaseContractPaymentGrd> memcache=null;
		Object cache=MemcacheClient.get(key);
		if(cache!=null){
			memcache=(Map<String,PurchaseContractPaymentGrd>)cache;
			String mapKey=null;
			if(memo.contains(",")){//表示需要删除多行数据
				for(String batchNo:memo.split(",")){
					mapKey=contractPaymentGrd.getContractId()+"_"+batchNo; //合同号_文件编号
					memcache.remove(mapKey);//将key对应的对象进行删除
				}
			}else{
				mapKey=contractPaymentGrd.getContractId()+"_"+memo;
				memcache.remove(mapKey);//将key对应的对象进行删除
			}
			jsonUtils.setSuccess(true);
			jsonUtils.setMessage("采购合同支付详情删除缓存对象成功...");
		}
		MemcacheClient.set(key, memcache, CACHE_ONE_HOURE_TIME);//将带缓存的对象进行写入
		return jsonUtils;
	}
	
	/**
	 * 获取采购订单商品信息
	 * @param purchaseOrderId
	 * @return
	 */
	public EasyuiSplitPager<PurchaseOrderGrd> getPurchaseOrderProductInfo(String purchaseOrderId){
		EasyuiSplitPager<PurchaseOrderGrd> pager = new EasyuiSplitPager<PurchaseOrderGrd>();
		PurchaseOrderGrd purchaseOrderGrd =null;
		if(org.apache.commons.lang.StringUtils.isNotBlank(purchaseOrderId)){
			purchaseOrderGrd = new PurchaseOrderGrd();
			purchaseOrderGrd.setPurchaseOrderId(purchaseOrderId);
		}
		if(purchaseOrderGrd!=null){
			List<PurchaseOrderGrd> list =  purchaseOrderGrdDao.getPurchaseOrderGrd(purchaseOrderGrd);
			if(list!=null&&!list.isEmpty()&&list.size()>0){
				pager.setRows(list);
				pager.setTotal(list.size());
			}
		}
		return pager;
	}
	
	/**
	 * 保存采购合同信息
	 * @param statusCode 重置当前界面合同目标状态
	 * @param purchaseContract
	 * @param payment
	 * @param productKey
	 * @param payKey
	 * @param scanKey
	 * @return
	 * @throws Exception
	 */
	public JsonUtils savePurchaseContractInfo(String statusCode,PurchaseContract purchaseContract,PurchaseContractPayment payment,String productKey,String payKey,String scanKey)throws Exception{
		String operater=purchaseContract.getCreater();
		String ledgerId =purchaseContract.getLedgerId();
		String status = purchaseContract.getStats();
		String contractId= purchaseContract.getId();
		boolean success=false;
		String message="操作失败";
		String code="-1";
		try{
			//--------------------------简查采购合同信息------------------------------
			PurchaseContract temp =  purchaseContractDao.getPurchaseContractById(purchaseContract.getId());
			if(temp==null){//添加相关对象
				//---------------构建对象--------------
				//1.采购合同
				//2.采购商品列表
				List<PurchaseContractGoodsGrd>  productList=PurchaseContractCompent.getPurchaseContractGoodsGrdList(operater,ledgerId, productKey, status);
				//3.采购支付
				//payment
				payment.setLedgerId(ledgerId);
				payment.setCreater(operater);
				//4.采购支付详情
				List<PurchaseContractPaymentGrd> paymentList = PurchaseContractCompent.getPurchaseContractPaymentGrdList(operater,ledgerId, payKey, status);
				//5.采购合同扫描件
				List<ContractScanGrd> scanList = PurchaseContractCompent.getPurchaseContractScanGrdList(operater, ledgerId, scanKey, status);
				//--------------------------保存采购合同相关数据---------------------------
				purchaseContractDao.insertPurchaseContract(purchaseContract);//采购合同
				purchaseContractGoodsGrdDao.batchInsertPurchaseContractGoodsGrd(productList);//采购合同商品
				purchaseContractPaymentDao.insertPurchaseContractPayment(payment);//采购支付
				purchaseContractPaymentGrdDao.batchInsertPurchaseContractPaymentGrd(paymentList);//采购支付详情
				contractScanGrdDao.batchInsertContractScanGrd(scanList);//合同扫描件
				
				logger.info("保存采购合同相关数据操作成功...");
				success = true;
				message="添加采购合同信息操作成功...";
				code=statusCode;
			}else if(temp!=null){//更新相关对象
				//--------------------------保存采购合同相关数据---------------------------
				//更新状态
				
				//采购合同
				purchaseContract.setReviser(operater);
				purchaseContractDao.updatePurchaseContractStatusById(purchaseContract);
				//采购商品
				PurchaseContractGoodsGrd product =new PurchaseContractGoodsGrd();
				product.setContractId(contractId);
				product.setStats(status);
				product.setReviser(operater);
				purchaseContractGoodsGrdDao.updatePurchaseContractGoodsGrdStatusByContractId(product);
				//采购支付(****支付合同应该与当前合同状态有关)
				PurchaseContractPayment payment2=new PurchaseContractPayment();
				payment2.setContractId(contractId);
				payment2.setStats(status);
				payment2.setReviser(operater);
				purchaseContractPaymentDao.updateStatusByContractId(payment);
				//采购支付详情
				PurchaseContractPaymentGrd paymentGrd =new PurchaseContractPaymentGrd();
				paymentGrd.setContractId(contractId);
				paymentGrd.setStats(status);
				paymentGrd.setReviser(operater);
				purchaseContractPaymentGrdDao.updatePurchaseContractPaymentGrdStatusBycontractId(paymentGrd);
				//合同扫描件
				success=true;
				message="更新销售合同相关信息成功!!!";
				logger.info(message);
			}
			if(success){
				//--------------------------情况采购合同相关的缓存对象---------------------
				//删除合同销售商品
				MemcacheClient.delete(productKey);
				//删除支付列表
				MemcacheClient.delete(payKey);
				//删除扫描件列表
				MemcacheClient.delete(scanKey);
			}
		}catch(Exception e){
			logger.error(e);
			e.printStackTrace();
		}
		//--------------------------返回操作结果 -----------------------------------
		JsonUtils result = new  JsonUtils(success,message);
		result.setChild(code);
		return result;
	}
}
