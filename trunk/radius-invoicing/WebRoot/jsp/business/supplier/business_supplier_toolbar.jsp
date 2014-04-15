<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
$(function(){
	//新建
	$('#business_supplier_toolbar_new_btn').on('click',function(){
		business_supplier_search_add_supplier_dialog.dialog('open');
	});
	/**商品处理
	$('#business_supplier_toolbar_ok_btn').on('click',function(){
	});**/
	//导入
	$('#business_supplier_toolbar_import_btn').on('click',function(){
	});
	//导出
	$('#business_supplier_toolbar_export_btn').on('click',function(){
	});
	//关闭
	$('#business_supplier_toolbar_close_btn').on('click',function(){
	});
});
//-->
</script>
<div style="height: 28px;width: 30%;display:inline;padding-left:20px;">
	<a id="business_supplier_toolbar_new_btn" href="#" class="easyui-linkbutton"  data-options="iconCls:'icon-add'">新建</a>
	<%--<a id="business_supplier_toolbar_ok_btn" style="margin-left:20px;" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'">供应商处理</a>
	--%><a id="business_supplier_toolbar_import_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-excel_import'">导入</a>
	<a id="business_supplier_toolbar_export_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-excel_export'">导出</a>
</div>
