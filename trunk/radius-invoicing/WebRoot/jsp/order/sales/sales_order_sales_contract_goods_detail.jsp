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
				{field:'goodsId',title:'商品编号',width:120},
				{field:'goodsName',title:'商品名称',width:120},
				{field:'specId',title:'规格编码',width:120,formatter:specIdFormatter},
				{field:'unit',title:'包装单位(规格)',width:120,formatter:unitFormatter},
				{field:'priceUnit;包装单位单价',width:120,formatter:com.radius.datagrid.currency.formatter},
				{field:'equivalentUnit',title:'折合单位',width:120,formatter:equivalentUnitFormatter},
				{field:'priceEu',title:'折合单位单价',width:120,formatter:com.radius.datagrid.currency.formatter},
				{field:'quantityEuPerUnit',title:'包装单位折合数量',width:120},
				{field:'quantityEu',title:'折合数量',width:120},
				{field:'quantityUnit',title:'数量',width:120},
				//{field:'settledAmount',title:'已生成订单商品数量',width:120},
				{field:'amount',title:'金额',width:120,formatter:com.radius.datagrid.currency.formatter},
				//{field:'status',title:'状态',width:120}
				{field:'memo',title:'商品备注',width:120}
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
 		contractId:data.contractId,//合同编号
		goodsId:data.goodsId,//商品编号
		goodsName:data.goodsName,//商品名称
		specId:data.specId,//规格编码
		unit:data.unit,//包装单位(规格)
		priceUnit:data.priceUnit/100,//包装单位单价
		equivalentUnit:data.equivalentUnit,//折合单位
		priceEu:data.priceEu/100,//折合单位单价
		quantityEuPerUnit:data.quantityEuPerUnit,//包装单位折合数量
		quantityEu:data.quantityEu,//折合数量
		quantityUnit:data.quantityUnit,//数量
		//settledAmount:data.,//已生成订单商品数量
		amount:data.amount/100,//金额
		//status:data.status,//状态
		memo:data.memo//商品备注
 	};
 	return json;
 }
 
 /**
  *清空销售合同商品列表页签
  **/
 function clearSalesContractGoodsGrdTab(){
 	com.radius.datagrid.clear(sales_order_sales_contract_goods_detail_grd);
 }
//-->
</script>
<%--销售合同详情--%>
<div id="sales_order_sales_contract_goods_detail_grd">
</div>