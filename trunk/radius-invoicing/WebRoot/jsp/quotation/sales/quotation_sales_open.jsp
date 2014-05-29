<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
var quotation_sales_open_quotation_sales_grd = null;
var quotation_sales_open_quotation_sales_cash_type = null;
$(function(){
	quotation_sales_open_quotation_sales_grd = $('#quotation_sales_open_quotation_sales_grd').datagrid({
		fitColumns:false,
   		autoRowHeight:false,
   		border:false,
   		striped:true,
   		rownumbers:true,
   		collapsible:true,
   		frozenColumns:[[
   			{field:'salesQuotationId',title:'销售报价单号',width:100},
			{field:'customerId',title:'客户编号',width:100},
			{field:'customerAb',title:'客户简称',width:100},
   		]],
   		columns:[[
			{field:'cashType',title:'币种',width:100,formatter:cashTypeFormatter},
			{field:'address',title:'送货地址',width:100},
			{field:'man',title:'联系人',width:100},
			{field:'mobile',title:'联系人手机',width:100},
			{field:'tel',title:'联系电话',width:100},
			{field:'fax',title:'传真',width:100},
			{field:'inquiryDate',title:'询价日期',width:100},
			{field:'latestQuotateDate',title:'最迟报价日期',width:100},
			{field:'status',title:'状态',width:100},
			//{field:'salesman',title:'业务员',width:100},
			//{field:'auditedStatus',title:'审批状态',width:100},
			//{field:'printTimes',title:'打印次数',width:100},
			//{field:'printTime',title:'最新打印时间',width:100},
			//{field:'printRecord',title:'最新打印记录',width:100},
			{field:'memo',title:'备注',width:200}
	   ]]
	});
	
	quotation_sales_open_quotation_sales_cash_type=$('#quotation_sales_open_quotation_sales_cash_type').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=2400',
 		valueField: 'id',
		textField: 'name',
		editable:false
 	});
	//销售销售合同按钮
 	$('#quotation_sales_open_sales_inquiry_query_btn').on('click',function(){
 		quotation_sales_open_quotation_sales_grd.datagrid('options').url='${path}/quotation/manager/salesQuotation/sales_quotation_info_list.html';
 		quotation_sales_open_quotation_sales_grd.datagrid('load',{
 			salesQuotationId	:$('#quotation_sales_open_quotation_sales_id').val(),
 			customerAb			:$('#quotation_sales_open_quotation_sales_customer_name').val(),
 			cashType			:quotation_sales_open_quotation_sales_cash_type.combobox('getValue'),
 			mobile				:$('#quotation_sales_open_quotation_sales_link_mobile').val(),
 			man					:$('#quotation_sales_open_quotation_sales_link_man').val()
 		});
 	});
 	
 	//选择销售合同按钮
 	$('#quotation_sales_open_sales_inquiry_ok_btn').on('click',function(){
 		var rows=quotation_sales_open_quotation_sales_grd.datagrid('getSelections');
 		//先释放按钮
 		$("#quotation_sales_toolbar_pend_btn").attr("disabled",false);
		$('#quotation_sales_toolbar_pend_btn').linkbutton('enable');
 		$("#quotation_sales_toolbar_ok_btn").attr("disabled",false);
		$('#quotation_sales_toolbar_ok_btn').linkbutton('enable');
 		$('#quotation_sales_goods_grd_add_btn').linkbutton('enable');
		$('#quotation_sales_goods_grd_delete_btn').linkbutton('enable');
		
 		if(rows.length==0){
 			$.messager.alert('提示','请选择销售报价...','warning');
 			return ;
 		}
 		if(rows.length>1){
 			$.messager.alert('提示','请选择单行销售报价...','warning');
 			return ;
 		}
 		//1.设置对应的操作按钮
 		var pend_btn = $('#quotation_sales_toolbar_pend_btn');
 		var contract_status =pend_btn.attr('contract_status');
 		if(contract_status==rows[0].status){//判断合同当前状态禁用当前按钮
 			//选择了未确认的销售合同,并将挂单按钮禁用
 			pend_btn.attr("disabled",true);
			pend_btn.linkbutton('disable');
 		}else if($("#quotation_sales_toolbar_ok_btn").attr('contract_status')==rows[0].status){//选择当前已确认的销售合同
 			//禁用挂单按钮
 			pend_btn.attr("disabled",true);
			pend_btn.linkbutton('disable');
			//禁用提交合同按钮
 			$("#quotation_sales_toolbar_ok_btn").attr("disabled",true);
			$('#quotation_sales_toolbar_ok_btn').linkbutton('disable');
	 		$('#quotation_sales_goods_grd_add_btn').linkbutton('disable');
			$('#quotation_sales_goods_grd_delete_btn').linkbutton('disable');
 		}
 		//2.填充销售合同基本信息
 		setSalesQuotationBaseInfo(rows[0]);
 		//3.订单明细、销售合同列表
 		setSalesQuotationGoodsDetail(rows[0]);//通过采购订单获
 		setSalesQuotationMemo(rows[0]);
 		//清空查询列表
 		quotation_sales_open_quotation_sales_grd.datagrid('loadData',{ total: 0, rows: []});
 		quotation_sales_open_dialog.dialog('close');
 	});
});
</script>
<div id="quotation_sales_open_dialog">
	<fieldset>
		<legend>筛选条件</legend>
		<table class="table" width="99.5%">
			<tr>
				<th>销售报价单号</th>
				<td><input id="quotation_sales_open_quotation_sales_id" style="border:1px solid #95B8E7;"/></td>
				<th>客户简称</th>
				<td><input id="quotation_sales_open_quotation_sales_customer_name" style="border:1px solid #95B8E7;"/></td>
				<th>币种</th>
				<td><input id="quotation_sales_open_quotation_sales_cash_type" style="border:1px solid #95B8E7;"/></td>
			</tr>
			<tr>
				<th>联系人</th>
				<td><input id="quotation_sales_open_quotation_sales_link_man" style="border:1px solid #95B8E7;"/></td>
				<th>手机号</th>
				<td><input id="quotation_sales_open_quotation_sales_link_mobile" style="border:1px solid #95B8E7;"/></td>
				<td colspan="2">
					<div style="float: left;margin-left:10px;">
						<a id="quotation_sales_open_sales_inquiry_query_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
					</div>
					<div class="datagrid-btn-separator" ></div>
					<div style="float: left;margin-left:10px;">
						<a id="quotation_sales_open_sales_inquiry_ok_btn"  href="#" class="easyui-linkbutton" data-options="iconCls:'icon-true'" plain="true">确定</a>
					<div>
				</td>
			</tr>
		</table>
	</fieldset>
	<div id="quotation_sales_open_quotation_sales_grd"></div>
</div>