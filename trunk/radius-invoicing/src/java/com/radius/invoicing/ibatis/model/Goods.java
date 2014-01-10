/**
 * 
 */
package com.radius.invoicing.ibatis.model;

import java.util.Date;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 销售商品信息
 */
public class Goods extends ExtInfo{

	private String  id="";//商品编号
	private String  name="";//商品名称
	private String  property="";//商品性质
	private String  categoryId="";//分类码
	private String  categoryName="";//分类名称
	private String  series="";//商品系列
	private String  unit="";//单位
	private String  place="";//产地
	private String  uses="";//用途
	private Integer  weightProp=null;//比重
	private String  status="";//商品状态
	private String  vulnerability="";//易损性
	private Integer  depositDeadline=null;//存放期限
	private String  description="";//商品说明
	private Integer  minStore=null;//最低库限
	private Integer  maxStore=null;//最高库限
	private Integer  cost=null;//成本
	private String  illustrate="";//采购说明
	private Integer  price=null;//单价
	private String  realName="";//真实品名
	private String  cashType="";//币种
	private Integer  batch=null;//批次
	private String  batchNo="";//批次号
	private String  useStatus="";//使用状态
	private Integer  monthBatch=null;//月批次
	private Date  modifyBatchDate=null;//更新批次日
	private String  modifyBatchMonth="";//更新批次月份
	private String  format="";//规格编号
	private Integer  netQuantity=null;//净数量
	private Integer  littleUnitQuantity=null;//小单位数量
	private String  littleUnit="";//小单位
	private String  salesType="";//销售方式
	private String  defultSalesInstitution;//默认销售单位
	private String  taxNo="";//税号
	private Integer  offSales=null;//折扣
	private String  memo="";//备注
	private Integer  costConvertUnit=null;//折合单位成本
	private Integer  priceConvertUnit=null;//折合单位单价
	private String  barCode="";//商品条码
	private String  weigthPerUnit="";//商品单位重量
	private String  priceWeigthPerUnit="";//商品单位重量单价
	private String  ledgerId="";//账套编号
	
	
	public String getBarCode() {
		return barCode;
	}
	public void setBarCode(String barCode) {
		this.barCode = barCode;
	}
	public Integer getBatch() {
		return batch;
	}
	public void setBatch(Integer batch) {
		this.batch = batch;
	}
	public String getBatchNo() {
		return batchNo;
	}
	public void setBatchNo(String batchNo) {
		this.batchNo = batchNo;
	}
	public String getCashType() {
		return cashType;
	}
	public void setCashType(String cashType) {
		this.cashType = cashType;
	}
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public Integer getCost() {
		return cost;
	}
	public void setCost(Integer cost) {
		this.cost = cost;
	}
	public Integer getCostConvertUnit() {
		return costConvertUnit;
	}
	public void setCostConvertUnit(Integer costConvertUnit) {
		this.costConvertUnit = costConvertUnit;
	}
	public String getDefultSalesInstitution() {
		return defultSalesInstitution;
	}
	public void setDefultSalesInstitution(String defultSalesInstitution) {
		this.defultSalesInstitution = defultSalesInstitution;
	}
	public Integer getDepositDeadline() {
		return depositDeadline;
	}
	public void setDepositDeadline(Integer depositDeadline) {
		this.depositDeadline = depositDeadline;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getFormat() {
		return format;
	}
	public void setFormat(String format) {
		this.format = format;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIllustrate() {
		return illustrate;
	}
	public void setIllustrate(String illustrate) {
		this.illustrate = illustrate;
	}
	public String getLedgerId() {
		return ledgerId;
	}
	public void setLedgerId(String ledgerId) {
		this.ledgerId = ledgerId;
	}
	public String getLittleUnit() {
		return littleUnit;
	}
	public void setLittleUnit(String littleUnit) {
		this.littleUnit = littleUnit;
	}
	public Integer getLittleUnitQuantity() {
		return littleUnitQuantity;
	}
	public void setLittleUnitQuantity(Integer littleUnitQuantity) {
		this.littleUnitQuantity = littleUnitQuantity;
	}
	public Integer getMaxStore() {
		return maxStore;
	}
	public void setMaxStore(Integer maxStore) {
		this.maxStore = maxStore;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public Integer getMinStore() {
		return minStore;
	}
	public void setMinStore(Integer minStore) {
		this.minStore = minStore;
	}
	public String getModifyBatchMonth() {
		return modifyBatchMonth;
	}
	public void setModifyBatchMonth(String modifyBatchMonth) {
		this.modifyBatchMonth = modifyBatchMonth;
	}
	public Integer getMonthBatch() {
		return monthBatch;
	}
	public void setMonthBatch(Integer monthBatch) {
		this.monthBatch = monthBatch;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getNetQuantity() {
		return netQuantity;
	}
	public void setNetQuantity(Integer netQuantity) {
		this.netQuantity = netQuantity;
	}
	public Integer getOffSales() {
		return offSales;
	}
	public void setOffSales(Integer offSales) {
		this.offSales = offSales;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Integer getPriceConvertUnit() {
		return priceConvertUnit;
	}
	public void setPriceConvertUnit(Integer priceConvertUnit) {
		this.priceConvertUnit = priceConvertUnit;
	}
	public String getPriceWeigthPerUnit() {
		return priceWeigthPerUnit;
	}
	public void setPriceWeigthPerUnit(String priceWeigthPerUnit) {
		this.priceWeigthPerUnit = priceWeigthPerUnit;
	}
	public String getProperty() {
		return property;
	}
	public void setProperty(String property) {
		this.property = property;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getSalesType() {
		return salesType;
	}
	public void setSalesType(String salesType) {
		this.salesType = salesType;
	}
	public String getSeries() {
		return series;
	}
	public void setSeries(String series) {
		this.series = series;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTaxNo() {
		return taxNo;
	}
	public void setTaxNo(String taxNo) {
		this.taxNo = taxNo;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getUses() {
		return uses;
	}
	public void setUses(String uses) {
		this.uses = uses;
	}
	public String getUseStatus() {
		return useStatus;
	}
	public void setUseStatus(String useStatus) {
		this.useStatus = useStatus;
	}
	public String getVulnerability() {
		return vulnerability;
	}
	public void setVulnerability(String vulnerability) {
		this.vulnerability = vulnerability;
	}
	public Integer getWeightProp() {
		return weightProp;
	}
	public void setWeightProp(Integer weightProp) {
		this.weightProp = weightProp;
	}
	public String getWeigthPerUnit() {
		return weigthPerUnit;
	}
	public void setWeigthPerUnit(String weigthPerUnit) {
		this.weigthPerUnit = weigthPerUnit;
	}
	public Date getModifyBatchDate() {
		return modifyBatchDate;
	}
	public void setModifyBatchDate(Date modifyBatchDate) {
		this.modifyBatchDate = modifyBatchDate;
	}
	
	
	
}
