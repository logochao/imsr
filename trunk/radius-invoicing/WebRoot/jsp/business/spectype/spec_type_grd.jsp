<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
<!--
var spec_type_grd_spec_type_info_grid = null;
$(function(){
	
	//---------------------------------------初始化-----------------------------------------
	spec_type_grd_spec_type_info_grid = $('#spec_type_grd_spec_type_info_grid').datagrid({
		fitColumns:true,
   		autoRowHeight:false,
   		border:false,
   		striped:true,
   		rownumbers:true,
   		collapsible:true,
   		columns:[[
   			{field:'specId',title:'规格编码',width:120},
   			{field:'specName',title:'规格名称',width:120},
   			{field:'specUnit',title:'规格单位',width:120,formatter:specUnitFormatter},
   			{field:'equivalentUnit',title:'折合单位',width:120,formatter:equivalentUnitFormatter},
   			{field:'quantityEuUnit',title:'折合数量',width:120},
			{field:'mome',title:'备注',width:250,align:'center'}
		]]
	});
});
	
	
//-------------------------------------------业务处理--------------------------------------
/**
 * 将规格信息添加到规格信息列表中
 *@params{} row_data 已规格化行数据
 *
 **/
function addSpecTypeInfo2SpecTypeInfoGrid(row_data){
   addTargetDataGridRowData(spec_type_grd_spec_type_info_grid,row_data,0);
   spec_type_grd_spec_type_info_grid.datagrid('acceptChanges');//接受改变
}


/**
 * 规格单位格式化
 **/
function specUnitFormatter(value,row,index){
	var combobox_data = spec_type_search_spec_type_info_spec_unit.combobox('getData');
	for(var i=0,length=combobox_data.length;i<length;i++){
		if(combobox_data[i].id==value){
			value=combobox_data[i].name;
			break;
		}
	}
	return value;
}

/**
  * 折合单位格式化
 **/
function equivalentUnitFormatter(value,row,index){
	var combobox_data = spec_type_search_spec_type_info_equivalent_unit.combobox('getData');
	for(var i=0,length=combobox_data.length;i<length;i++){
		if(combobox_data[i].id==value){
			value=combobox_data[i].name;
			break;
		}
	}
	return value;
}
//-->
</script>

<div id="spec_type_grd_spec_type_info_grid"><%--规格列表--%></div>