package com.radius.invoicing.ibatis.dao;

import java.util.List;

import com.radius.invoicing.ibatis.model.ContractScanGrd;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public interface ContractScanGrdDao {

	/**
	 * 获取合同扫描件列表通过主键
	 * @param contractId
	 * @param scanCode
	 * @return
	 */
	public ContractScanGrd getContractScanGrdByPrimaryKey(String contractId,
			String scanCode);

	/**
	 * 根据条件获取合同扫描件列表
	 * @param contractScanGrd
	 * @return
	 */
	public List<ContractScanGrd> getContractScanGrdList(
			ContractScanGrd contractScanGrd);

	/**
	 * 保存合同扫描件列表
	 * @param contractScanGrd
	 */
	public void insertContractScanGrd(ContractScanGrd contractScanGrd);

	/**
	 * 批量保存扫描件列表
	 * @param list
	 */
	public void batchInsertContractScanGrd(List<ContractScanGrd> list);

	/**
	 * 更新扫描件列表
	 * @param contractScanGrd
	 * @return
	 */
	public boolean updateContractScanGrdByPrimaryKey(
			ContractScanGrd contractScanGrd);

	/**
	 * 批量更新扫描件列表
	 * @param contractScanGrd
	 * @return
	 */
	public void batchUpdateContractScanGrdByPrimaryKey(
			List<ContractScanGrd> list);

	/**
	 * 删除扫描列表
	 * @param contractScanGrd
	 */
	public void deleteContractScanGrd(ContractScanGrd contractScanGrd);

	/**
	 * 根据主键删除合同扫描列表
	 * @param contractId
	 * @param scanCode
	 * @return
	 */
	public boolean deleteContractScanGrdByPrimaryKey(String contractId,
			String scanCode);

	/**
	 * 批量删除扫描件列表
	 * @param list
	 */
	public void batchDeleteContractScanGrd(List<ContractScanGrd> list);

}