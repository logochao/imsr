package com.radius.invoicing.ibatis.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.invoicing.ibatis.dao.ContractScanGrdDao;
import com.radius.invoicing.ibatis.model.ContractScanGrd;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 合同扫描件列表Dao
 */

@Repository
public class ContractScanGrdDaoImpl extends BaseIbatisDaoImpl<ContractScanGrd> implements ContractScanGrdDao{

	private final String SQLMAPNAMESPACE="contractScanGrdSqlMap.";
	
	/**
	 * 获取合同扫描件列表通过主键
	 * @param contractId
	 * @param scanCode
	 * @return
	 */
	public ContractScanGrd  getContractScanGrdByPrimaryKey(String contractId,String scanCode){
		Map<String, String> param=new HashMap<String, String>();
		param.put("contractId", contractId);
		param.put("scanCode", scanCode);
		
		return (ContractScanGrd) this.getSqlMapClientTemplate().queryForObject(SQLMAPNAMESPACE+"getContractScanGrdByPk", param);
	}
	
	/**
	 * 根据条件获取合同扫描件列表
	 * @param contractScanGrd
	 * @return
	 */
	public List<ContractScanGrd> getContractScanGrdList(ContractScanGrd contractScanGrd){
		return this.getListObject(contractScanGrd, SQLMAPNAMESPACE+"getContractScanGrd");
	}
	
	/**
	 * 保存合同扫描件列表
	 * @param contractScanGrd
	 */
	public void insertContractScanGrd(ContractScanGrd contractScanGrd){
		this.insertObject(contractScanGrd, SQLMAPNAMESPACE+"insert");
	}
	
	/**
	 * 批量保存扫描件列表
	 * @param list
	 */
	public void batchInsertContractScanGrd(List<ContractScanGrd> list){
		this.batchInsertListObject(list, SQLMAPNAMESPACE+"insert");
	}
	
	/**
	 * 更新扫描件列表
	 * @param contractScanGrd
	 * @return
	 */
	public boolean updateContractScanGrdByPrimaryKey (ContractScanGrd contractScanGrd){
		return this.updateObject(contractScanGrd, SQLMAPNAMESPACE+"updateContractScanGrdByPK")==1;
	}
	/**
	 * 批量更新扫描件列表
	 * @param contractScanGrd
	 * @return
	 */
	public void batchUpdateContractScanGrdByPrimaryKey (List<ContractScanGrd> list){
		 this.updateListObject(list, SQLMAPNAMESPACE+"updateContractScanGrdByPK");
	}
	
	/**
	 * 删除扫描列表
	 * @param contractScanGrd
	 */
	public void deleteContractScanGrd(ContractScanGrd contractScanGrd){
		this.deleteObject(contractScanGrd, SQLMAPNAMESPACE+"deleteContractScanGrd");
	}
	/**
	 * 根据主键删除合同扫描列表
	 * @param contractId
	 * @param scanCode
	 * @return
	 */
	public boolean deleteContractScanGrdByPrimaryKey(String contractId,String scanCode){
		Map<String, String> param=new HashMap<String, String>();
		param.put("contractId", contractId);
		param.put("scanCode", scanCode);
		return this.getSqlMapClientTemplate().delete(SQLMAPNAMESPACE+"deleteContractScanGrdByPK", param)==1;
	}
	
	/**
	 * 批量删除扫描件列表
	 * @param list
	 */
	public void batchDeleteContractScanGrd(List<ContractScanGrd> list){
		this.batchDeleteListObject(list, SQLMAPNAMESPACE+"deleteContractScanGrd");
	}
}


