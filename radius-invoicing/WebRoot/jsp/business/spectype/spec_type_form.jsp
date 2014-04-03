<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
<!--
	var spec_type_form_dialog = null;
	var spec_type_form_dialog_add_spec_type_form_quantity_eu_unit = null;
	$(function(){
		spec_type_form_dialog = $('#spec_type_form_dialog').show().dialog({
			 title:'添加规格信息',
			 width:500,
			 height:200,
			 collapsible:true,//向上缩小按钮
			 maximizable:true,
			 modal:true,
			 closed:true,  
			 toolbar:['-',{
	 			 id:'spec_type_form_dialog_add_spec_type_form_save_btn',
	 			 text:'保存',
	 			 iconCls: 'icon-add',
	 			 handler:addSpecTypeInfoSave
	 			},'-',{
	 			 id:'spec_type_form_dialog_add_spec_type_form_close_btn',
	 			 text:'关闭',
	 			 iconCls: 'icon-cancel',
	 			 handler:addSpecTypeInfoClose
	 			},
	 		'-']
		});

		//规格状态
		$('#spec_type_form_dialog_add_spec_type_form_spec_status').combobox({
			url:'${path}/common/system/use_status_list.html',
	 		valueField: 'id',
			textField: 'name',
			onLoadSuccess:function(){
				var target = $(this);
				target.combobox("setValue",target.val());
				target.combobox('disable');
			}
	  	});
	  	
	  	$('#spec_type_form_dialog_add_spec_type_form_spec_unit').combobox({
	 		url:'${path}/common/system/category_code_list.html?parentId=1400',
	 		valueField: 'id',
			textField: 'name',
			onLoadSuccess:function(){
				var target = $(this);
				var data = target.combobox("getData");
				var options = target.combobox("options");
				if(data && data.length>0){
					var fs = data[0];
					target.combobox("setValue",fs[options.valueField]);
				}
			},
			editable:false
	  	});
	  	
	  	$('#spec_type_form_dialog_add_spec_type_form_equivalent_unit').combobox({
	 		url:'${path}/common/system/category_code_list.html?parentId=1400',
	 		valueField: 'id',
			textField: 'name',
			onLoadSuccess:function(){
				var target = $(this);
				var data = target.combobox("getData");
				var options = target.combobox("options");
				if(data && data.length>0){
					var fs = data[0];
					target.combobox("setValue",fs[options.valueField]);
				}
			},
			editable:false
	  	});

		//绑定添加规格信息按钮
	  	$('#spec_type_form_dialog_add_spec_type_form_add_btn').on('click',function(){


	  	});

	  	//绑定关闭规格信息对话框
	  	$('#spec_type_form_dialog_add_spec_type_form_close_btn').on('click',function(){

	  	});
	  	
		spec_type_form_dialog_add_spec_type_form_quantity_eu_unit=$('#spec_type_form_dialog_add_spec_type_form_quantity_eu_unit').numberspinner({
			min: 0,
			max: 10,
			editable: false
		});
		spec_type_form_dialog_add_spec_type_form_quantity_eu_unit.numberspinner('setValue',0);//设置初始数量为0
	});

//---------------------------------------业务处理-----------------------------------------------------

//添加规格信息close事件
function addSpecTypeInfoClose(){
	//1.关闭当前会话
		spec_type_form_dialog.dialog('close');
	//2.将内容框设置为空
		setSpecTypeInfoNull();
}


/**
 * 设置当前规格信息为空
 * 
 **/
function setSpecTypeInfoNull(){
	$('#spec_type_form_dialog_add_spec_type_form_spec_Name').val();
	$('#spec_type_form_dialog_add_spec_type_form_spec_unit').val();
	$('#spec_type_form_dialog_add_spec_type_form_equivalent_unit').val();
	$('#spec_type_form_dialog_add_spec_type_form_quantity_eu_unit').val();
	$('#spec_type_form_dialog_add_spec_type_form_spec_status').val();
	$('#spec_type_form_dialog_add_spec_type_form_spec_mome').val();
}
/**
  * 将datagrid row data 填充的对话框里
  **/
function setSpecTypeInfoDaliog(row_data){
	$('#spec_type_form_dialog_add_spec_type_form_spec_id').val(row_data.specId);
	$('#spec_type_form_dialog_add_spec_type_form_spec_Name').val(row_data.specName);
	//将规格名称禁用
	$('#spec_type_form_dialog_add_spec_type_form_spec_unit').combobox('setValue',row_data.specUnit);
	$('#spec_type_form_dialog_add_spec_type_form_spec_unit').combobox('disable');//将其禁用
	$('#spec_type_form_dialog_add_spec_type_form_equivalent_unit').combobox('setValue',row_data.equivalentUnit);
	$('#spec_type_form_dialog_add_spec_type_form_equivalent_unit').combobox('disable');//将其禁用
	$('#spec_type_form_dialog_add_spec_type_form_quantity_eu_unit').val(row_data.quantityEuUnit);
	//$('#spec_type_form_dialog_add_spec_type_form_spec_status').val(row_data.status);
	$('#spec_type_form_dialog_add_spec_type_form_spec_mome').val(row_data.mome);
}

