/**
 * 
 */
package com.radius.invoicing.ibatis.model;

import org.apache.commons.lang.StringUtils;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public class GoodsConditionAppend {
	
	public static  void  appendCondition(Goods goods){
		StringBuffer bf=new StringBuffer();
		bf.append(" WHERE 1 = 1 ");
		
		if(StringUtils.isNotBlank(goods.getId())){
			bf.append(" AND  goods_id = '").append(goods.getId()).append("'");
		}
		if(StringUtils.isNotBlank(goods.getName())){
			bf.append(" AND  goods_name like '%").append(goods.getName()).append("%'");
		}
		if(StringUtils.isNotBlank(goods.getProperty())){
			bf.append(" AND  goods_property like '%").append(goods.getProperty()).append("%'");
		}
		if(StringUtils.isNotBlank(goods.getCategoryId())){
			bf.append(" AND  category_id = '").append(goods.getCategoryId()).append("'");
		}
		if(StringUtils.isNotBlank(goods.getCategoryName())){
			bf.append(" AND  category_name like '%").append(goods.getCategoryName()).append("%'");
		}
		if(StringUtils.isNotBlank(goods.getUnit())){
			bf.append(" AND  unit = '").append(goods.getUnit()).append("'");
		}
		if(StringUtils.isNotBlank(goods.getPlace())){
			bf.append(" AND  origin_place like '%").append(goods.getPlace()).append("%'");
		}
		if(StringUtils.isNotBlank(goods.getUses())){
			bf.append(" AND  uses = '").append(goods.getUses()).append("'");
		}
		if(goods.getWeightProp()!=null&&goods.getWeightProp()>0){
			bf.append(" AND  weight_prop = ").append(goods.getWeightProp().intValue());
		}
		if(StringUtils.isNotBlank(goods.getStatus())){
			bf.append(" AND  goods_status = '").append(goods.getStatus()).append("'");
		}
		if(StringUtils.isNotBlank(goods.getVulnerability())){
			bf.append(" AND  vulnerability = '").append(goods.getVulnerability()).append("'");
		}
		if(goods.getDepositDeadline()!=null&&goods.getDepositDeadline()>0){
			bf.append(" AND  deposit_deadline = ").append(goods.getDepositDeadline().intValue());
		}
		if(goods.getMinStore()!=null&&goods.getMinStore()>0){
			bf.append(" AND  min_limit_of_store = ").append(goods.getMinStore().intValue());
		}
		if(goods.getMaxStore()!=null&&goods.getMaxStore()>0){
			bf.append(" AND  max_limit_of_store = ").append(goods.getMaxStore().intValue());
		}
		if(goods.getCost()!=null&&goods.getCost()>0){
			bf.append(" AND  cost = ").append(goods.getCost().intValue());
		}
		if(goods.getPrice()!=null&&goods.getPrice()>0){
			bf.append(" AND  price = ").append(goods.getPrice().intValue());
		}
		if(StringUtils.isNotBlank(goods.getRealName())){
			bf.append(" AND  true_goods_name = '").append(goods.getRealName()).append("'");
		}
		if(StringUtils.isNotBlank(goods.getCashType())){
			bf.append(" AND  cash_type = '").append(goods.getCashType()).append("'");
		}
		if(goods.getBatch()!=null&&goods.getBatch()>0){
			bf.append(" AND  batch = ").append(goods.getBatch().intValue());
		}
		if(StringUtils.isNotBlank(goods.getBatchNo())){
			bf.append(" AND  batch_no = '").append(goods.getBatchNo()).append("'");
		}
		if(StringUtils.isNotBlank(goods.getUseStatus())){
			bf.append(" AND  use_status = '").append(goods.getUseStatus()).append("'");
		}
		
		if(goods.getMonthBatch()!=null&&goods.getMonthBatch()>0){
			bf.append(" AND  month_batch = ").append(goods.getMonthBatch().intValue());
		}
		if(StringUtils.isNotBlank(goods.getModifyBatchMonth())){
			bf.append(" AND  modify_batch_month = '").append(goods.getModifyBatchMonth()).append("'");
		}
		if(StringUtils.isNotBlank(goods.getFormat())){
			bf.append(" AND  format_no = '").append(goods.getFormat()).append("'");
		}
		if(goods.getNetQuantity()!=null&&goods.getNetQuantity()>0){
			bf.append(" AND  net_quantity = ").append(goods.getNetQuantity().intValue());
		}
		if(goods.getLittleUnitQuantity()!=null&&goods.getLittleUnitQuantity()>0){
			bf.append(" AND  little_unit_quantity = ").append(goods.getLittleUnitQuantity().intValue());
		}
		if(StringUtils.isNotBlank(goods.getLittleUnit())){
			bf.append(" AND  little_unit = '").append(goods.getLittleUnit()).append("'");
		}
		if(StringUtils.isNotBlank(goods.getLittleUnit())){
			bf.append(" AND  little_unit = '").append(goods.getLittleUnit()).append("'");
		}
		if(StringUtils.isNotBlank(goods.getSalesType())){
			bf.append(" AND  sales_type = '").append(goods.getSalesType()).append("'");
		}
		if(StringUtils.isNotBlank(goods.getDefultSalesInstitution())){
			bf.append(" AND  defult_sales_institution = '").append(goods.getDefultSalesInstitution()).append("'");
		}
		if(StringUtils.isNotBlank(goods.getTaxNo())){
			bf.append(" AND  tax_no = '").append(goods.getTaxNo()).append("'");
		}
		if(goods.getOffSales()!=null&&goods.getOffSales()>0){
			bf.append(" AND  off_sales = ").append(goods.getOffSales().intValue());
		}
		if(goods.getCostConvertUnit()!=null&&goods.getCostConvertUnit()>0){
			bf.append(" AND  cost_of_convert_unit = ").append(goods.getCostConvertUnit().intValue());
		}
		if(goods.getPriceConvertUnit()!=null&&goods.getPriceConvertUnit()>0){
			bf.append(" AND  price_of_convert_unit = ").append(goods.getPriceConvertUnit().intValue());
		}
		if(StringUtils.isNotBlank(goods.getWeigthPerUnit())){
			bf.append(" AND  weigth_per_unit = '").append(goods.getWeigthPerUnit()).append("'");
		}
		if(StringUtils.isNotBlank(goods.getBarCode())){
			bf.append(" AND  goods_bar_code = '").append(goods.getBarCode()).append("'");
		}
		if(StringUtils.isNotBlank(goods.getPriceWeigthPerUnit())){
			bf.append(" AND  price_of_weigth_per_unit = '").append(goods.getPriceWeigthPerUnit()).append("'");
		}
		if(StringUtils.isNotBlank(goods.getLedgerId())){
			bf.append(" AND  ledger_id = '").append(goods.getLedgerId()).append("'");
		}
		
		goods.setCondition(bf.toString());
		bf=null;
	}
}
