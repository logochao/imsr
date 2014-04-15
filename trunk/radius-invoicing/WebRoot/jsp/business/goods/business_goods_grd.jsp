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
	   		{field:'id',title:'商品编号',width:120},//商品编号
			{field:'name',title:'商品名称',width:120},//商品名称
			{field:'realName',title:'真实品名称',width:120},//真实品名
			{field:'goodsType',title:'商品类型',width:120,formatter:goodsTypeFormatter},//商品类型
			{field:'machineSeries',title:'所属设备名称',width:180},//所属设备名
			{field:'machinePosition',title:'设备位号',width:120},//设备位号
			{field:'partNo',title:'备件号',width:120},//备件号
			{field:'mapSeries',title:'图号',width:120},//图号
			{field:'company',title:'生产厂商',width:120},//生产厂商
			{field:'goodStatus',title:'商品状态',width:120,formatter:goodStatusFormatter},//商品状态 液态
			{field:'weightProp',title:'比重',width:120},//比重
			{field:'vulnerability',title:'易损性',width:120},//易损性
			{field:'description',title:'商品说明',width:120},//商品说明
			{field:'useStatus',title:'使用状态',width:120,formatter:useStatusFormatter},//使用状态
			{field:'memo',title:'备注',width:120}//备注
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
/**
 * 商品类型信息
 *@params{}  value
 *@params{}  row
 *@params{}  index
 *@return   
 **/
function goodsTypeFormatter(value,row,index){
	var combobox_data = business_goods_search_goods_type.combobox('getData');
	for(var i=0,length=combobox_data.length;i<length;i++){
		if(combobox_data[i].id==value){
			value=combobox_data[i].name;
			break;
		}
	}
	return value;
}
/**
 * 商品状态信息
 *@params{}  value
 *@params{}  row
 *@params{}  index
 *@return   
 **/
function goodStatusFormatter(value,row,index){
	var combobox_data = business_goods_info_form_goods_status.combobox('getData');
	for(var i=0,length=combobox_data.length;i<length;i++){
		if(combobox_data[i].id==value){
			value=combobox_data[i].name;
			break;
		}
	}
	return value;
}
/**
 * 使用状态信息
 *@params{}  value
 *@params{}  row
 *@params{}  index
 *@return   
 **/
function useStatusFormatter(value,row,index){
	var combobox_data = business_goods_info_form_cash_use_status.combobox('getData');
	for(var i=0,length=combobox_data.length;i<length;i++){
		if(combobox_data[i].id==value){
			value=combobox_data[i].name;
			break;
		}
	}
	return value;
}
</script>
<div id="business_goods_grd_product_grid"><%--商品列表--%></div>