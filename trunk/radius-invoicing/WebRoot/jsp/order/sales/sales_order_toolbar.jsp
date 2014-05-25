<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
//-1表示没有进行任何操作 0表示进行了挂单 1表示进行了提交 2表示了进行了挂单和提交 3表示了提交和挂单
var sales_order_tool_bar_save=null;
var sales_order_open_dialog =null;//销售订单查询对话框
$(function(){
	//打开按钮
	$('#sales_order_toolbar_open_btn').on('click',function(){
		sales_order_open_dialog.dialog('open');
	});
	//挂单按钮
	$('#sales_order_toolbar_pend_btn').on('click',function(){
		var pend_status = $(this).attr("contract_status");
		if($(this).attr("disabled")){
			return ;
		}
		if(!validataSalesOrderBase()){
			return ;
		}
		var pend_data = getAjaxDataFormatter(pend_status);
		var pend_url ='${path}/order/manager/salesorder/sales_order_infos_add.html';
		if($('#sales_order_base_id').val().length>0){
			commitSalesOrder(pend_url,pend_data);
		}
	});
	
	sales_order_open_dialog=$('#sales_order_open_dialog').show().dialog({
		 title:'选择销售订单',
		 width:800,
		 height:400,
		 collapsible:true,//向上缩小按钮
		 maximizable:true,
		 modal:true,
		 closed:true
	});	
	
	//提交合同按钮
	$('#sales_order_toolbar_ok_btn').on('click',function(){
		var save_url = '${path}/order/manager/salesorder/sales_order_infos_add.html';
		var add_status = $(this).attr("contract_status");
		if($(this).attr("disabled")){
			return ;
		}
		if(!validataSalesOrderBase()){
			return;
		}
		//1.验证必须内容
		var save_data=getAjaxDataFormatter(add_status);
		//2.提交数据
		commitSalesOrder(save_url,save_data);
	});
	
	//新建按钮处理
	$('#sales_order_toolbar_new_btn').on('click',function(){
		salesOrderInit();
	});
});

/**
 * 获取异步提交提交数据
 * @_status status表示挂单、订单处理
 */
function getAjaxDataFormatter(_status){
	 var json={
	 	//--------------销售订单信息--------------------------
		salesOrderId		:$('#sales_order_base_id').val(),//销售订货单编号
		customerId			:$('#sales_order_base_customer_id').val(),//客户编号
		customerName		:$('#sales_order_base_customer_name').val(),//客户名称
		linkMan				:$('#sales_order_base_link_man').val(),//联系人
		mobile				:$('#sales_order_base_link_mobile').val(),//联系人手机
		tel					:$('#sales_order_base_link_tel').val(),//电话
		fax					:$('#sales_order_base_link_fax').val(),//fax
		contractId			:$('#sales_order_base_sales_contract_id').val(),//合同编号
		totalAmount			:parseFloat($('#sales_order_base_total_amount').val())*100,//总金额
		upperAmount			:$('#sales_order_base_upper_total_amount').val(),//大写金额
		orderedDate			:parseDate($('#sales_order_base_order_time').val()),//订货日期
		deliveryDate		:parseDate($('#sales_order_base_order_end_time').val()),//送货日期
		deliveryAddress		:$('#sales_order_base_delivery_point').val(),//送货地址
		terms				:$('#sales_order_terms_terms').val(),//条款
		memo				:$('#sales_order_memo_memo').val(),//备注
		status				:_status,//状态
		//splitedFlg			=null;;//拆单标识
		//spliteSalesOrderId	:$('#').val(),//拆分前的
		//printTimes			=null;//打印次数
		//newestPrintTime		=null;//最新打印时
		//newestPrintAcc		:$('#').val(),//最新打印帐号
		//newestPrintRecord		:$('#').val(),//最新打印记
		salesManId			:$('#sales_order_base_trade_assistant').val(),//销售人员//业务员
	 	
	 };
 	return json;
}
/**
 * 验证销售合同必须项
 *@return boolean
 **/
function validataSalesOrderBase(){
	var success =true; 
	if($('#sales_order_base_id').val().length==0){
		$.messager.alert('提示','请点击新建按钮,新建销售订单信息....','error');
		return false;
	}
	if(parseFloat($('#sales_order_base_total_amount').val())==0){
		$.messager.alert('提示','销售订单总金额为0,不需要保存....','warning');
		return false;
	}
	//基本数据合法性
	
	
	return success;
}

/**
 * 提交销售订单系信息
 * @param save_url 异步请求地址
 * @param save_data 提交的数据
 **/
function commitSalesOrder(save_url,save_data){
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
				//1.设置对应的操作按钮
		 		var pend_btn = $('#sales_order_toolbar_pend_btn');
		 		var contract_status =pend_btn.attr('contract_status');
		 		if(contract_status==r.child){//判断合同当前状态禁用当前按钮
		 			//选择了未确认的销售合同,并将挂单按钮禁用
		 			pend_btn.attr("disabled",true);
					pend_btn.linkbutton('disable');
		 		}else if ($("#sales_order_toolbar_ok_btn").attr('contract_status')==r.child){//选择当前已确认的销售合同
		 			//禁用挂单按钮
		 			pend_btn.attr("disabled",true);
					pend_btn.linkbutton('disable');
					//禁用提交合同按钮
		 			$("#sales_order_toolbar_ok_btn").attr("disabled",true);
					$('#sales_order_toolbar_ok_btn').linkbutton('disable');
					//resetSalesContract();//重置整个管理界面
		 		}
				$('#sales_order_base_status').combobox('setValue',r.child);//设置合同状态
			}
		},
		error:function(r){
			$.messager.alert('提示','访问服务发生异常....','error');
		}
	});
}
//-->
</script>
<div style="height: 28px;width: 30%;display:inline;padding-left:20px;">
	<a id="sales_order_toolbar_new_btn" href="#" class="easyui-linkbutton"  data-options="iconCls:'icon-add'">新建</a>
	<a id="sales_order_toolbar_open_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-book_open'">打开</a>
	<a id="sales_order_toolbar_pend_btn" href="#" class="easyui-linkbutton" contract_status="2401" style="margin-left:20px;" data-options="iconCls:'icon-attach'">挂单</a>
</div>
<div style="display:inline;width: 30%;margin-left:80px;">
	<a id="sales_order_toolbar_ok_btn" href="#" class="easyui-linkbutton" contract_status="2402" data-options="iconCls:'icon-save'">订单处理</a>
	<a id="sales_order_toolbar_report_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-chart_bar'">报表</a>
	<a id="sales_order_toolbar_print_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-print'">打印</a>
</div>
<jsp:include flush="true" page="sales_order_init.jsp"></jsp:include>