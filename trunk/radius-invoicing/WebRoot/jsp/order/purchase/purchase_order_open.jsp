<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
var purchase_order_open_purchase_order_status = null;
var purchase_order_open_purchase_order_grd = null;
$(function(){
	//订单状态
	purchase_order_open_purchase_order_status = $('#purchase_order_open_purchase_order_status').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=2400',
 		valueField: 'id',
		textField: 'name',
		editable:false
 	});
 	
 	purchase_order_open_purchase_order_grd = $('#purchase_order_open_purchase_order_grd').datagrid({
		fitColumns:false,
   		autoRowHeight:false,
   		border:false,
   		striped:true,
   		rownumbers:true,
   		collapsible:true,
   		frozenColumns:[[
   			{field:'purchaseOrderId',title:'采购订单号',width:120},
			{field:'supplierId',title:'供货商编号',width:70},
			{field:'supplierName',title:'供货商名称',width:200},
			{field:'salesOrderId',title:'销售订单号',width:100}
   		]],
   		columns:[[
			{field:'linkMan',title:'联系人',width:120},
			{field:'mobile',title:'联系人手机',width:120},
			{field:'tel',title:'电话',width:120},
			{field:'fax',title:'fax',width:120},
			{field:'totalAmont',title:'订货金额',width:120},
			{field:'orderedDate',title:'订货日期',width:120},
			{field:'deliveryDate',title:'送货日期',width:120},
			{field:'status',title:'状态',width:120},
			{field:'terms',title:'条款',width:200},
			//{field:'consolidatedFlg',title:'合单标识',width:120},
			//{field:'consolidatedPurchaseOrderId',title:'合单后订单号',width:120},
			//{field:'printTimes',title:'打印次数',width:120},
			//{field:'printTime',title:'最新打印时间',width:120},
			//{field:'printAcc',title:'最新打印帐号',width:120},
			//{field:'printRecord',title:'最新打印记录',width:120},
			//{field:'purchaser',title:'采购员',width:120},
			{field:'memo',title:'备注',width:120}
	   ]]
	});
	$('#purchase_order_open_purchase_contract_query_btn').on('click',function(){
		purchase_order_open_purchase_order_grd.datagrid('options').url='${path}/order/manager/purchaseOrder/purchase_order_info_list.html';
 		purchase_order_open_purchase_order_grd.datagrid('load',{
 			purchaseOrderId	:$('#sales_order_open_sales_order_id').val(),//采购订单编号
 			salesOrderId		:$('#purchase_order_open_sales_order_id').val(),//销售订单编号
 			status			:purchase_order_open_purchase_order_status.combobox('getValue'),//状态
 			supplierName	:$('#purchase_order_open_purchase_order_supplier_name').val(),//客户名称
 			linkMan			:$('#sales_order_open_sales_order_link_man').val()
 		});
	});
	
	$('#purchase_order_open_purchase_contract_ok_btn').on('click',function(){
		var rows=purchase_order_open_purchase_order_grd.datagrid('getSelections');
 		if(rows.length==0){
 			$.messager.alert('提示','请选择销售合同...','warning');
 			return ;
 		}
 		if(rows.length>1){
 			$.messager.alert('提示','请选择单行销售合同...','warning');
 			return ;
 		}
 		//1.设置对应的操作按钮
 		var pend_btn = $('#purchase_order_toolbar_pend_btn');
 		var contract_status =pend_btn.attr('contract_status');
 		if(contract_status==rows[0].status){//判断合同当前状态禁用当前按钮
 			//选择了未确认的销售合同,并将挂单按钮禁用
 			pend_btn.attr("disabled",true);
			pend_btn.linkbutton('disable');
 		}else if($("#purchase_order_toolbar_ok_btn").attr('contract_status')==rows[0].status){//选择当前已确认的销售合同
 			//禁用挂单按钮
 			pend_btn.attr("disabled",true);
			pend_btn.linkbutton('disable');
			//禁用提交合同按钮
 			$("#purchase_order_toolbar_ok_btn").attr("disabled",true);
			$('#purchase_order_toolbar_ok_btn').linkbutton('disable');
 		}
 		//2.设置采购订单基本信息
 			setPurchaseOrderBase(rows[0]);
 		//3.订单条款
 			setPurchaseOrderTerms(rows[0]);
 		//4.订单备注
 			setPurchaseOrderMemo(rows[0]);
 		//5.订单明细、销售合同列表
 			setPurchaseOrderGoodsDetail(rows[0]);
 		//6.报价记录
 		//清空查询列表
 		
 		purchase_order_open_purchase_order_grd.datagrid('loadData',{ total: 0, rows: []});
 		purchase_order_open_dialog.dialog('close');
	});
});
//-->
</script>
<div id="purchase_order_open_dialog">
	<fieldset>
		<legend>筛选条件</legend>
		<table class="table" width="99.5%">
			<tr>
				<th>销售订单号</th>
				<td><input id="purchase_order_open_purchase_order_id" style="border:1px solid #95B8E7;"/></td>
				<th>订单状态</th>
				<td><input id="purchase_order_open_purchase_order_status" style="border:1px solid #95B8E7;"/></td>
				<th>供应商名称</th>
				<td><input id="purchase_order_open_purchase_order_supplier_name" style="border:1px solid #95B8E7;"/></td>
			</tr>
			<tr>
				<th>联系人</th>
				<td><input id="purchase_order_open_purchase_order_link_man" style="border:1px solid #95B8E7;"/></td>
				<th>销售订单号</th>
				<td><input id="purchase_order_open_sales_order_id" style="border:1px solid #95B8E7;"/></td>
				<td colspan="2">
					<div style="float: left;margin-left:10px;">
						<a id="purchase_order_open_purchase_contract_query_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
					</div>
					<div class="datagrid-btn-separator" ></div>
					<div style="float: left;margin-left:10px;">
						<a id="purchase_order_open_purchase_contract_ok_btn"  href="#" class="easyui-linkbutton" data-options="iconCls:'icon-true'" plain="true">确定</a>
					<div>
				</td>
			</tr>
		</table>
	</fieldset>
	<div id="purchase_order_open_purchase_order_grd"></div>
</div>