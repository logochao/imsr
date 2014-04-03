<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function(){
	//新建
	$('#spec_type_toolbar_new_btn').on('click',function(){
		spec_type_form_dialog.dialog('open');
	});
	//规格处理
	$('#spec_type_toolbar_ok_btn').on('click',function(){
	});
	//规格处理
	$('#spec_type_toolbar_edit_btn').on('click',function(){
		var rows=spec_type_grd_spec_type_info_grid.datagrid('getSelections');
		if(rows.length==0){
			$.messager.alert('提示','请选择待编辑的行....','warning');
			return ;			
		}
		if(rows.length>1){
			$.messager.alert('提示','请选择单行数据进行编辑....','warning');
			return ;
		}
		setSpecTypeInfoDaliog(rows[0]);
		spec_type_form_dialog.dialog('open');
	});
	//导入
	$('#spec_type_toolbar_import_btn').on('click',function(){
	});
	//导出
	$('#spec_type_toolbar_export_btn').on('click',function(){
	});
	//关闭
	$('#spec_type_toolbar_close_btn').on('click',function(){
	});
});

//-->
</script>
<div style="height: 28px;width: 30%;display:inline;padding-left:20px;">
	<a id="spec_type_toolbar_new_btn" href="#" class="easyui-linkbutton"  data-options="iconCls:'icon-add'">新建</a>
	<a id="spec_type_toolbar_ok_btn" style="margin-left:20px;" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'">规格处理</a>
	<a id="spec_type_toolbar_edit_btn" style="margin-left:20px;" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-page_edit'">规格编辑</a>
	<a id="spec_type_toolbar_import_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-excel_import'">导入</a>
	<a id="spec_type_toolbar_export_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-excel_export'">导出</a>
</div>