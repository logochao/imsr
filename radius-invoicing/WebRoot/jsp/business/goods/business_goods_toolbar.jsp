<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
$(function(){
	//新建
	$('#business_goods_toolbar_new_btn').on('click',function(){
	});
	//删除
	$('#business_goods_toolbar_delete_btn').on('click',function(){
	});
	//挂单
	$('#business_goods_toolbar_pend_btn').on('click',function(){
	});
	//导入
	$('#business_goods_toolbar_import_btn').on('click',function(){
	});
	//导出
	$('#business_goods_toolbar_export_btn').on('click',function(){
	});
	//关闭
	$('#business_goods_toolbar_close_btn').on('click',function(){
	});
});
//-->
</script>
<div style="height: 28px;width: 30%;display:inline;padding-left:20px;">
	<a id="business_goods_toolbar_new_btn" href="#" class="easyui-linkbutton"  data-options="iconCls:'icon-add'">新建</a>
	<a id="business_goods_toolbar_delete_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-remove'">编辑</a>
	<a id="business_goods_toolbar_pend_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-attach'">挂单</a>
</div>
<div style="display:inline;width: 30%;margin-left:80px;">
	<a id="business_goods_toolbar_ok_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'">商品处理</a>
	<a id="business_goods_toolbar_import_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-excel_import'">导入</a>
	<a id="business_goods_toolbar_export_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-excel_export'">导出</a>
</div>
<div style="display:inline;margin-left:200px;">
	<a id="business_goods_toolbar_close_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">关闭</a>
</div>