<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
<!--
  var spec_type_search_spec_type_info_equivalent_unit = null;
  var spec_type_search_spec_type_info_spec_unit = null;
  $(function (){
  	//----------------------------初始化--------------------------------------
  	//规格查询按钮
  	$('#spec_type_search_query_btn').on('click',function(){
  		spec_type_grd_spec_type_info_grid.datagrid('options').url='${path}/system/manage/common/spec_type_info_list.html';
  		spec_type_grd_spec_type_info_grid.datagrid('load',{
  			specName		:$('#spec_type_search_spec_type_info_spec_name').val(),//规格名称
			specUnit		:$('#spec_type_search_spec_type_info_spec_unit').combobox('getValue'),//规格单位
			equivalentUnit	:$('#spec_type_search_spec_type_info_equivalent_unit').combobox('getValue'),//折合单位
			quantityEuUnit	:$('#spec_type_search_spec_type_info_quantity_eu_unit').val()//折合数量/规格单位
  		});
  	});
  	
  	//添加规格信息
  	$('#spec_type_search_clear_btn').on('click',function(){
  		$('#spec_type_search_spec_type_info_spec_name').val('');//规格名称
		$('#spec_type_search_spec_type_info_spec_unit').combobox('setValue','');//规格单位
		$('#spec_type_search_spec_type_info_equivalent_unit').combobox('setValue','');//折合单位
		$('#spec_type_search_spec_type_info_quantity_eu_unit').val('');//折合数量/规格单位
  	});
  	
  	//折合单位
  	spec_type_search_spec_type_info_equivalent_unit = $('#spec_type_search_spec_type_info_equivalent_unit').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=1400',
 		valueField: 'id',
		textField: 'name',
		/*
		onLoadSuccess:function(){
			var target = $(this);
			var data = target.combobox("getData");
			var options = target.combobox("options");
			if(data && data.length>0){
				var fs = data[0];
				target.combobox("setValue",fs[options.valueField]);
			}
		},**/
		editable:false
  	});
  	
  	//规格单位
  	spec_type_search_spec_type_info_spec_unit = $('#spec_type_search_spec_type_info_spec_unit').combobox({
  		url:'${path}/common/system/category_code_list.html?parentId=1400',
 		valueField: 'id',
		textField: 'name',
		/**
		onLoadSuccess:function(){
			var target = $(this);
			var data = target.combobox("getData");
			var options = target.combobox("options");
			if(data && data.length>0){
				var fs = data[0];
				target.combobox("setValue",fs[options.valueField]);
			}
		},**/
		editable:false
  	});
  });
 
 /**
  * 校验规格信息
  *@return boolean 
  **/
 function validataSpecTypeInfo(){
 	var validata = false;
 	return validata;
 }
 
 /**
  * 格式化规格信息 符合后台数据对象
  *@return json 
  **/ 
 function getSpecTypeInfoFormatter2Query(){
   var json={
   		specName		:$('#spec_type_search_spec_type_info_spec_name').val(),//规格名称
		specUnit		:$('#spec_type_search_spec_type_info_spec_unit').combobox('getValue'),//规格单位
		equivalentUnit	:$('#spec_type_search_spec_type_info_equivalent_unit').combobox('getValue'),//折合单位
		quantityEuUnit	:$('#spec_type_search_spec_type_info_quantity_eu_unit').val()//折合数量/规格单位
   };
   return json;
 }
 

 /**
  * 将后台数据转化规格列表需要的行数据
  * @params{} _data 
  * @return  json
  */
 function getSpecTypeGrdFormatter(_data){
 	var row_data = {
 		specId:_data.specId,
 		specName:_data.specName,
 		specUnit:_data.specUnit,
 		equivalentUnit:_data.equivalentUnit,
 		quantityEuUnit:_data.quantityEuUnit,
 		mome:_data.mome
 	};
 	
 	return row_data;
 }
//-->
</script>
<div id="spec_type_search_spec_type_info">
	<table  style="width: 99.8%;">
		<tr>
			<th>规格名称:</th>
			<td><input id="spec_type_search_spec_type_info_spec_name"  style="border:1px solid #95B8E7" /></td>
			<th>规格单位:</th>
			<td><input id="spec_type_search_spec_type_info_spec_unit" style="border:1px solid #95B8E7"/></td>
			<th>折合单位:</th>
			<td><input id="spec_type_search_spec_type_info_equivalent_unit" style="border:1px solid #95B8E7"/></td>
			<th>折合数量:</th>
			<td><input id="spec_type_search_spec_type_info_quantity_eu_unit" style="border:1px solid #95B8E7"/></td>
			
			<td rowspan="2">
				<div style="float: left;margin-top: 5px;">
					<a id="spec_type_search_query_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
				</div>
				<div style="float: left;margin-left: 10px;margin-top: 5px;">
					<a id="spec_type_search_clear_btn"  href="#" class="easyui-linkbutton" data-options="iconCls:'icon-undo'" plain="true">重置</a>
				<div>
			</td>
		</tr>
	</table>
</div>