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
   		frozenColumns:[[
   			 {field:'id',title:'商品编号',width:100},
   			 {field:'name',title:'商品名称',width:120},
   			 {field:'realName',title:'真实品名',width:120},
   			 {field:'goodsName',title:'商品条码',width:120},
   			 {field:'goodsName',title:'商品状态',width:120},
   			 {field:'goodsName',title:'商品性质',width:120},
   			 {field:'categoryName',title:'分类名称',width:120}
   		]],
   		columns:[[
   			{field:'goodsName',title:'产地',width:120},
   			{field:'goodsName',title:'用途',width:120},
   			{field:'goodsName',title:'比重',width:120},
   			{field:'goodsName',title:'单价',width:120},
   			{field:'goodsName',title:'成本',width:120},
   			{field:'goodsName',title:'币种',width:120},
   			{field:'goodsName',title:'销售方式',width:120},
   			{field:'goodsName',title:'默认销售单位',width:120},
   			{field:'goodsName',title:'税号',width:120},
   			{field:'goodsName',title:'商品系列',width:120},
   			{field:'goodsName',title:'易损性',width:120},
   			{field:'goodsName',title:'折扣',width:120},
   			{field:'goodsName',title:'存放期限',width:120},
   			{field:'goodsName',title:'最低库限',width:120},
   			{field:'goodsName',title:'最高库限',width:120},
   			{field:'goodsName',title:'批次',width:120},
   			{field:'goodsName',title:'批次号',width:120},
   			{field:'goodsName',title:'更新批次日',width:120},
   			{field:'goodsName',title:'月批次',width:120},
   			{field:'goodsName',title:'更新批次月份',width:120},
   			{field:'goodsName',title:'使用状态',width:120},
   			{field:'goodsName',title:'规格编号',width:120},
			{field:'goodsName',title:'净数量',width:120},
   			{field:'goodsName',title:'小单位',width:120},
   			{field:'goodsName',title:'小单位数量',width:120},
   			{field:'goodsName',title:'折合单位成本',width:120},
   			{field:'goodsName',title:'折合单位单价',width:120},
   			{field:'goodsName',title:'商品单位重量',width:120},
   			{field:'goodsName',title:'商品单位重量单价',width:120},
   			{field:'quantityUnit',title:'采购说明',width:60},
			{field:'equivalentUnit',title:'商品说明',width:60},
			{field:'mome',title:'备注',width:250,align:'center'}
		]]
	});
});

/**
 * 将数据添加到商品列表中
 *@params{} row_data
 *
 **/
function addBusinessGoodsGrdProductGrid(row_data){
	//1.将数据添加到datagrid中
	addTargetDataGridRowData(business_goods_grd_product_grid,row_data,0);//target_grid,row_data,row_index
	business_goods_grd_product_grid.datagrid('acceptChanges');//接受改变
}


</script>
<div id="business_goods_grd_product_grid"><%--商品列表--%></div>