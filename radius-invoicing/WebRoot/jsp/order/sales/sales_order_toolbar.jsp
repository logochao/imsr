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
		var ajax_url = '${path}/order/manager/salesorder/sales_order_infos_add.html';
		//1.验证必须内容
		var ajax_data=getAjaxDataFormatter('1');
		console.info(ajax_data);
		console.info(ajax_url);
		//2.提交数据
		commitSalesOrder(ajax_url,ajax_data);
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
 * 获取异步提交提交数据
 * @_status status表示挂单、订单处理
 */
function getAjaxDataFormatter(_status){
	 var json={
	 	salesOrderId   :$('#sales_order_base_id').val(),//销售订货单编号
	 	customerId     :$('#sales_order_base_customer_id').val(),//客户编号
	 	customerName   :$('#sales_order_base_customer_name').val(),//客户名称
	 	orderedDate    :parseDate($('#sales_order_base_order_time').datebox('getValue')),//订货日期
	 	deliveryDate   :parseDate($('#sales_order_base_order_end_time').datebox('getValue')),//送货日期
	 	stats		   :_status,//状态
	 	tradeAssistant :$('#sales_order_base_trade_assistant').val(),//营业员
	 	linkMan        :$('#sales_order_base_link_man').val(),//联系人
	 	fax			   :$('#sales_order_base_link_fax').val(),//fax
	 	deliveryAddress:$('#sales_order_base_delivery_point').val(),//送货地址
	 	tel			   :$('#sales_order_base_link_tel').val(),//电话
	 	terms		   :$('#sales_order_terms_terms').val(),//条款
	 	memo		   :$('#sales_order_memo_memo').val(),//备注
	 	totalAmount    :parseFloat($('#sales_order_base_total_amount').val())*100,//总金额
	 	salesContractId:$('#sales_order_base_sales_contract_id').val()//销售合同编号
	 };
 	return json;
}
/**
 * 验证销售订单表格数据
 *
 */
function validataSalesOrder(){
 	return true;
}


/**
 * 提交销售订单系信息
 * @param ajax_url 异步请求地址
 * @param ajax_data 提交的数据
 **/
function commitSalesOrder(ajax_url,ajax_data){
	/*
	$.ajax({
		url:ajax_url,
		data:ajax_data,
		success:function(data){
			console.info(data);
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
	});**/
	
	
	$.ajax({
		url:ajax_url,//保存销售合同请求地址
		method:'POST',
		data:ajax_data,
		success:function(data){//通讯成功
			console.info(data);
			if(data&&data.success){
				$.messager.show({
					title:'提示',
					msg:data.message,
					timeout:5000,
					showType:'slide'
				});
			}
		},
		error:function(r){//操作失败
			$.messager.alert('提示','访问服务发生异常....','error');
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
