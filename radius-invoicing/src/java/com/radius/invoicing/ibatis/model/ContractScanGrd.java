package com.radius.invoicing.ibatis.model;
/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 合同扫描件列表
 */
public class ContractScanGrd extends ExtInfo{

	private String contractId;//合同编号
	private Integer contractType;//合同类型
	private String scanCode;//扫描件编号
	private String fileName;//扫描件名称
	private String filePath;//文件存放路径
	private String fileOrder;//文件顺序
	private Integer quantity;//扫描件总数量
	private String ledgerId="";
	private String memo;//描述
	
	
	public ContractScanGrd() {
	}
	
	//组合主键构造函数
	public ContractScanGrd(String contractId, String scanCode) {
		super();
		this.contractId = contractId;
		this.scanCode = scanCode;
	}

	public String getContractId() {
		return contractId;
	}

	public void setContractId(String contractId) {
		this.contractId = contractId;
	}

	public Integer getContractType() {
		return contractType;
	}

	public void setContractType(Integer contractType) {
		this.contractType = contractType;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileOrder() {
		return fileOrder;
	}

	public void setFileOrder(String fileOrder) {
		this.fileOrder = fileOrder;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getScanCode() {
		return scanCode;
	}

	public void setScanCode(String scanCode) {
		this.scanCode = scanCode;
	}

	public String getLedgerId() {
		return ledgerId;
	}

	public void setLedgerId(String ledgerId) {
		this.ledgerId = ledgerId;
	}
	
}
