<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
 var sales_order_contract_detail_sales_contract_grd = null;//销售合同详情
 $(function(){
 	sales_order_contract_detail_sales_contract_grd=$('#sales_order_contract_detail_sales_contract_grd').datagrid({
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
				//{field:'signTime',title:'单位',width:80},
				{field:'quantityUnit',title:'折合数量',width:80},
				{field:'equivalentUnit',title:'折合单位',width:120},
				{field:'unit',title:'包装规格',width:120},
				//{field:'upperAmount',title:'单价',width:120},
				{field:'priceEu',title:'折合单价',width:120},
				{field:'amount',title:'金额',width:120,formatter:function(value,row,index){
						return (value/100).toFixed(2);
				}},
				{field:'memo',title:'备注',width:120}
			]]
 	});
 });
//-->
</script>
<%--销售合同详情--%>
<div id="sales_order_contract_detail_sales_contract_grd">
	
</div>