<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
var contract_sales_goods_detail_grd = null;//销售合同明细列表
$(function(){
	//销售合同商品列表
	contract_sales_goods_detail_grd=$('#contract_sales_goods_detail_grd').datagrid({
   		fitColumns:true,
   		autoRowHeight:false,
   		border:false,
   		striped:true,
   		rownumbers:true,
   		collapsible:true,
   		frozenColumns:[[
   			{field:'goodsId',title:'商品编号',width:100},
   			{field:'goodsName',title:'商品名称',width:120}
   		]],
      	columns:[[
		{field:'specId',title:'规格',width:120},
		{field:'unit',title:'包装单位',width:120},
		{field:'priceUnit',title:'包装单位单价',width:120},
		{field:'equivalentUnit',title:'折合单位',width:120},
		{field:'priceEu',title:'折合单位单价',width:120},
		{field:'quantityEuPerUnit',title:'包装单位折合数量',width:140},
		{field:'quantityEu',title:'折合数量',width:120},
		{field:'quantityUnit',title:'数量',width:120},
		{field:'amount',title:'金额',width:120},
		{field:'mome',title:'备注',width:250,align:'center'}
		]]
	});
});

/**
 * 添加销售合同商品列表
 */
function insertContractSalesGoodsDetailGrd(){
	
}
</script>
<div id="contract_sales_goods_detail_grd"></div>