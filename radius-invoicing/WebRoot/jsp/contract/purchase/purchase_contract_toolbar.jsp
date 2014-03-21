<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
$(function(){
	//打开按钮
	$('#purchase_order_toolbar_open_btn').on('click',function(){
		
	});
	
	//挂单按钮
	$('#purchase_order_toolbar_pend_btn').on('click',function(){
		var ajax_url = '${path}/order/manager/purchaseOrder/purchase_order_infos_add.html';
		//1.验证必须内容
		var ajax_data=getPurchaseOrderFormAjaxDataFormatter('0');
		//2.提交表单数据通过ajax
		commitForm2Ajax(ajax_url,ajax_data);
	});
	
	//提交合同按钮
	$('#purchase_order_toolbar_ok_btn').on('click',function(){
		var ajax_url = '${path}/order/manager/purchaseOrder/purchase_order_infos_add.html';
		//1.验证必须内容
		var ajax_data=getPurchaseOrderFormAjaxDataFormatter('1');
		//2.提交表单数据通过ajax
		commitForm2Ajax(ajax_url,ajax_data);
	});
	
	//打印按钮
	$('#purchase_order_toolbar_print_btn').on('click',function(){
	});
	
	
	//报表按钮
	$('#purchase_order_toolbar_report_btn').on('click',function(){
	});
	
	
	//关闭按钮
	$('#purchase_order_toolbar_close_btn').on('click',function(){
	});
});
/**
 *格式化采购订单表格数据
 *@param{} _status 当前提交的状态
 **/
function getPurchaseOrderFormAjaxDataFormatter(_status){
	var json={
		
	};
	return json;
}
//-->
</script>
<div style="height: 28px;width: 30%;display:inline;padding-left:20px;">
	<a id="purchase_order_toolbar_new_btn" href="#" class="easyui-linkbutton"  data-options="iconCls:'icon-add'">新建</a>
	<a id="purchase_order_toolbar_open_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-book_open'">打开</a>
	<a id="purchase_order_toolbar_pend_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-attach'">挂单</a>
</div>
<div style="display:inline;width: 30%;margin-left:80px;">
	<a id="purchase_order_toolbar_ok_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'">合同处理</a>
	<a id="purchase_order_toolbar_report_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-chart_bar'">报表</a>
	<a id="purchase_order_toolbar_print_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-print'">打印</a>
</div>
<div style="display:inline;margin-left:200px;">
	<a id="purchase_order_toolbar_print_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-excel_export'">导出</a>
	
	<a id="purchase_order_toolbar_close_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-cancel'">关闭</a>
</div>
