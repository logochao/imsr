package com.radius.invoicing.ordermanage.service.impl;

import org.springframework.stereotype.Service;

import com.radius.base.page.EasyuiSplitPager;
import com.radius.invoicing.ibatis.model.SalesOrder;

public class PurchaseOrderServiceImpl {

	
	
	
	/**
	 * 
	 * @param supplier
	 */
	public EasyuiSplitPager<SalesOrder> getSalesOrderBySupplier(String supplier){
		//1.根据供应商编号获取所有商品编号
		//2.根据当前的商品编号 inner join 销售订单商品列表 获取订单号
		//3.在根据订单号订单的相信信息
		
		return null;
	}
}
