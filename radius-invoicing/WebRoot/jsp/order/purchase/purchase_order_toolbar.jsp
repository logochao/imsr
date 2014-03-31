<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
$(function(){
	//打开按钮
	$('#purchase_order_toolbar_open_btn').on('click',function(){
		
	});
	
	//挂单按钮
	$('#purchase_order_toolbar_pend_btn').on('click',function(){
		if(parseFloat($('#purchase_order_base_total_amount').val())*100){
			var ajax_url = '${path}/order/manager/purchaseOrder/purchase_order_infos_add.html';
			var combox_data=purchase_order_base_status.combobox('getData');
			for(var i=0,length=combox_data.length;i<length;i++){
				if(combox_data[i].name=='未确认'){
					//1.验证必须内容
					var ajax_data=getPurchaseOrderFormAjaxDataFormatter(combox_data[i].id);
					console.info(ajax_data);
					//2.提交表单数据通过ajax
					commitPurchaseOrderFormAjax(ajax_url,ajax_data);
					break;
				}
			}
		}
	});
	
	//提交合同按钮
	$('#purchase_order_toolbar_ok_btn').on('click',function(){
		if(parseFloat($('#purchase_order_base_total_amount').val())*100>0&&purchase_order_base_status.combobox('getText')=='未确认'){
			var ajax_url = '${path}/order/manager/purchaseOrder/purchase_order_infos_add.html';
			var combox_data=purchase_order_base_status.combobox('getData');
			for(var i=0,length=combox_data.length;i<length;i++){
				if(combox_data[i].name=='已确认'){//
					//1.验证必须内容
					var ajax_data=getPurchaseOrderFormAjaxDataFormatter(combox_data[i].id);
					console.info(ajax_data);
					//2.提交表单数据通过ajax
					commitPurchaseOrderFormAjax(ajax_url,ajax_data);
					break;
				}
			}
		}
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

function commitPurchaseOrderFormAjax(ajax_url,ajax_data){
	$.ajax({
		url:ajax_url,
		method:'POST',
		data:ajax_data,
		success:function(r){
			if(r&&r.success){
				purchase_order_base_status.combobox("setValue",r.child);//设置当前定的订单状态
				$.messager.show({
					title:'提示',
					msg:r.message,
					timeout:5000,
					showType:'slide'
				});
			}
		},
		error:function(r){
			$.messager.alert('提示','与服务端通讯失败...','error');
		}
	});
}

/**
 *格式化采购订单表格数据
 *@param{} _status 当前提交的状态
 **/
function getPurchaseOrderFormAjaxDataFormatter(_status){
	var json={
		purchaseOrderId:$('#purchase_order_base_id').val(),//采购订货单编号
		purchaseOrderMergerId:'',//合并后的订单号
		stats:_status,//状态
		orderedDate:parseDate($('#purchase_order_base_order_time').datebox('getValue')),//订货日期
		deliveryDate:parseDate($('#purchase_order_base_order_end_time').datebox('getValue')),//送货日期
		supplierId:$('#purchase_order_base_supplier_id').val(),//供货商编号
		supplierName:$('#purchase_order_base_supplier_name').val(),//供货商名称
		tel:$('#purchase_order_base_link_tel').val(),//电话
		linkMan:$('#purchase_order_base_link_man').val(),//联系人
		purchaser:$('#purchase_order_base_purchaser').val(),//采购员
		terms:$('#purchase_order_terms').val(),//条款
		fax:$('#purchase_order_base_link_fax').val(),
		customerBillId:$('#purchase_order_base_supplier_name').val(),//客户订单号
		deliveryPoint:$('#purchase_order_base_delivery_point').val(),//送货地点
		qualityStatus:'',//质检状态
		auditStatus:'',//审核状态
		instoreStatus:'',//入库状态
		paymentStatus:'',//收货状态
		paymentedStatus:'',//结帐状态
		purchaseReceiveOrderId:'',//采购收货单编号
		instoreId:'',//入库单号
		goodsQtId:'',//商品质检单编号
		orderedAmount:parseFloat($('#purchase_order_base_total_amount').val())*100,//订货金额
		memo:$('#purchase_order_memo').val()//备注
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
	<a id="purchase_order_toolbar_ok_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'">订单处理</a>
	<a id="purchase_order_toolbar_report_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-chart_bar'">报表</a>
	<a id="purchase_order_toolbar_print_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-print'">打印</a>
</div>
<div style="display:inline;margin-left:200px;">
	<a id="purchase_order_toolbar_print_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-excel_export'">导出</a>
	
	<a id="purchase_order_toolbar_close_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-cancel'">关闭</a>
</div>
