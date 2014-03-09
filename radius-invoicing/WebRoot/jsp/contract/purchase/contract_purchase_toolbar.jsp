<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
//-1表示没有进行任何操作 0表示进行了挂单 1表示进行了提交 2表示了进行了挂单和提交 3表示了提交和挂单
var contract_purchase_tool_bar_save=null;
$(function(){
	//打开按钮
	$('#contract_purchase_toolbar_open_btn').on('click',function(){
		
	});
	
	//挂单按钮
	$('#contract_purchase_toolbar_pend_btn').on('click',function(){
		contract_purchase_tool_bar_save=$('#contract_purchase_tool_bar_save');
		var value=contract_purchase_tool_bar_save.val();
		if(!parseInt(value)<1){//
			$.ajax({
				url:'${path}/contract/manager/salescontract/sale_contract_infos_add.html',//保存销售合同请求地址
				method:'POST',
				data:{
					//销售合同
					id:$('#contract_purchase_purchase_base_id').val(),//合同编号
					customerId:$('#contract_purchase_base_customer_id').val(),//客户编号
					customerName:$('#contract_purchase_base_customer_name').val(),//客户名称
					contractFile:'',//合同文件编号
					effectDate:parseDate($('#contract_purchase_clause_effivit_time').datebox('getValue')),//生效日期
					signTime:parseDate($('#contract_purchase_clause_sign_time').datebox('getValue')),//签署日期
					man:$('#contract_purchase_base_link_man').val(),//联系人
					mobile:$('#contract_purchase_base_link_mobile').val(),//手机号
					tel:$('#contract_purchase_base_link_tel').val(),//电话
					fax:$('#contract_purchase_base_link_fax').val(),//传真
					orderedDate:parseDate($('#contract_purchase_base_order_time').datebox('getValue')),//订货日期
					deliveryDate:parseDate($('#contract_purchase_base_order_end_time').datebox('getValue')),//送货日期
					deliveryPoint:$('#contract_purchase_base_delivery_point').val(),//送货地点
					contractTerms:$('#contract_purchase_clause_contract_terms').val(),//合同条款
					validityDate:parseDate($('#contract_purchase_clause_fail_time').datebox('getValue')),//有效期至
					stats:0,//状态
					memo:$('#contract_purchase_index_mome').val(),
					totalAmount:$('#contract_purchase_base_total_amount').val(),//合同总金额 (货币默认为人民币)
					upperAmount:$('#contract_purchase_base_upper_rmb').val(),//大写金额
					cashType:'801',//人民币
					contractType:contract_purchase_base_contract_type.val(),//合同类型
					//保函条款
					guaranteeStatus:$('#contract_purchase_base_checkbox').val(),//是否启用保函条款
					payamount:$('#contract_purchase_index_pay_amount').val(),//保函条款
					payTime:parseDate($('#contract_purchase_index_pay_time').datebox('getValue')),//付款日期
					receivablesTime:parseDate($('#contract_purchase_index_receivables_time').datebox('getValue')),//收款日期
				},
				success:function(r){//通讯成功
					if(r&&r.success){
						$.messager.show({
							title:'提示',
							msg:r.message,
							timeout:5000
						});
						//1.修改保存标志
						contract_purchase_tool_bar_save.val(r.child);
						//2.将合同的状态进行修改
						
					}
				},
				error:function(r){//操作失败
					$.messager.alert('提示','访问服务发生异常....','error');
				}
			});
		}
		//1.检查相关属性是否都存在
		
		//2.设置状态为确定
		//3.根据返回信息,提示相关内容
		
	});
	
	//提交合同按钮
	$('#contract_purchase_toolbar_ok_btn').on('click',function(){
		contract_purchase_tool_bar_save=$('#contract_purchase_tool_bar_save');
		var value=contract_purchase_tool_bar_save.val();
		if(!parseInt(value)<1){//
			$.ajax({
				url:'${path}/contract/manager/salescontract/sale_contract_infos_add.html',//保存销售合同请求地址
				method:'POST',
				data:{
					//销售合同
					id:$('#contract_purchase_purchase_base_id').val(),//合同编号
					customerId:$('#contract_purchase_base_customer_id').val(),//客户编号
					customerName:$('#contract_purchase_base_customer_name').val(),//客户名称
					contractFile:'',//合同文件编号
					effectDate:parseDate($('#contract_purchase_clause_effivit_time').datebox('getValue')),//生效日期
					signTime:parseDate($('#contract_purchase_clause_sign_time').datebox('getValue')),//签署日期
					man:$('#contract_purchase_base_link_man').val(),//联系人
					mobile:$('#contract_purchase_base_link_mobile').val(),//手机号
					tel:$('#contract_purchase_base_link_tel').val(),//电话
					fax:$('#contract_purchase_base_link_fax').val(),//传真
					orderedDate:parseDate($('#contract_purchase_base_order_time').datebox('getValue')),//订货日期
					deliveryDate:parseDate($('#contract_purchase_base_order_end_time').datebox('getValue')),//送货日期
					deliveryPoint:$('#contract_purchase_base_delivery_point').val(),//送货地点
					contractTerms:$('#contract_purchase_clause_contract_terms').val(),//合同条款
					validityDate:parseDate($('#contract_purchase_clause_fail_time').datebox('getValue')),//有效期至
					stats:1,//状态
					memo:$('#contract_purchase_index_mome').val(),
					totalAmount:$('#contract_purchase_base_total_amount').val(),//合同总金额 (货币默认为人民币)
					upperAmount:$('#contract_purchase_base_upper_rmb').val(),//大写金额
					cashType:'801',//人民币
					contractType:contract_purchase_base_contract_type.val(),//合同类型
					//保函条款
					guaranteeStatus:$('#contract_purchase_base_checkbox').val(),//是否启用保函条款
					payamount:$('#contract_purchase_index_pay_amount').val(),//保函条款
					payTime:parseDate($('#contract_purchase_index_pay_time').datebox('getValue')),//付款日期
					receivablesTime:parseDate($('#contract_purchase_index_receivables_time').datebox('getValue')),//收款日期
				},
				success:function(r){//通讯成功
					if(r&&r.success){
						$.messager.show({
							title:'提示',
							msg:r.message,
							timeout:5000
						});
						//1.修改保存标志
						contract_purchase_tool_bar_save.val(r.child);
						//2.将合同的状态进行修改
						
					}
				},
				error:function(r){//操作失败
					$.messager.alert('提示','访问服务发生异常....','error');
				}
			});
		}
		//1.检查相关属性是否都存在
		
		//2.设置状态为确定
		//3.根据返回信息,提示相关内容
	});
	
	//打印按钮
	$('#contract_purchase_toolbar_print_btn').on('click',function(){
	
	});
	
	
	//报表按钮
	$('#contract_purchase_toolbar_report_btn').on('click',function(){
	
	});
	
	
	//关闭按钮
	$('#contract_purchase_toolbar_close_btn').on('click',function(){
	
	});
});
//-->
</script>
<div style="height: 28px;width: 30%;display:inline;padding-left:20px;">
	<a id="contract_purchase_toolbar_new_btn" href="#" class="easyui-linkbutton"  data-options="iconCls:'icon-add'">新建</a>
	<a id="contract_purchase_toolbar_open_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-book_open'">打开</a>
	<a id="contract_purchase_toolbar_pend_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-attach'">挂单</a>
</div>
<div style="display:inline;width: 30%;margin-left:80px;">
	<a id="contract_purchase_toolbar_ok_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'">合同处理</a>
	<input id="contract_purchase_tool_bar_save" type="hidden" value="-1"><!-- 销售合同保存按钮 -->
	<a id="contract_purchase_toolbar_report_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-chart_bar'">报表</a>
	<a id="contract_purchase_toolbar_print_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-print'">打印</a>
</div>
<div style="display:inline;margin-left:200px;">
	<a id="contract_purchase_toolbar_close_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">关闭</a>
</div>
