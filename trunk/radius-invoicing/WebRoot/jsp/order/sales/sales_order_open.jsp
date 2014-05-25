<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
var sales_order_open_sales_order_status = null;
var sales_order_open_sales_order_grd =null;//销售订单列表
$(function(){
	//订单状态
	sales_order_open_sales_order_status = $('#sales_order_open_sales_order_status').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=2400',
 		valueField: 'id',
		textField: 'name',
		editable:false
 	});
 	
 	sales_order_open_sales_order_grd = $('#sales_order_open_sales_order_grd').datagrid({
		fitColumns:false,
   		autoRowHeight:false,
   		border:false,
   		striped:true,
   		rownumbers:true,
   		collapsible:true,
   		frozenColumns:[[
   			{field:'salesOrderId',title:'销售订货单编号',width:120},
			{field:'customerId',title:'客户编号',width:60},
			{field:'customerName',title:'客户名称',width:180},
			{field:'contractId',title:'合同编号',width:120},
			{field:'totalAmount',title:'总金额',width:120,formatter: function(value,row,index){
					return (value/100).toFixed(2);
				}
			}
   		]],
   		columns:[[
			//{field:'upperAmount',title:'大写金额',width:120},
			{field:'linkMan',title:'联系人',width:120},
			{field:'mobile',title:'联系人手机',width:120},
			{field:'tel',title:'电话',width:120},
			{field:'fax',title:'fax',width:120},
			{field:'orderedDate',title:'订货日期',width:120},
			{field:'deliveryDate',title:'送货日期',width:120},
			{field:'deliveryAddress',title:'送货地址',width:120},
			{field:'terms',title:'条款',width:120},
			{field:'memo',title:'备注',width:120},
			//{field:'splitedFlg',title:';',title:'拆单标识',width:120},
			//{field:'spliteSalesOrderId',title:'拆分前的',width:120},
			//{field:'printTimes',title:'打印次数',width:120},
			//{field:'newestPrintTime',title:'最新打印时',width:120},
			//{field:'newestPrintAcc',title:'最新打印帐号',width:120},
			//{field:'newestPrintRecord',title:'最新打印记',width:120},
			//{field:'salesManId',title:'销售人员//业务员',width:120}
			{field:'status',title:'状态',width:120,formatter:orderStatusFormatter}
	   ]]
	});
	
	//销售销售合同按钮
 	$('#sales_order_open_sales_contract_query_btn').on('click',function(){
 		sales_order_open_sales_order_grd.datagrid('options').url='${path}/order/manager/salesorder/sales_order_info_list.html';
 		sales_order_open_sales_order_grd.datagrid('load',{
 			salesOrderId	:$('#sales_order_open_sales_order_id').val(),//销售订单编号
 			contractId		:$('#sales_order_open_sales_contract_id').val(),//销售订单编号
 			status			:sales_order_open_sales_order_status.combobox('getValue'),//状态
 			customerName	:$('#sales_order_open_sales_order_customer_name').val(),//客户名称
 			linkMan			:$('#sales_order_open_sales_order_link_man').val()
 		});
 	});
 	//选择销售合同按钮
 	$('#sales_order_open_sales_contract_ok_btn').on('click',function(){
 		var rows=sales_order_open_sales_order_grd.datagrid('getSelections');
 		if(rows.length==0){
 			$.messager.alert('提示','请选择销售合同...','warning');
 			return ;
 		}
 		if(rows.length>1){
 			$.messager.alert('提示','请选择单行销售合同...','warning');
 			return ;
 		}
 		//1.设置对应的操作按钮
 		var pend_btn = $('#sales_order_toolbar_pend_btn');
 		var contract_status =pend_btn.attr('contract_status');
 		if(contract_status==rows[0].status){//判断合同当前状态禁用当前按钮
 			//选择了未确认的销售合同,并将挂单按钮禁用
 			pend_btn.attr("disabled",true);
			pend_btn.linkbutton('disable');
 		}else if($("#sales_order_toolbar_ok_btn").attr('contract_status')==rows[0].status){//选择当前已确认的销售合同
 			//禁用挂单按钮
 			pend_btn.attr("disabled",true);
			pend_btn.linkbutton('disable');
			//禁用提交合同按钮
 			$("#sales_order_toolbar_ok_btn").attr("disabled",true);
			$('#sales_order_toolbar_ok_btn').linkbutton('disable');
 		}
 		//2.填充销售合同基本信息
 		setSalesOrderBaseInfo(rows[0]);
 		//3.订单条款
 		setSalesOrderTerms(rows[0]);
 		//4.订单备注
 		setSalesOrdermemo(rows[0]);
 		//5.订单明细、销售合同列表
 		getSalesContractDetailInfo();
 		//5.1将两按钮禁用
 		$('#contract_sales_goods_grd_add_btn').linkbutton('disable');
		$('#contract_sales_goods_grd_delete_btn').linkbutton('disable');
 		//6.报价记录
 		//清空查询列表
 		sales_order_open_sales_order_grd.datagrid('loadData',{ total: 0, rows: []});
 		sales_order_open_dialog.dialog('close');
 	});
});
/**
 *格式化订单状态
 */
function orderStatusFormatter(value,row,index){
	return com.radius.datagrid.formatter(value,row,index,sales_order_open_sales_order_status);
}
</script>

<div id="sales_order_open_dialog">
	<fieldset>
		<legend>筛选条件</legend>
		<table class="table" width="99.5%">
			<tr>
				<th>销售订单号</th>
				<td><input id="sales_order_open_sales_order_id" style="border:1px solid #95B8E7;"/></td>
				<th>订单状态</th>
				<td><input id="sales_order_open_sales_order_status" style="border:1px solid #95B8E7;"/></td>
				<th>客户名称</th>
				<td><input id="sales_order_open_sales_order_customer_name" style="border:1px solid #95B8E7;"/></td>
			</tr>
			<tr>
				<th>联系人</th>
				<td><input id="sales_order_open_sales_order_link_man" style="border:1px solid #95B8E7;"/></td>
				<th>合同文件编号</th>
				<td><input id="sales_order_open_sales_contract_id" style="border:1px solid #95B8E7;"/></td>
				<td colspan="2">
					<div style="float: left;margin-left:10px;">
						<a id="sales_order_open_sales_contract_query_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
					</div>
					<div class="datagrid-btn-separator" ></div>
					<div style="float: left;margin-left:10px;">
						<a id="sales_order_open_sales_contract_ok_btn"  href="#" class="easyui-linkbutton" data-options="iconCls:'icon-true'" plain="true">确定</a>
					<div>
				</td>
			</tr>
		</table>
	</fieldset>
	<div id="sales_order_open_sales_order_grd"></div>
</div>