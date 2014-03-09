<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
 var sales_order_sales_contract_goods_detail_grd = null;//销售合同详情
 $(function(){
 	sales_order_sales_contract_goods_detail_grd=$('#sales_order_sales_contract_goods_detail_grd').datagrid({
 			fit:true,
       		autoRowHeight:false,
       		border:false,
       		striped:true,
       		rownumbers:true,
       		collapsible:true,
       		columns:[[
       			{field:'contractId',title:'合同编号',width:120},
       			{field:'goodsName',title:'商品名称',width:100},
				{field:'quantityEu',title:'数量',width:80},
				{field:'price',title:'单价',width:80,formatter: function(value,row,index){
					if(value!=undefined&&value!=null&&(value+"").indexOf(".")<=0){
						value=parseInt(value).toFixed(2);
					}
					return value;
				  }	
				},
				{field:'quantityUnit',title:'折合数量',width:80},
				{field:'equivalentUnit',title:'折合单位',width:120},
				{field:'unit',title:'包装规格',width:120},
				//{field:'upperAmount',title:'单价',width:120},
				{field:'priceEu',title:'折合单价',width:120,formatter: function(value,row,index){
						if(value!=undefined&&value!=null&&(value+"").indexOf(".")<=0){
							value=parseInt(value).toFixed(2);
						}
						return value;
					}	
				},
				{field:'amount',title:'金额',width:120,formatter: function(value,row,index){
						if(value!=undefined&&value!=null&&(value+"").indexOf(".")<=0){
							value=parseInt(value).toFixed(2);
						}
						return value;
					}	
				},
				{field:'memo',title:'备注',width:120}
			]]
 	});
 	
 	
 });
 
/**
 * 设置销售订单——销售合同商品信息列表
 *@param data 获取后台获取的数据
 *
 **/
function setSalesOrderSalesContractGoodsDetailGrd(data){
	//1.格式化数据
	var row_data=getSalesOrderSalesContractGoodsDetailGrdDataFormatter(data);
	//2.将数据添加datagrid中
	addSalesOrderSalesContractGoodsDetailGrd(row_data);
 }
 
 /**
  * 将格式化后的数据添加到datagrid中
  *@param row_data 符合datagrid要求的数据
  **/
 function addSalesOrderSalesContractGoodsDetailGrd(row_data){
 	sales_order_sales_contract_goods_detail_grd.datagrid('insertRow',{
 		index:0,
 		row:row_data
 	});
 }
 /**
  * 将后台数据格式化为销售订单——销售合同商品信息数据
  *@param data 后台数据
  *@return json 符合销售商品列表格式的数据
  **/
function getSalesOrderSalesContractGoodsDetailGrdDataFormatter(data){
 	var json={
 		contractId:data.contractId,
 		goodsId:data.goodsName,
 		goodsName:data.goodsName,
 		price:data.price/100,
 		quantityEu:data.quantityEu,
 		quantityUnit:data.quantityUnit,
 		equivalentUnit:data.equivalentUnit,
 		unit:data.unit,
 		priceEu:data.priceEu/100,
 		amount:data.amount/100,
 		memo:data.memo
 	};
 	return json;
 }
//-->
</script>
<%--销售合同详情--%>
<div id="sales_order_sales_contract_goods_detail_grd">
	
</div>