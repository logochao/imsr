<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
<!--
//var business_institution_search_institution_status = null;//机构状态
var business_institution_search_institution_name = null ;//机构名称
//var business_institution_search_institution_type = null ;//机构分类
var business_institution_search_add_institution_dialog = null;//添加机构信息对话框 

 $(function (){
 
 	//----------------------------------初始化--------------------------------------------------------
 	business_institution_search_add_institution_dialog=$('#business_institution_search_add_institution_dialog').show().dialog({
		 title:'添加机构信息',
		 width:800,
		 height:400,
		 collapsible:true,//向上缩小按钮
		 maximizable:true,
		 modal:true,
		 closed:true,
		 toolbar:['-',{
	 			 id:'business_institution_search_add_institution_dialog_save_btn',
	 			 text:'机构保存',
	 			 iconCls: 'icon-add',
	 			 handler:addInstitutionInfoSaveBtn
	 			},'-',{
	 			 id:'business_institution_search_add_institution_dialog_close_btn',
	 			 text:'关闭',
	 			 iconCls: 'icon-cancel',
	 			 handler:addInstitutionInfoCloseBtn
	 			},
	 		'-']
	});
/*	
	$('#cc').combogrid({   
    panelWidth:450,   
    value:'006',   
    
    idField:'code',   
    textField:'name',   
    url:'datagrid_data.json',   
    columns:[[   
        {field:'code',title:'Code',width:60},   
        {field:'name',title:'Name',width:100},   
        {field:'addr',title:'Address',width:120},   
        {field:'col4',title:'Col41',width:100}   
    ]]

});     */   
 /*	
 	//机构状态
 	business_institution_search_institution_status=$('#business_institution_search_institution_status').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=3700',
 		valueField: 'id',
		textField: 'name',
		editable:false
 	});
 	
 	//机构分类
 	business_institution_search_institution_type=$('#business_institution_search_institution_type').combobox({
 		url:'/stock/common/system/category_code_list.html?parentId=2600',
 		valueField: 'id',
		textField: 'name',
		editable:false
 	});
 	
 	//查询供应商(生产厂商)信息对话框
 	business_institution_info_company_dialog=$('#business_institution_info_company_dialog').show().dialog({
		 title:'查询生产厂商信息',
		 width:800,
		 height:380,
		 collapsible:true,//向上缩小按钮
		 maximizable:true,
		 modal:true,
		 closed:true
	});
 	
 	//打开供应商查询界面
 	$('#business_institution_search_institution_supplier_search_btn').on('click',function(){
 		business_institution_info_company_dialog.dialog('open');
 		business_institution_company_from=$(this).attr('from');
 	});
 	
 */	
 	
 	//---------------------------------------业务处理--------------------------------------------------------------
 	//查询按钮
 	$('#business_institution_search_query_btn').on('click',function(){
 		business_institution_grd_institution_grid.datagrid('options').url='${path}/institution/manager/institution/institution_info_2_institution.html';
 		business_institution_grd_institution_grid.datagrid('load',{
 			instName			:$('#business_institution_search_name').val()
 			/*
 			realName		:$('#business_institution_search_real_name').val(),
 			institutionType		:business_institution_search_institution_type.combobox('getValue'),
 			machineSeries	:$('#business_institution_search_machine_series').val(),
 			machinePosition	:$('#business_institution_search_machine_position').val(),
 			partNo			:$('#business_institution_search_part_no').val(),
 			mapSeries		:$('#business_institution_search_map_series').val(),
 			company			:$('#business_institution_search_company_id').val(),
 			goodStatus		:business_institution_search_institution_status.combobox('getValue')
 			*/
 		});
 	});
 	//确定按钮
 	$('#business_institution_search_ok_btn').on('click',function(){
 		
 	});
 });
 
 /**
  * 保存机构信息按钮处理事件
  *
  **/
 function addInstitutionInfoSaveBtn(){
 	var institution_data = getAddInstitutionInfoFormatter();
 
 	var validate = validateAddInstitutionInfo();
 	if(validate){
 		$.ajax({
 			url:'${path}/institution/manager/institution/institution_infos_add.html',
 			method:'POST',
 			data:institution_data,
 			success:function(r){
 				if(r&&r.success){
 					//1.将数据追加到datagrid中
 					var row_data=getInstitutionInfo2InstitutionGrid(r.child);
 					addBusinessInstitutionGrdInstitutionGrid(row_data);
 					//2.将添加机构界面进行清空处理
 					resetBusinessInstitutionSearchAddInstitutionDialogForm();
 					//3.机构编号
 					$('#business_institution_info_form_id').val(r.child.backup);
 					//4.关闭对话框
 					addInstitutionInfoCloseBtn();
 				}
 			},
 			error:function(r){
 				$.messager.alert('提示','访问服务发生异常....','error');
 			}
 		});
 	}
 }
 
 /**
  * 将后台数据转化为机构列表datagrid row_data
  * @params{} _data 后台数据对象
  * @return   json
  **/
 function getInstitutionInfo2InstitutionGrid(_data){
 	var  json ={
		instId					:_data.instId,
		instName				:_data.instName,
		instTel					:_data.instTel,
		instHead				:_data.instHead,
		approRev				:_data.approRev,
		amountLmt				:_data.amountLmt,
		fatherInst				:_data.fatherInst,
		instAddr				:_data.instAddr,
		postCode				:_data.postCode,
		instUrl					:_data.instUrl,
		linkMan					:_data.linkMan,
		instFax					:_data.instFax,
		instMail				:_data.instMail  
 	};
 	return json;
 }
 
 /**
  * 添加机构的关闭按钮事件
  **/
 function addInstitutionInfoCloseBtn(){
 	//1.将对话框中的内容清空
 	resetBusinessInstitutionSearchAddInstitutionDialogForm();
 	//2.关闭对话框
 	business_institution_search_add_institution_dialog.dialog('close');
 }
//-->
</script>
<div id="business_institution_search_search_institution_info">
	<table  style="width: 100%;">
		<tr>
			<th>机构名称:</th>
			<td>
			<input id="business_institution_search_name"  style="border:1px solid #95B8E7"/>
			</td>
			<td colspan="2" style="text-align: center;" >
				<div style="float: left;margin-top: 5px;">
					<a id="business_institution_search_query_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
				</div>
				<div style="float: left;margin-left: 10px;margin-top: 5px;">
					<a id="business_institution_search_ok_btn"  href="#" class="easyui-linkbutton" data-options="iconCls:'icon-true'" plain="true">确定</a>
				<div>
			</td>
		</tr>
	</table>
</div>

<div id="business_institution_search_add_institution_dialog">
	<form id="business_institution_search_add_institution_dialog_form">
		<jsp:include flush="true" page="business_institution_info.jsp"></jsp:include>
	</form>
</div>
