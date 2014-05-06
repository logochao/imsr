<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
var contract_sales_open_dialog =null;//打开查询销售合同查询对话框
$(function(){
	//挂单销售合同
	$('#contract_sales_toolbar_pend_btn').on('click',function(){
		var pend_status = $(this).attr("contract_status");
		if($(this).attr("disabled")){
			return ;
		}
		//挂单
		if(!validataSalesContractBase()){//检查必选项
			return ;
		}
		var pend_data = getContractSalesInfo(pend_status);
		var pend_url ='${path}/contract/manager/salescontract/sale_contract_infos_add.html';
		if($('#contract_sales_base_customer_id').val().length>0){
			saveSalesContractInfo(pend_url,pend_data);
		}
		
	});
	//保存销售合同
	$('#contract_sales_toolbar_ok_btn').on('click',function(){
		if($(this).attr("disabled")){
			return ;
		}
		if(!validataSalesContractBase()){//检查必选项
			return ;
		}
		var add_status =$(this).attr("contract_status");
		var add_data = getContractSalesInfo(add_status);
		var add_url ='${path}/contract/manager/salescontract/sale_contract_infos_add.html';
		if($('#contract_sales_base_customer_id').val().length>0){
			saveSalesContractInfo(add_url,add_data);
			resetSalesContract();
		}
	});
	
	//新建销售合同按钮
	$('#contract_sales_toolbar_new_btn').on('click',function(){
		salesContractInit();
	});
	
	contract_sales_open_dialog=$('#contract_sales_open_dialog').show().dialog({
		 title:'选择销售合同',
		 width:800,
		 height:400,
		 collapsible:true,//向上缩小按钮
		 maximizable:true,
		 modal:true,
		 closed:true
	});
	//打开对话框
	$('#contract_sales_toolbar_open_btn').on('click',function(){
		contract_sales_open_dialog.dialog('open');
	});
});

/**
 * 保存销售合同信息
 *@params{} save_url        保存地址
 *@params{} save_data		保存数据
 **/
function saveSalesContractInfo(save_url,save_data){
	$.ajax({
		url:save_url,
		method:'POST',
		data:save_data,
		success:function(r){
			$.messager.show({
				title:'提示',
				msg:r.message,
				timeout:5000
			});
			if(r&&r.success){
				/*
				var btn=$("#contract_sales_toolbar_ok_btn");
				if(r.child==btn.attr('')){//已保存了销售合同,将销售合同按钮禁用
					$("#contract_sales_toolbar_ok_btn").attr("disabled",true);
					$('#contract_sales_toolbar_ok_btn').linkbutton('disable');
					resetSalesContract();//重置整个管理界面
				}else{
					$("#contract_sales_toolbar_pend_btn").attr("disabled",true);
					$('#contract_sales_toolbar_pend_btn').linkbutton('disable');
				}*/
				
				
				//1.设置对应的操作按钮
		 		var pend_btn = $('#contract_sales_toolbar_pend_btn');
		 		var contract_status =pend_btn.attr('contract_status');
		 		if(contract_status==r.child){//判断合同当前状态禁用当前按钮
		 			//选择了未确认的销售合同,并将挂单按钮禁用
		 			pend_btn.attr("disabled",true);
					pend_btn.linkbutton('disable');
		 		}else if($("#contract_sales_toolbar_ok_btn").attr('contract_status')==r.child){//选择当前已确认的销售合同
		 			//禁用挂单按钮
		 			pend_btn.attr("disabled",true);
					pend_btn.linkbutton('disable');
					//禁用提交合同按钮
		 			$("#contract_sales_toolbar_ok_btn").attr("disabled",true);
					$('#contract_sales_toolbar_ok_btn').linkbutton('disable');
					resetSalesContract();//重置整个管理界面
		 		}
				$('#contract_sales_base_status').combobox('setValue',r.child);//设置合同状态
			}
		},
		error:function(r){
			$.messager.alert('提示','访问服务发生异常....','error');
		}
	});
}

/**
 * 获取合同的信息
 *@params{} contract_status
 **/
