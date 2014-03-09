<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
var business_goods_grd_product_grid=null;
$(function(){
	business_goods_grd_product_grid=$('#business_goods_grd_product_grid').datagrid({
		fitColumns:true,
   		autoRowHeight:false,
   		border:false,
   		striped:true,
   		rownumbers:true,
   		collapsible:true,
   		columns:[[
   		    {field:'goodsId',title:'商品编号',width:100},
   			{field:'goodsName',title:'商品名称',width:120},
			{field:'quantityUnit',title:'数量',width:60},
			{field:'equivalentUnit',title:'折合单位',width:60},
			{field:'quantityEu',title:'折合数量',width:60},
			{field:'priceEu',title:'折合单价',width:60},
			{field:'unit',title:'规格',width:120},
			{field:'amount',title:'金额',width:120},
			{field:'mome',title:'备注',width:250,align:'center'}
		]]
	});
});
</script>
<div id="business_goods_grd_product_grid"><%--商品列表--%></div>