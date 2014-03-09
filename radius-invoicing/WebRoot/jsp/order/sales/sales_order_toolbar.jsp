<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
//-1表示没有进行任何操作 0表示进行了挂单 1表示进行了提交 2表示了进行了挂单和提交 3表示了提交和挂单
var sales_order_tool_bar_save=null;
$(function(){
	//打开按钮
	$('#sales_order_toolbar_open_btn').on('click',function(){
		
	});
	
	//挂单按钮
	$('#sales_order_toolbar_pend_btn').on('click',function(){
		
	});
	
	//提交合同按钮
	$('#sales_order_toolbar_ok_btn').on('click',function(){
		//1.验证必须内容
		//2.提交数据
		
	});
	
	//打印按钮
	$('#sales_order_toolbar_print_btn').on('click',function(){
	
	});
	
	
	//报表按钮
	$('#sales_order_toolbar_report_btn').on('click',function(){
	
	});
	
	
	//关闭按钮
	$('#sales_order_toolbar_close_btn').on('click',function(){
	
	});
});
/**
 * 提交销售订单系信息
 * @param ajax_url 异步请求地址
 * @param ajax_data 提交的数据
 **/
function commitSalesOrder(ajax_url,ajax_data){
	$.ajax({
		url:ajax_url,
		data:ajax_data,
		success:function(data){
			if(data&&data.success){
				$.messager.show({
					title:'提示',
					msg:data.message,
					timeout:5000,
					showType:'slide'
				});
			}
		},
		error:function(data){
			console.info(data);
			console.info('与服务端通信失败...');
		}
	});
}
//-->
</script>
<div style="height: 28px;width: 30%;display:inline;padding-left:20px;">
	<a id="sales_order_toolbar_new_btn" href="#" class="easyui-linkbutton"  data-options="iconCls:'icon-add'">新建</a>
	<a id="sales_order_toolbar_open_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-book_open'">打开</a>
	<a id="sales_order_toolbar_pend_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-attach'">挂单</a>
</div>
<div style="display:inline;width: 30%;margin-left:80px;">
	<a id="sales_order_toolbar_ok_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'">订单处理</a>
	<input id="sales_order_tool_bar_save" type="hidden" value="-1"><!-- 销售合同保存按钮 -->
	<a id="sales_order_toolbar_report_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-chart_bar'">报表</a>
	<a id="sales_order_toolbar_print_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-print'">打印</a>
</div>
<div style="display:inline;margin-left:200px;">
	<a id="sales_order_toolbar_print_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-excel_export'">导出</a>
	
	<a id="sales_order_toolbar_close_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-cancel'">关闭</a>
</div>
