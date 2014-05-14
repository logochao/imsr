<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
var purchase_contract_toolbar_btn_status = 0;
var purchase_contract_open_dialog = null;
$(function(){

	//新建按钮
	$('#purchase_contract_toolbar_new_btn').on('click',function(){
		purchaseContractInit();
	});
	
	//打开按钮
	$('#purchase_contract_toolbar_open_btn').on('click',function(){
		purchase_contract_open_dialog.dialog('open');
	});
	
	//挂单按钮
	$('#purchase_contract_toolbar_pend_btn').on('click',function(){
		var _status = $(this).attr("contract_status");
		if($(this).attr("disabled")){
			return ;
		}
		//1.验证必须内容
		if(!validataPurchaseContract()){
			return ;
		}
		
		//2.提交表单数据通过ajax
		var ajax_url = '${path}/order/manager/purchaseOrder/purchase_contract_infos_add.html';
		var ajax_data=getPurchaseOrderFormAjaxDataFormatter('3541');
		submitPurchseContractInfo(ajax_url,ajax_data);
	});
	
	//提交合同按钮
	$('#purchase_contract_toolbar_ok_btn').on('click',function(){
		
		var _status = $(this).attr("contract_status");
		if($(this).attr("disabled")){
			return ;
		}
		//1.验证必须内容
		if(!validataPurchaseContract()){
			return ;
		}
		var ajax_url = '${path}/contract/manager/purchaseContract/purchase_contract_infos_add.html';
		var ajax_data=getPurchaseOrderFormAjaxDataFormatter(_status);
		//2.提交表单数据通过ajax
		submitPurchseContractInfo(ajax_url,ajax_data);
	});
	
	//打印按钮
	$('#purchase_contract_toolbar_print_btn').on('click',function(){
	});
	
	
	//报表按钮
	$('#purchase_contract_toolbar_report_btn').on('click',function(){
	});
	
	purchase_contract_open_dialog=$('#purchase_contract_open_dialog').show().dialog({
		 title:'选择销售订单',
		 width:800,
		 height:400,
		 collapsible:true,//向上缩小按钮
		 maximizable:true,
		 modal:true,
		 closed:true
	});	
});
/**
 *格式化采购订单表格数据
 *@param{} _status 当前提交的状态
 **/
function getPurchaseOrderFormAjaxDataFormatter(_status){
	var json={
		id				:$('#purchase_contract_base_id').val(),//合同编号
		orderId			:$('#purchase_contract_base_purchase_order_id').val(),//采购订货单编号
		supplierId		:$('#purchase_contract_base_supplier_id').val(),//供货商编号
		supplierName	:$('#purchase_contract_base_supplier_name').val(),//供应商名称
		contractFile	:$('#purchase_contract_terms_contract_file').val(),//合同文件名称
		effectDate		:parseDate($('#purchase_contract_terms_effivit_time').datebox('getValue')),//生效日期
		signTime		:parseDate($('#purchase_contract_terms_sign_time').datebox('getValue')),//签署日期
		purchaser		:$('#purchase_contract_base_clerk').val(),//采购员
		man				:$('#purchase_contract_base_link_man').val(),//联系人
		mobile			:$('#purchase_contract_base_link_mobile').val(),//联系人手机
		tel				:$('#purchase_contract_base_link_tel').val(),//联系电话
		fax				:$('#purchase_contract_base_link_fax').val(),//联系fax
		orderedDate		:parseDate($('#purchase_contract_base_order_time').datebox('getValue')),//订货日期
		deliveryDate	:parseDate($('#purchase_contract_base_order_end_time').datebox('getValue')),//送货日期
		deliveryPoint	:$('#purchase_contract_base_delivery_point').val(),//送货地点
		contractTerms	:$('#purchase_contract_terms').val(),//合同条款
		//printTime		:'',//最新打印时间
		//printAcc		:'',//最新打印帐号
		//printRecord	:'',//最新打印记录
		//printTimes	:'',//打印次数
		//paymentedStatus:'',//结帐状态
		validityDate	:parseDate($('#purchase_contract_terms_validity_time').datebox('getValue')),//有效期至
		status			:_status,
		memo			:$('#purchase_contract_memo').val(),
		 //-------------采购支付数据类型
		cashType		:$('#purchase_contract_pay_detail_currency').combobox('getText'),//币种
		totalAmount		:parseFloat($('#purchase_contract_base_total_amount').val())*100,//合同总金额
		upperAmount		:$('#purchase_contract_base_upper_rmb').val(),//大写金额
		paymentType		:$('#purchase_contract_pay_detail_pay').combobox('getText')//付款方式
		 
	};
	return json;
}
/**
 * 提交采购合同信息
 * @params{} ajax_url
 * @params{} ajax_data
 *
 **/
function submitPurchseContractInfo(ajax_url,ajax_data){
	$.ajax({
		url:ajax_url,
		method:'POST',
		data:ajax_data,
		success:function(r){
			$.messager.show({title:'提示',msg:r.message,timeout:5000});
			if(r&&r.success){
				//1.设置对应的操作按钮
		 		var pend_btn = $('#purchase_contract_toolbar_pend_btn');
		 		var contract_status =pend_btn.attr('contract_status');
		 		if(contract_status==r.child){//判断合同当前状态禁用当前按钮
		 			//选择了未确认的销售合同,并将挂单按钮禁用
		 			pend_btn.attr("disabled",true);
					pend_btn.linkbutton('disable');
		 		}else if ($("#purchase_contract_toolbar_ok_btn").attr('contract_status')==r.child){//选择当前已确认的销售合同
		 			//禁用挂单按钮
		 			pend_btn.attr("disabled",true);
					pend_btn.linkbutton('disable');
					//禁用提交合同按钮
		 			$("#purchase_contract_toolbar_ok_btn").attr("disabled",true);
					$('#purchase_contract_toolbar_ok_btn').linkbutton('disable');
		 		}
				$('#purchase_contract_base_status').combobox('setValue',r.child);//设置合同状态
			}
		},
		error:function(r){
			$.messager.alert('提示','访问服务发生异常....','error');
		}
	});
}

function validataPurchaseContract(){
	var success=true;
	if($('#purchase_contract_base_id').val().length==0){
		$.messager.alert('提示','请点击新建按钮,新建采购合同信息....','error');
		return false;
	}
	if(parseFloat($('#purchase_contract_payment_detail_total_amount').val())==0){
		$.messager.alert('提示','采购合同总金额为0,不需要保存....','warning');
		return false;
	}
	//其他基本信息校验
	return success;
}
//-->
</script>
<div style="height: 28px;width: 30%;display:inline;padding-left:20px;">
	<a id="purchase_contract_toolbar_new_btn" href="#" class="easyui-linkbutton"  data-options="iconCls:'icon-add'">新建</a>
	<a id="purchase_contract_toolbar_open_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-book_open'">打开</a>
	<a id="purchase_contract_toolbar_pend_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" contract_status="2401" data-options="iconCls:'icon-attach'">挂单</a>
</div>
<div style="display:inline;width: 30%;margin-left:80px;">
	<a id="purchase_contract_toolbar_ok_btn" href="#" class="easyui-linkbutton" contract_status="2402" data-options="iconCls:'icon-save'">合同处理</a>
	<a id="purchase_contract_toolbar_report_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-chart_bar'">报表</a>
	<a id="purchase_contract_toolbar_print_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-print'">打印</a>
</div>
<jsp:include flush="true" page="purchase_contract_init.jsp"></jsp:include>