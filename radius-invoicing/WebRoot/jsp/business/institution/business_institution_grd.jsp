<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
var business_institution_grd_institution_grid=null;
$(function(){
	business_institution_grd_institution_grid=$('#business_institution_grd_institution_grid').datagrid({
		fitColumns:true,
   		autoRowHeight:false,
   		border:false,
   		striped:true,
   		rownumbers:true,
   		collapsible:true,
   		columns:[[
			{field:'instId',title:'机构编号',width:120},					
			{field:'instName',title:'机构名称',width:120},					
			{field:'instTel',title:'机构电话',width:120},					
			{field:'instHead',title:'机构负责人',width:120,formatter:instHeadFormatter},					
			{field:'approRev',title:'审批复核人',width:120,formatter:approRevFormatter},					
			{field:'amountLmt',title:'审批额度',width:120},				
			{field:'fatherInst',title:'父级机构',width:120,formatter:fatherInstFormatter},				
			{field:'instAddr',title:'机构地址',width:120},					
			{field:'postCode',title:'邮编',width:120},					
			{field:'instUrl',title:'机构网址',width:120},					
			{field:'linkMan',title:'联系人',width:120,formatter:linkManFormatter},					
			{field:'instFax',title:'机构传真',width:120},					
			{field:'instMail',title:'机构邮箱',width:120}
		]]
	});
});

/**
 * 将数据添加到商品列表中
 *@params{} row_data
 *
 **/
function addBusinessInstitutionGrdInstitutionGrid(row_data){
	//1.将数据添加到datagrid中
	addTargetDataGridRowData(business_institution_grd_institution_grid,row_data,0);//target_grid,row_data,row_index
	business_institution_grd_institution_grid.datagrid('acceptChanges');//接受改变
}


/**
 * 商品类型信息
 *@params{}  value
 *@params{}  row
 *@params{}  index
 *@return   
*/
function instHeadFormatter(value,row,index){
	var combobox_data = business_institution_info_form_instHead.combogrid('grid').datagrid('getData').rows;
	for(var i=0,length=combobox_data.length;i<length;i++){
		if(combobox_data[i].id==value){
			value=combobox_data[i].name;
			break;
		}
	}
	return value;
}


function approRevFormatter(value,row,index){
	var combobox_data = business_institution_info_form_approRev.combogrid('grid').datagrid('getData').rows;
	for(var i=0,length=combobox_data.length;i<length;i++){
		if(combobox_data[i].id==value){
			value=combobox_data[i].name;
			break;
		}
	}
	return value;
}
function linkManFormatter(value,row,index){
	var combobox_data = business_institution_info_form_linkMan.combogrid('grid').datagrid('getData').rows;
	for(var i=0,length=combobox_data.length;i<length;i++){
		if(combobox_data[i].id==value){
			value=combobox_data[i].name;
			break;
		}
	}
	return value;
}
function fatherInstFormatter(value,row,index){
	var combobox_data = business_institution_info_form_fatherInst.combogrid('grid').datagrid('getData').rows;
	for(var i=0,length=combobox_data.length;i<length;i++){
		if(combobox_data[i].instId==value){
			value=combobox_data[i].instName;
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

function institutionStatusFormatter(value,row,index){
	var combobox_data = business_institution_info_form_institution_status.combobox('getData');
	for(var i=0,length=combobox_data.length;i<length;i++){
		if(combobox_data[i].id==value){
			value=combobox_data[i].name;
			break;
		}
	}
	return value;
}
 **/
/**
 * 使用状态信息
 *@params{}  value
 *@params{}  row
 *@params{}  index
 *@return   

function useStatusFormatter(value,row,index){
	var combobox_data = business_institution_info_form_cash_use_status.combobox('getData');
	for(var i=0,length=combobox_data.length;i<length;i++){
		if(combobox_data[i].id==value){
			value=combobox_data[i].name;
			break;
		}
	}
	return value;
}
 **/
</script>
<div id="business_institution_grd_institution_grid"><%--商品列表--%></div>