/**
 * 
 */
package com.radius.invoicing.ibatis.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.invoicing.ibatis.dao.SaleQuotationDao;
import com.radius.invoicing.ibatis.model.SaleQuotation;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 销售报价Dao
 */
@Repository
public class SaleQuotationDaoImpl extends BaseIbatisDaoImpl<SaleQuotation> implements SaleQuotationDao{

	private final String SQLMAPNAMESPACE="saleQuotationSqlMap"; 
	
	/**
	 * 根据主键获取销售报价
	 * @param id
	 * @return
	 */
	public SaleQuotation getSaleQuotationById(String id){
		return this.getObjectByCondition(id, SQLMAPNAMESPACE+".getSaleQuotationById");
	}
	
	/**
	 * 通过条件查询销售报价
	 * @param saleQuotation
	 * @return
	 */
	public List<SaleQuotation> getSaleQuotationByCondition(SaleQuotation saleQuotation){
		return this.getListObject(saleQuotation, SQLMAPNAMESPACE+".getSaleQuotationByCondition");
	}
	
	/**
	 * 保存销售报价
	 * @param saleQuotation
	 */
	public void insertSaleQuotation(SaleQuotation saleQuotation){
		this.insertObject(saleQuotation, SQLMAPNAMESPACE+".insert");
	}
	
	/**
	 * 更新销售报价
	 * @param saleQuotation
	 * @return
	 */
	public boolean updateSaleQuotationById(SaleQuotation saleQuotation){
		return this.updateObject(saleQuotation, SQLMAPNAMESPACE+".updateSaleQuotationById")==1;
	}
	
	/**
	 * 删除销售报价
	 * @param saleQuotation
	 */
	public void deleteSaleQuotation(SaleQuotation saleQuotation){
		this.deleteObject(saleQuotation, SQLMAPNAMESPACE+".deleteSaleQuotation");
	}
}
