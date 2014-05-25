<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
var purchase_order_open_dialog = null;
$(function(){
    $('#purchase_order_toolbar_new_btn').on('click',function(){
		purchaseOrderInit();
    });
	//打开按钮
	$('#purchase_order_toolbar_open_btn').on('click',function(){
		purchase_order_open_dialog.dialog('open');
	});
	
	//挂单按钮
	$('#purchase_order_toolbar_pend_btn').on('click',function(){
	
		var pend_status = $(this).attr("contract_status");
		if($(this).attr("disabled")){
			return ;
		}
		//挂单
		if(!validataPurchaseOrderBase()){//检查必选项
			return ;
		}
		var pend_data = getPurchaseOrderFormAjaxDataFormatter(pend_status);
		var pend_url ='${path}/order/manager/purchaseOrder/purchase_order_infos_add.html';
		commitPurchaseOrderFormAjax(pend_url,pend_data);
	});
	
	//提交合同按钮
	$('#purchase_order_toolbar_ok_btn').on('click',function(){
		if($(this).attr("disabled")){
			return ;
		}
		if(!validataPurchaseOrderBase()){//检查必选项
			return ;
		}
		var add_status =$(this).attr("contract_status");
		var add_data = getPurchaseOrderFormAjaxDataFormatter(add_status);
		var add_url ='${path}/order/manager/purchaseOrder/purchase_order_infos_add.html';
		commitPurchaseOrderFormAjax(add_url,add_data);
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
	
	purchase_order_open_dialog=$('#purchase_order_open_dialog').show().dialog({
		 title:'选择采购订单',
		 width:800,
		 height:400,
		 collapsible:true,//向上缩小按钮
		 maximizable:true,
		 modal:true,
		 closed:true
	});
});

function commitPurchaseOrderFormAjax(ajax_url,ajax_data){
	$.ajax({
		url:ajax_url,
		data:ajax_data,
		success:function(r){
			if(r&&r.success){
				
				//1.设置对应的操作按钮
		 		var pend_btn = $('#purchase_order_toolbar_pend_btn');
		 		var contract_status =pend_btn.attr('contract_status');
		 		if(contract_status==r.child){//判断合同当前状态禁用当前按钮
		 			//选择了未确认的销售合同,并将挂单按钮禁用
		 			pend_btn.attr("disabled",true);
					pend_btn.linkbutton('disable');
		 		}else if($("#purchase_order_toolbar_ok_btn").attr('contract_status')==r.child){//选择当前已确认的销售合同
		 			//禁用挂单按钮
		 			pend_btn.attr("disabled",true);
					pend_btn.linkbutton('disable');
					//禁用提交合同按钮
		 			$("#purchase_order_toolbar_ok_btn").attr("disabled",true);
					$('#purchase_order_toolbar_ok_btn').linkbutton('disable');
					//resetSalesContract();//重置整个管理界面
		 		}
				$('#purchase_order_base_status').combobox('setValue',r.child);//设置合同状态
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
		purchaseOrderId				:$('#purchase_order_base_id').val(),//采购订货单编号
		supplierId					:$('#purchase_order_base_supplier_id').val(),//供货商编号
		supplierName				:$('#purchase_order_base_supplier_name').val(),//供货商名称
		linkMan						:$('#purchase_order_base_link_man').val(),//联系人
		mobile						:$('#purchase_order_base_link_tel').val(),//联系人手机
		tel							:$('#purchase_order_base_link_mobile').val(),//电话
		fax							:$('#purchase_order_base_link_fax').val(),//fax
		salesOrderId				:$('#purchase_order_base_sales_order_id').val(),//销售订货单编号
		totalAmont					:parseFloat($('#purchase_order_base_total_amount').val())*100,//订货金额
		orderedDate					:parseDate($('#purchase_order_base_order_time').val()),//订货日期
		deliveryDate				:parseDate($('#purchase_order_base_order_end_time').val()),//送货日期
		deliveryPoint				:$('#purchase_order_base_delivery_point').val(),//送货地址
		terms						:$('#purchase_order_terms').val(),//条款
		memo						:$('#purchase_order_memo').val(),//备注
		status						:_status,//状态
		//consolidatedFlg				:;//合单标识
		//consolidatedPurchaseOrderId	:$('#').val(),//合单后订单号
		//printTimes				:;//打印次数
		//printTime					:;//最新打印时间
		//printAcc					:$('#').val(),//最新打印帐号
		//printRecord				:$('#').val(),//最新打印记录
		purchaser					:$('#purchase_order_base_purchaser').val()//采购员
	};
	return json;
}

function validataPurchaseOrderBase(){
	var success =true; 
	if($('#purchase_order_base_id').val().length==0){
		$.messager.alert('提示','请点击新建按钮,新建采购订单信息....','error');
		return false;
	}
	if(parseFloat($('#purchase_order_base_total_amount').val())==0){
		$.messager.alert('提示','采购订单总金额为0,不需要保存....','warning');
		return false;
	}
	return success;
}
//-->
</script>
<div style="height: 28px;width: 30%;display:inline;padding-left:20px;">
	<a id="purchase_order_toolbar_new_btn" href="#" class="easyui-linkbutton"  data-options="iconCls:'icon-add'">新建</a>
	<a id="purchase_order_toolbar_open_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-book_open'">打开</a>
	<a id="purchase_order_toolbar_pend_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" contract_status="2401" data-options="iconCls:'icon-attach'">挂单</a>
</div>
<div style="display:inline;width: 30%;margin-left:80px;">
	<a id="purchase_order_toolbar_ok_btn" href="#" class="easyui-linkbutton" contract_status="2402" data-options="iconCls:'icon-save'">订单处理</a>
	<a id="purchase_order_toolbar_report_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-chart_bar'">报表</a>
	<a id="purchase_order_toolbar_print_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-print'">打印</a>
</div>
<jsp:include flush="true" page="purchase_order_init.jsp"></jsp:include>