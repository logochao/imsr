<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
var purchase_contract_open_purchase_contract_status = null;
var purchase_contract_open_purchase_contract_grd =null;//销售订单列表
$(function(){
	//订单状态
	purchase_contract_open_purchase_contract_status = $('#purchase_contract_open_purchase_contract_status').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=2400',
 		valueField: 'id',
		textField: 'name',
		editable:false
 	});
 	
 	purchase_contract_open_purchase_contract_grd = $('#purchase_contract_open_purchase_contract_grd').datagrid({
		fitColumns:false,
   		autoRowHeight:false,
   		border:false,
   		striped:true,
   		rownumbers:true,
   		collapsible:true,
   		frozenColumns:[[
			{field:'id',title:'合同编号',width:100},
			{field:'orderId',title:'采购订单号',width:100},
			{field:'supplierId',title:'供货商编号',width:60},
			{field:'supplierName',title:'供货商名称',width:120},
			{field:'contractFile',title:'合同文件号',width:100},
			{field:'totalAmount',title:'总金额',width:100,formatter: function(value,row,index){
					return (value/100).toFixed(2);
				}
			}
   		]],
   		columns:[[
			{field:'effectDate',title:'生效日期',width:120},
			{field:'signTime',title:'签署日期',width:120},
			{field:'validityDate',title:'有效期至',width:120},
			{field:'purchaser',title:'采购员',width:120},
			{field:'man',title:'联系人',width:120},
			{field:'mobile',title:'联系人手机',width:120},
			{field:'tel',title:'联系电话',width:120},
			{field:'fax',title:'传真',width:120},
			{field:'orderedDate',title:'订货日期',width:120},
			{field:'deliveryDate',title:'送货日期',width:120},
			{field:'deliveryPoint',title:'送货地点',width:120},
			<%--
			{field:'printTime',title:'最新打印时间',width:120},
			{field:'printAcc',title:'最新打印帐号',width:120},
			{field:'printRecord',title:'最新打印记',width:120},
			{field:'printTimes',title:'打印次数',width:120},
			{field:'paymentedStatus',title:'结帐状',width:120},
			{field:'auditedStatus',title:'审批状态',width:120},
			--%>
			{field:'contractTerms',title:'合同条款',width:120},
			{field:'status',title:'状态',width:120,formatter:orderStatusFormatter},
			{field:'memo',title:'备注',width:200}
	   ]]
	});
	
	//销售销售合同按钮
 	$('#purchase_contract_open_sales_contract_query_btn').on('click',function(){
 		purchase_contract_open_purchase_contract_grd.datagrid('options').url='${path}/contract/manager/purchaseContract/purchase_contract_info_list.html';
 		purchase_contract_open_purchase_contract_grd.datagrid('load',{
 			salesOrderId	:$('#purchase_contract_open_purchase_contract_id').val(),//销售订单编号
 			contractId		:$('#purchase_contract_open_sales_contract_id').val(),//销售订单编号
 			status			:purchase_contract_open_purchase_contract_status.combobox('getValue'),//状态
 			customerName	:$('#purchase_contract_open_purchase_contract_customer_name').val(),//客户名称
 			linkMan			:$('#purchase_contract_open_purchase_contract_link_man').val()
 		});
 	});
 	//选择销售合同按钮
 	$('#purchase_contract_open_sales_contract_ok_btn').on('click',function(){
 		var rows=purchase_contract_open_purchase_contract_grd.datagrid('getSelections');
 		if(rows.length==0){
 			$.messager.alert('提示','请选择销售合同...','warning');
 			return ;
 		}
 		if(rows.length>1){
 			$.messager.alert('提示','请选择单行销售合同...','warning');
 			return ;
 		}
 		//1.设置对应的操作按钮
 		var pend_btn = $('#purchase_contract_toolbar_pend_btn');
 		var contract_status =pend_btn.attr('contract_status');
 		if(contract_status==rows[0].status){//判断合同当前状态禁用当前按钮
 			//选择了未确认的销售合同,并将挂单按钮禁用
 			pend_btn.attr("disabled",true);
			pend_btn.linkbutton('disable');
 		}else if($("#purchase_contract_toolbar_ok_btn").attr('contract_status')==rows[0].status){//选择当前已确认的销售合同
 			//禁用挂单按钮
 			pend_btn.attr("disabled",true);
			pend_btn.linkbutton('disable');
			//禁用提交合同按钮
 			$("#purchase_contract_toolbar_ok_btn").attr("disabled",true);
			$('#purchase_contract_toolbar_ok_btn').linkbutton('disable');
 		}
 		//2.填充销售合同基本信息
 		setPurchaseContractBaseInfo(rows[0]);
 		//3.订单条款
 		setPurchaseContractTerms(rows[0]);
 		//4.订单备注
 		setPurchaseContractMemo(rows[0]);
 		//5.订单明细、销售合同列表
 		setPurchaseContractGoodsDetail(rows[0]);//通过采购订单获
 		//5.1将两按钮禁用
 		$('#contract_sales_goods_grd_add_btn').linkbutton('disable');
		$('#contract_sales_goods_grd_delete_btn').linkbutton('disable');
		//6.获取采购合同扫描件列表
		setPurchaseContractScan(rows[0]);
		//7.支付列表
		setPurchaseContractPayDetail(rows[0]);
 		//8.报价记录
 		//清空查询列表
 		purchase_contract_open_purchase_contract_grd.datagrid('loadData',{ total: 0, rows: []});
 		purchase_contract_open_dialog.dialog('close');
 	});
});
/**
 *格式化订单状态
 */
function orderStatusFormatter(value,row,index){
	return com.radius.datagrid.formatter(value,row,index,purchase_contract_open_purchase_contract_status);
}
</script>

<div id="purchase_contract_open_dialog">
	<fieldset>
		<legend>筛选条件</legend>
		<table class="table" width="99.5%">
			<tr>
				<th>销售订单号</th>
				<td><input id="purchase_contract_open_purchase_contract_id" style="border:1px solid #95B8E7;"/></td>
				<th>订单状态</th>
				<td><input id="purchase_contract_open_purchase_contract_status" style="border:1px solid #95B8E7;"/></td>
				<th>客户名称</th>
				<td><input id="purchase_contract_open_purchase_contract_customer_name" style="border:1px solid #95B8E7;"/></td>
			</tr>
			<tr>
				<th>联系人</th>
				<td><input id="purchase_contract_open_purchase_contract_link_man" style="border:1px solid #95B8E7;"/></td>
				<th>合同文件编号</th>
				<td><input id="purchase_contract_open_sales_contract_id" style="border:1px solid #95B8E7;"/></td>
				<td colspan="2">
					<div style="float: left;margin-left:10px;">
						<a id="purchase_contract_open_sales_contract_query_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
					</div>
					<div class="datagrid-btn-separator" ></div>
					<div style="float: left;margin-left:10px;">
						<a id="purchase_contract_open_sales_contract_ok_btn"  href="#" class="easyui-linkbutton" data-options="iconCls:'icon-true'" plain="true">确定</a>
					<div>
				</td>
			</tr>
		</table>
	</fieldset>
	<div id="purchase_contract_open_purchase_contract_grd"></div>
</div>