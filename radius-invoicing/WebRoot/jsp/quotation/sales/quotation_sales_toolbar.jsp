<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
var quotation_sales_open_dialog= null;
$(function(){
	$('#quotation_sales_toolbar_new_btn').on('click',function(){
		salesQuotationInit();
	});
	//打开按钮
	$('#quotation_sales_toolbar_open_btn').on('click',function(){
		quotation_sales_open_dialog.dialog('open');
	});
	//挂单按钮
	$('#quotation_sales_toolbar_pend_btn').on('click',function(){
		var _status = $(this).attr("contract_status");
		if($(this).attr("disabled")){
			return ;
		}
		//1.验证必须内容
		if(!validataSupplierQuotation()){
			return ;
		}
		
		//2.提交表单数据通过ajax
		var ajax_url = '${path}/quotation/manager/supplierQuotation/supplier_quotation_infos_add.html';
		var ajax_data=getSupplierQuotationInfoFormatter(_status);
		submitSupplierQuotationInfo(ajax_url,ajax_data);
	});
	//提交合同按钮
	$('#quotation_sales_toolbar_ok_btn').on('click',function(){
		var _status = $(this).attr("contract_status");
		if($(this).attr("disabled")){
			return ;
		}
		//1.验证必须内容
		if(!validataSupplierQuotation()){
			return ;
		}
		
		//2.提交表单数据通过ajax
		var ajax_url = '${path}/quotation/manager/supplierQuotation/supplier_quotation_infos_add.html';
		var ajax_data=getSupplierQuotationInfoFormatter(_status);
		submitSupplierQuotationInfo(ajax_url,ajax_data);
	});
	//打印按钮
	$('#quotation_sales_toolbar_print_btn').on('click',function(){
	});
	//报表按钮
	$('#quotation_sales_toolbar_report_btn').on('click',function(){
	});
	quotation_sales_open_dialog=$('#quotation_sales_open_dialog').show().dialog({
		 title:'选择供应商报价',
		 width:800,
		 height:400,
		 collapsible:true,//向上缩小按钮
		 maximizable:true,
		 modal:true,
		 closed:true
	});	
});
function validataSupplierQuotation(){
	var success=true;
	success=validataSupplierInquiryBaseId();//检查报价单号
	//其他基本信息校验
	return success;	
}

/**
 *提交供应商报价信息
 **/
function submitSupplierQuotationInfo(ajax_url,ajax_data){
	$.ajax({
		url:ajax_url,
		method:'POST',
		data:ajax_data,
		success:function(r){
			$.messager.show({title:'提示',msg:r.message,timeout:5000});
			if(r&&r.success){
				//1.设置对应的操作按钮
		 		var pend_btn = $('#quotation_sales_toolbar_pend_btn');
		 		var contract_status =pend_btn.attr('contract_status');
		 		if(contract_status==r.child){//判断合同当前状态禁用当前按钮
		 			//选择了未确认的销售合同,并将挂单按钮禁用
		 			pend_btn.attr("disabled",true);
					pend_btn.linkbutton('disable');
		 		}else if ($("#quotation_sales_toolbar_ok_btn").attr('contract_status')==r.child){//选择当前已确认的销售合同
		 			//禁用挂单按钮
		 			pend_btn.attr("disabled",true);
					pend_btn.linkbutton('disable');
					//禁用提交合同按钮
		 			$("#quotation_sales_toolbar_ok_btn").attr("disabled",true);
					$('#quotation_sales_toolbar_ok_btn').linkbutton('disable');
		 		}
				$('#quotation_sales_base_status').combobox('setValue',r.child);//设置状态
			}
		},
		error:function(r){
			$.messager.alert('提示','访问服务发生异常....','error');
		}
	});
}

function getSupplierQuotationInfoFormatter(_status){
	var json={
		supplierQuotationId			:$('#quotation_sales_base_id').val(),//采购报价单
		customerId					:$('#quotation_sales_base_customer_id').val(),//供应商编号
		customerName				:$('#quotation_sales_base_customer_name').val(),//供应商名称
		cashType					:quotation_sales_base_cash_type.combobox('getValue'),//币种
		address						:$('#quotation_sales_base_delivery_point').val(),//送货地址
		man							:$('#quotation_sales_base_link_man').val(),//联系人
		mobile						:$('#quotation_sales_base_link_mobile').val(),//联系人手机
		tel							:$('#quotation_sales_base_link_tel').val(),//联系电话
		fax							:$('#quotation_sales_base_link_fax').val(),//联系fax
		inquiryDate					:parseDate($('#quotation_sales_base_order_time').val()),//询价日期
		latestQuotateDate			:parseDate($('#quotation_sales_base_order_end_time').val()),//最迟报价日期
		salesman					:$('#quotation_sales_base_sales_man').val(),//业务员
		status						:_status,//状态
		//printTimes				:$('#').val(),//打印次数
		//printTime					:$('#').val(),//最新打印时间
		//printRecord				:$('#').val(),//最新打印记录
		purchaseInquiryId			:$('#quotation_sales_base_purchase_inquiry_id').val(),//采购询价单号
		memo						:$('#quotation_sales_memo').val(),//备注
	};
	
	return json;
}
//-->
</script>
<div style="height: 28px;width: 30%;display:inline;padding-left:20px;">
	<a id="quotation_sales_toolbar_new_btn" href="#" class="easyui-linkbutton"  data-options="iconCls:'icon-add'">新建</a>
	<a id="quotation_sales_toolbar_open_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-book_open'">打开</a>
	<a id="quotation_sales_toolbar_pend_btn" href="#" class="easyui-linkbutton" contract_status="2401" style="margin-left:20px;" data-options="iconCls:'icon-attach'">挂单</a>
</div>
<div style="display:inline;width: 30%;margin-left:80px;">
	<a id="quotation_sales_toolbar_ok_btn" href="#" class="easyui-linkbutton" contract_status="2402" data-options="iconCls:'icon-save'">报价处理</a>
	<input id="quotation_sales_tool_bar_save" type="hidden" value="-1">
	<a id="quotation_sales_toolbar_report_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-chart_bar'">报表</a>
	<a id="quotation_sales_toolbar_print_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-print'">打印</a>
</div>
<jsp:include flush="true" page="quotation_sales_init.jsp"></jsp:include>