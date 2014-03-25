<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
var purchase_contract_toolbar_btn_status = 0;//默认状态 1 表示新建 2 表示打开 3 表示挂单 4 表示合同处理 5 表示报表 6 表示打印 7 表示导入Excel

$(function(){

	//新建按钮
	$('#purchase_contract_toolbar_new_btn').on('click',function(){
		if($('#purchase_contract_toolbar_btn_status').val()!=1){
			//将界面中的内容进行初始化
			$.ajax({
				url:'${path}/contract/manager/purchaseContract/purchase_contract_init.html',
				method:'POST',
				data:{},
				success:function(r){
					if(r&&r.success){
						$('#purchase_contract_base_id').val(r.child);//设置采购合同编号
						$('#purchase_contract_toolbar_btn_status').val(1);//设置按钮状态
					}
				},
				error:function(r){
					$.messager.alert('提示','访问服务发生异常....','error');			
				}
			});
		}
	});
	
	//打开按钮
	$('#purchase_contract_toolbar_open_btn').on('click',function(){
	});
	
	//挂单按钮
	$('#purchase_contract_toolbar_pend_btn').on('click',function(){
		var ajax_url = '${path}/order/manager/purchaseOrder/purchase_contract_infos_add.html';
		//1.验证必须内容
		var ajax_data=getPurchaseOrderFormAjaxDataFormatter('0');
		//2.提交表单数据通过ajax
		commitForm2Ajax(ajax_url,ajax_data);
	});
	
	//提交合同按钮
	$('#purchase_contract_toolbar_ok_btn').on('click',function(){
		var ajax_url = '${path}/order/manager/purchaseOrder/purchase_contract_infos_add.html';
		//1.验证必须内容
		var ajax_data=getPurchaseOrderFormAjaxDataFormatter('1');
		//2.提交表单数据通过ajax
		commitForm2Ajax(ajax_url,ajax_data);
	});
	
	//打印按钮
	$('#purchase_contract_toolbar_print_btn').on('click',function(){
	});
	
	
	//报表按钮
	$('#purchase_contract_toolbar_report_btn').on('click',function(){
	});
	
	
	//关闭按钮
	$('#purchase_contract_toolbar_close_btn').on('click',function(){
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
	<input id="purchase_contract_toolbar_btn_status" value="0" type="hidden"><!-- 当前状态 -->
	<a id="purchase_contract_toolbar_new_btn" href="#" class="easyui-linkbutton"  data-options="iconCls:'icon-add'">新建</a>
	<a id="purchase_contract_toolbar_open_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-book_open'">打开</a>
	<a id="purchase_contract_toolbar_pend_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-attach'">挂单</a>
</div>
<div style="display:inline;width: 30%;margin-left:80px;">
	<a id="purchase_contract_toolbar_ok_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'">合同处理</a>
	<a id="purchase_contract_toolbar_report_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-chart_bar'">报表</a>
	<a id="purchase_contract_toolbar_print_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-print'">打印</a>
</div>
<div style="display:inline;margin-left:200px;">
	<a id="purchase_contract_toolbar_print_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-excel_export'">导出</a>
	
	<a id="purchase_contract_toolbar_close_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-cancel'">关闭</a>
</div>
