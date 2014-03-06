<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
<!--
$(function(){
	//打开按钮
	$('#client_inquiry_toolbar_open_btn').on('click',function(){
		
	});
	
	//挂单按钮
	$('#client_inquiry_toolbar_pend_btn').on('click',function(){
		
	});
	
	//提交合同按钮
	$('#client_inquiry_toolbar_ok_btn').on('click',function(){
	});
	
	//打印按钮
	$('#client_inquiry_toolbar_print_btn').on('click',function(){
	
	});
	
	
	//报表按钮
	$('#client_inquiry_toolbar_report_btn').on('click',function(){
	
	});
	
	
	//关闭按钮
	$('#client_inquiry_toolbar_close_btn').on('click',function(){
	
	});
});
//-->
</script>
<div style="height: 28px;width: 30%;display:inline;padding-left:20px;">
	<a id="client_inquiry_toolbar_new_btn" href="#" class="easyui-linkbutton"  data-options="iconCls:'icon-add'">新建</a>
	<a id="client_inquiry_toolbar_open_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-book_open'">打开</a>
	<a id="client_inquiry_toolbar_pend_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-attach'">挂单</a>
</div>
<div style="display:inline;width: 30%;margin-left:80px;">
	<a id="client_inquiry_toolbar_ok_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-true'">合同提交</a>
	<input id="client_inquiry_tool_bar_save" type="hidden" value="-1">
	<a id="client_inquiry_toolbar_report_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-chart_bar'">报表</a>
	<a id="client_inquiry_toolbar_print_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-print'">打印</a>
</div>
<div style="display:inline;margin-left:200px;">
	<a id="client_inquiry_toolbar_close_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">关闭</a>
</div>