/**
 * 添加规格信息save事件
 *
 */
function addSpecTypeInfoSave(){
	//1.验证当前规格信息是否有效
	var validata = validataSpecTypeInfo();
	if(!validata){
		$.messager.show({
			title:'提示',
			msg:'提交的数据不符合要求,请核对后再提交..',
			timeout:5000,
			showType:'slide'
		});
		return ;
	}

	//2.格式化当前提交数据
	var ajax_url = '${path}/system/manage/common/spec_type_info_add.html';
	var ajax_data=getSpecTypeInfoFormatter();
	//3.提交数据
	submitSpecTypeInfo(ajax_url,ajax_data);
	//4.关闭对话框
	spec_type_form_dialog.dialog('close');
}

/**
 * 异步提交规格信息
 * @params{} ajax_url  
 * @params{} ajax_data
 **/
function submitSpecTypeInfo(ajax_url,ajax_data){
	$.ajax({
		url:ajax_url,
		method:'POST',
		data:ajax_data,
		success:function(r){
			if(r&&r.success){
				//1.清空对话框中的内容
				setSpecTypeInfoNull();
				//2.将数据添加到datagrid中
				var row_data = getSpecTypeInfo2SpecTypeGrdRowData(r.child);
				addSpecTypeInfo2SpecTypeInfoGrid(row_data);
			}
		},
		error:function(r){
			$.messager.show({
				title:'提示',
				msg:'与后台通讯失败..',
				timeout:5000,
				showType:'slide'
			});
		}

	});
}



/**
  * 验证当前待提交的规格信息是否合法
  *@return boolean 
  */
function validataSpecTypeInfo(){
	var validata = true;



	return validata;
}


/*
 * 获取符合后台的格式化数据
 * 
 * @return json
 */
function getSpecTypeInfoFormatter(){
	var json={
		specId			:$('#spec_type_form_dialog_add_spec_type_form_spec_id').val(),//规格编号
		specName		:$('#spec_type_form_dialog_add_spec_type_form_spec_Name').val(),//规格名称
		specUnit		:$('#spec_type_form_dialog_add_spec_type_form_spec_unit').combobox('getValue'),//规格单位
		equivalentUnit	:$('#spec_type_form_dialog_add_spec_type_form_equivalent_unit').combobox('getValue'),//折合单位
		quantityEuUnit	:$('#spec_type_form_dialog_add_spec_type_form_quantity_eu_unit').val(),//折合数量/规格单位
		status			:$('#spec_type_form_dialog_add_spec_type_form_spec_status').combobox('getValue'),//状态
		mome			:$('#spec_type_form_dialog_add_spec_type_form_spec_mome').val()//描述
	};
	return json;
}

/**
 * 将后台的规格信息转化为规格信息列表行数据
 * @params{} _data 后台规格信息
 * @return   json 符合规格列表的行数据格式
 **/
function getSpecTypeInfo2SpecTypeGrdRowData(_data){
	var json ={
		specId 			:_data.specId,
		specName 		:_data.specName,
		specUnit		:_data.specUnit,
		equivalentUnit	:_data.equivalentUnit,
		quantityEuUnit	:_data.quantityEuUnit,
		mome			:_data.mome
	};
	return json;
}
//-->
</script>
<div id="spec_type_form_dialog">
	<form id="spec_type_form_dialog_add_spec_type_form">
		<table  style="width: 100%;margin-left: 10px;">
			<tr>
				<th>规格名称</th>
				<td><input id="spec_type_form_dialog_add_spec_type_form_spec_Name" style="border:1px solid #95B8E7"/> <input id="spec_type_form_dialog_add_spec_type_form_spec_id" type="hidden"/></td>
				<th>状态</th>
				<td><input id="spec_type_form_dialog_add_spec_type_form_spec_status" value="1" style="border:1px solid #95B8E7"/> </td>
			</tr>
			<tr>
				<th>规格单位</th>
				<td><input id="spec_type_form_dialog_add_spec_type_form_spec_unit" style="border:1px solid #95B8E7"/> </td>
				<th>折合单位</th>
				<td><input id="spec_type_form_dialog_add_spec_type_form_equivalent_unit" style="border:1px solid #95B8E7"/> </td>
			</tr>
			<tr>
				<th>折合数量</th>
				<td><input id="spec_type_form_dialog_add_spec_type_form_quantity_eu_unit"/> </td>
				<th>描述</th>
				<td>
					<input class="easyui-validatebox" style="border:1px solid #95B8E7;" type="text" id="spec_type_form_dialog_add_spec_type_form_spec_mome" data-options=""/>
				</td>
			</tr>
		</table>
	</form>
</div>