function getContractSalesInfo(contract_status){
	var json={
	//-----------销售合同信息--------------------------
		id								:$('#constract_sales_base_id').val(),//合同编号
		customerId						:$('#contract_sales_base_customer_id').val(),//客户编号
		customerName					:$('#contract_sales_base_customer_name').val(),//客户名称
		contractFile					:$('#contract_sales_contract_terms_contract_file_id').val(),//合同文件编号
		effectDate						:parseDate($('#contract_sales_contract_terms_effivit_time').datebox('getValue')),//生效日期
		signTime						:parseDate($('#contract_sales_contract_terms_sign_time').datebox('getValue')),//签署日期
		salesMan						:$('#contract_sales_base_sales_man').val(),//业务员
		man								:$('#contract_sales_base_link_man').val(),//联系人
		mobile							:$('#contract_sales_base_link_mobile').val(),//联系人手机
		tel								:$('#contract_sales_base_link_tel').val(),//联系电话
		fax								:$('#contract_sales_base_link_fax').val(),//联系fax
		orderedDate						:parseDate($('#contract_sales_base_order_time').datebox('getValue')),//订货日期
		deliveryDate					:parseDate($('#contract_sales_base_delivery_date').datebox('getValue')),//送货日期
		deliveryPoint					:$('#contract_sales_base_delivery_point').val(),//送货地点
		contractTerms					:$('#contract_sales_contract_terms_contract_terms').val(),//合同条款
		//printTimes					:$('#').val();//打印次数
		//printTime						:$('#').val();//最新打印时间
		//printAcc						:$('#').val(),//最新打印帐号
		//printRecord					:$('#').val(),//最新打印记录
		memo							:$('#contract_sales_contract_mome').val(),//合同备注
		status							:contract_status,//状态
		//auditedStatus					:$('#').val(),//审批状态
		//checkedStatus					:$('#').val(),//验货状态
		validityDate					:parseDate($('#contract_sales_contract_terms_fail_time').datebox('getValue')),//有效期至
	//---------------销售合同支付信息-------------------------------------
	//contractId						:$('#').val(),//合同编号
		cashType						:contract_sales_pay_detail_currency.combobox('getValue'),//币种	
		totalAmount						:$('#contract_sales_base_total_amount').val(),//合同总金额
		upperAmount						:$('#contract_sales_base_upper_rmb').val(),//大写金额
		paymentType						:contract_sales_pay_detail_pay.combobox('getValue'),//付款方式
		//status						:$('#').val(),//状态
		//auditedStatus					:$('#').val(),//审批状态
		//mome							:$('#').val(),//备注
	//--------------保函条款信息------------------------------------------
		guaranteeName:'销售合同保函付款#销售合同保函收款',
		payamount:parseFloat($('#contract_sales_contract_guarantee_pay_amount').val())*100,//保函条款金额
		payTime:parseDate($('#contract_sales_contract_guarantee_pay_time').datebox('getValue')),//付款日期
		receivablesTime:parseDate($('#contract_sales_contract_guarantee_receivables_time').datebox('getValue')),//收款日期
		quaranteeUpperAmount:$('#contract_sales_contract_guarantee_pay_upper_amount').val(),
		guaranteeReceiveType:'602#603'//收付款类型
	};
	return json;
}
/**
 * 验证销售合同必须项
 *@return boolean
 **/
function validataSalesContractBase(){
	var success =true; 
	if($('#constract_sales_base_id').val().length==0){
		$.messager.alert('提示','请点击新建按钮,新建销售合同信息....','error');
		return false;
	}
	if(parseFloat($('#contract_sales_base_total_amount').val())==0){
		$.messager.alert('提示','销售合同总金额为0,不需要保存....','warning');
		return false;
	}
	if(parseFloat($('#contract_sales_pay_detail_surplus_amount').val())>0){
		$.messager.alert('提示','销售合同支付批次未完成,请核实....','warning');
		return false;
	}
	
	return success;
}


/**
 * 重置整个销售合同管理界面中的内容
 **/
function resetSalesContract(){
	//1.base
	//2.销售明细
	//3.合同条款
	//4.销售保函
	//5.支付详情
	//6.合同备注
	//7.合同扫描件
	//8.报价记录
}
</script>
<div style="width: 30%;display:inline;padding-left:20px;">
	<a id="contract_sales_toolbar_new_btn" href="#" class="easyui-linkbutton"  data-options="iconCls:'icon-add'">新建</a>
	<a id="contract_sales_toolbar_open_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-book_open'">打开</a>
	<a id="contract_sales_toolbar_pend_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" contract_status="2401" data-options="iconCls:'icon-attach'">挂单</a>
</div>
<div style="display:inline;width: 30%;margin-left:80px;">
	<a id="contract_sales_toolbar_ok_btn" href="#" class="easyui-linkbutton" contract_status="2402" data-options="iconCls:'icon-save'">合同处理</a>
	<input id="contract_sales_tool_bar_save" type="hidden" value="-1"><!-- 销售合同保存按钮 -->
	<a id="contract_sales_toolbar_report_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-chart_bar'">报表</a>
	<a id="contract_sales_toolbar_print_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-print'">打印</a>
</div>
<jsp:include flush="true" page="contract_sales_init.jsp"></jsp:include>
