<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
var purchase_inquiry_open_dialog = null;
$(function(){
	$('#purchase_inquiry_toolbar_new_btn').on('click',function(){
		purchaseInquiryInit();
	});
	//打开按钮
	$('#purchase_inquiry_toolbar_open_btn').on('click',function(){
		purchase_inquiry_open_dialog.dialog('open');
	});
	//挂单按钮
	$('#purchase_inquiry_toolbar_pend_btn').on('click',function(){
		var _status = $(this).attr("contract_status");
		if($(this).attr("disabled")){
			return ;
		}
		//1.验证必须内容
		if(!validataPurchaseInquiry()){
			return ;
		}
		
		//2.提交表单数据通过ajax
		var ajax_url = '${path}/inquiry/manager/purchaseInquiry/purchase_inquiry_infos_add.html';
		var ajax_data=getPurchaseInquiryFormAjaxDataFormatter(_status);
		submitPurchaseInquiryInfo(ajax_url,ajax_data);
	});
	//提交合同按钮
	$('#purchase_inquiry_toolbar_ok_btn').on('click',function(){
		var _status = $(this).attr("contract_status");
		if($(this).attr("disabled")){
			return ;
		}
		//1.验证必须内容
		if(!validataPurchaseInquiry()){
			return ;
		}
		var ajax_url = '${path}/inquiry/manager/purchaseInquiry/purchase_inquiry_infos_add.html';
		var ajax_data=getPurchaseInquiryFormAjaxDataFormatter(_status);
		submitPurchaseInquiryInfo(ajax_url,ajax_data);
	});
	//打印按钮
	$('#purchase_inquiry_toolbar_print_btn').on('click',function(){
	});
	//报表按钮
	$('#purchase_inquiry_toolbar_report_btn').on('click',function(){
	});
	
	purchase_inquiry_open_dialog=$('#purchase_inquiry_open_dialog').show().dialog({
		 title:'选择客户询价',
		 width:800,
		 height:400,
		 collapsible:true,//向上缩小按钮
		 maximizable:true,
		 modal:true,
		 closed:true
	});	
});


function submitPurchaseInquiryInfo(ajax_url,ajax_data){
	$.ajax({
		url:ajax_url,
		method:'POST',
		data:ajax_data,
		success:function(r){
			$.messager.show({title:'提示',msg:r.message,timeout:5000});
			if(r&&r.success){
				//1.设置对应的操作按钮
		 		var pend_btn = $('#purchase_inquiry_toolbar_pend_btn');
		 		var contract_status =pend_btn.attr('contract_status');
		 		if(contract_status==r.child){//判断合同当前状态禁用当前按钮
		 			//选择了未确认的销售合同,并将挂单按钮禁用
		 			pend_btn.attr("disabled",true);
					pend_btn.linkbutton('disable');
		 		}else if ($("#purchase_inquiry_toolbar_ok_btn").attr('contract_status')==r.child){//选择当前已确认的销售合同
		 			//禁用挂单按钮
		 			pend_btn.attr("disabled",true);
					pend_btn.linkbutton('disable');
					//禁用提交合同按钮
		 			$("#purchase_inquiry_toolbar_ok_btn").attr("disabled",true);
					$('#purchase_inquiry_toolbar_ok_btn').linkbutton('disable');
		 		}
				$('#purchase_inquiry_base_status').combobox('setValue',r.child);//设置合同状态
			}
		},
		error:function(r){
			$.messager.alert('提示','访问服务发生异常....','error');
		}
	});
}
/**
 * 验证客户询价
 **/
function validataPurchaseInquiry(){
	var success=true;
	if($('#purchase_inquiry_base_id').val().length==0){
		$.messager.alert('提示','请点击新建按钮,新建采购询价信息....','error');
		return false;
	}
	if(!$('#purchase_inquiry_base_supplier_id').val().length>0){
		$.messager.alert('提示','请供应商信息....','error');
		return false;
	}
	//其他基本信息校验
	return success;	
}

function getPurchaseInquiryFormAjaxDataFormatter(_status){
	var json={
			purchaseInquiryId	:$('#purchase_inquiry_base_id').val(),//销售询价单编号
			supplierId			:$('#purchase_inquiry_base_supplier_id').val(),//客户编号
			supplierName		:$('#purchase_inquiry_base_supplier_name').val(),//客户简称
			cashType			:purchase_inquiry_base_cash_type.combobox("getValue"),//币种
			address				:$('#purchase_inquiry_base_delivery_point').val(),//送货地址
			man					:$('#purchase_inquiry_base_link_man').val(),//联系人
			mobile				:$('#purchase_inquiry_base_link_mobile').val(),//联系人手机
			tel					:$('#purchase_inquiry_base_link_tel').val(),//联系电话
			fax					:$('#purchase_inquiry_base_link_fax').val(),//联系fax
			inquiryDate			:parseDate($('#purchase_inquiry_base_order_time').val()),//询价日期
			latestQuotateDate	:parseDate($('#purchase_inquiry_base_order_end_time').val()),//最迟报价日期
			salesman			:$('#purchase_inquiry_base_sales_man').val(),//业务员
			status				:_status,//状态
			//printTimes			:$('#').val(),打印次数
			//printTime			:$('#').val(),最新打印时间
			//printRecord			:$('#').val(),//最新打印记录
			memo				:$('#purchase_inquiry_memo').val()//备注
	};
	return json;
}
//-->
</script>
<div style="height: 28px;width: 30%;display:inline;padding-left:20px;">
	<a id="purchase_inquiry_toolbar_new_btn" href="#" class="easyui-linkbutton"  data-options="iconCls:'icon-add'">新建</a>
	<a id="purchase_inquiry_toolbar_open_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-book_open'">打开</a>
	<a id="purchase_inquiry_toolbar_pend_btn" href="#" class="easyui-linkbutton" contract_status="2401" style="margin-left:20px;" data-options="iconCls:'icon-attach'">挂单</a>
</div>
<div style="display:inline;width: 30%;margin-left:80px;">
	<a id="purchase_inquiry_toolbar_ok_btn" href="#" class="easyui-linkbutton" contract_status="2402" data-options="iconCls:'icon-save'">提交询价</a>
	<input id="purchase_inquiry_tool_bar_save" type="hidden" value="-1">
	<a id="purchase_inquiry_toolbar_report_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-chart_bar'">报表</a>
	<a id="purchase_inquiry_toolbar_print_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-print'">打印</a>
</div>
<jsp:include flush="true" page="purchase_inquiry_init.jsp"></jsp:include>