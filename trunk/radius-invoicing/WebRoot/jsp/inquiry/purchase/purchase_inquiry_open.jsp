<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
var purchase_inquiry_open_purchase_inquiry_grd = null;
var purchase_inquiry_open_purchase_inquiry_status = null;
$(function(){
	purchase_inquiry_open_purchase_inquiry_grd = $('#purchase_inquiry_open_purchase_inquiry_grd').datagrid({
		fitColumns:false,
   		autoRowHeight:false,
   		border:false,
   		striped:true,
   		rownumbers:true,
   		collapsible:true,
   		frozenColumns:[[
			{field:'purchaseInquiryId',title:'询价单号',width:100},
			{field:'supplierId',title:'客户编号',width:100},
			{field:'supplierName',title:'客户简称',width:100}
   		]],
   		columns:[[
			{field:'cashType',title:'币种',width:100,formatter:cashTypeFormatter},
			{field:'man',title:'联系人',width:100},
			{field:'mobile',title:'手机号',width:100},
			{field:'tel',title:'电话号码',width:100},
			{field:'fax',title:'传真',width:100},
			{field:'inquiryDate',title:'询价日期',width:100},
			{field:'latestQuotateDate',title:'最迟报价日期',width:120},
			{field:'salesman',title:'业务员',width:100},
			{field:'status',title:'状态',width:100},
			{field:'address',title:'送货地址',width:100},
			//{field:'printTimes',title:'打印次数',width:100},
			//{field:'printTime',title:'最新打印时间',width:100},
			//{field:'printRecord',title:'最新打印记录',width:100},
			{field:'memo',title:'备注',width:200}
	   ]]
	});
	
	purchase_inquiry_open_purchase_inquiry_status=$('#purchase_inquiry_open_purchase_inquiry_status').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=2400',
 		valueField: 'id',
		textField: 'name',
		editable:false
 	});
	//销售销售合同按钮
 	$('#purchase_inquiry_open_sales_inquiry_query_btn').on('click',function(){
 		purchase_inquiry_open_purchase_inquiry_grd.datagrid('options').url='${path}/inquiry/manager/purchaseInquiry/purchase_inquiry_info_list.html';
 		purchase_inquiry_open_purchase_inquiry_grd.datagrid('load',{
 			purchaseInquiryId	:$('#purchase_inquiry_open_purchase_inquiry_id').val(),//客户询价编号
 			supplierName		:$('#purchase_inquiry_open_purchase_inquiry_supplier_name').val(),//销售订单编号
 			status				:purchase_inquiry_open_purchase_inquiry_status.combobox('getValue'),//状态
 			mobile				:$('#purchase_inquiry_open_purchase_inquiry_link_mobile').val(),//手机号
 			man					:$('#purchase_inquiry_open_purchase_inquiry_link_man').val()
 		});
 	});
 	
 	//选择销售合同按钮
 	$('#purchase_inquiry_open_sales_inquiry_ok_btn').on('click',function(){
 		var rows=purchase_inquiry_open_purchase_inquiry_grd.datagrid('getSelections');
 		if(rows.length==0){
 			$.messager.alert('提示','请选择客户询价...','warning');
 			return ;
 		}
 		if(rows.length>1){
 			$.messager.alert('提示','请选择单行客户询价...','warning');
 			return ;
 		}
 		//1.设置对应的操作按钮
 		var pend_btn = $('#purchase_inquiry_toolbar_pend_btn');
 		var contract_status =pend_btn.attr('contract_status');
 		if(contract_status==rows[0].status){//判断合同当前状态禁用当前按钮
 			//选择了未确认的销售合同,并将挂单按钮禁用
 			pend_btn.attr("disabled",true);
			pend_btn.linkbutton('disable');
 		}else if($("#purchase_inquiry_toolbar_ok_btn").attr('contract_status')==rows[0].status){//选择当前已确认的销售合同
 			//禁用挂单按钮
 			pend_btn.attr("disabled",true);
			pend_btn.linkbutton('disable');
			//禁用提交合同按钮
 			$("#purchase_inquiry_toolbar_ok_btn").attr("disabled",true);
			$('#purchase_inquiry_toolbar_ok_btn').linkbutton('disable');
	 		$('#purchase_inquiry_goods_grd_add_btn').linkbutton('disable');
			$('#purchase_inquiry_goods_grd_delete_btn').linkbutton('disable');
 		}
 		//2.填充销售合同基本信息
 		setPurchaseInquiryBaseInfo(rows[0]);
 		//5.订单明细、销售合同列表
 		setPurchaseInquiryGoodsDetail(rows[0]);//通过采购订单获
 		setPurchaseInquiryMemo(rows[0]);
 		//5.1将两按钮禁用
 		//清空查询列表
 		purchase_inquiry_open_purchase_inquiry_grd.datagrid('loadData',{ total: 0, rows: []});
 		purchase_inquiry_open_dialog.dialog('close');
 	});
});
function cashTypeFormatter(value,row,index){
	return com.radius.datagrid.formatter(value,row,index,purchase_inquiry_base_status);
}
</script>
<div id="purchase_inquiry_open_dialog">
	<fieldset>
		<legend>筛选条件</legend>
		<table class="table" width="99.5%">
			<tr>
				<th>采购询价号</th>
				<td><input id="purchase_inquiry_open_purchase_inquiry_id" style="border:1px solid #95B8E7;"/></td>
				<th>询价状态</th>
				<td><input id="purchase_inquiry_open_purchase_inquiry_status" style="border:1px solid #95B8E7;"/></td>
				<th>供应商简称</th>
				<td><input id="purchase_inquiry_open_purchase_inquiry_supplier_name" style="border:1px solid #95B8E7;"/></td>
			</tr>
			<tr>
				<th>联系人</th>
				<td><input id="purchase_inquiry_open_purchase_inquiry_link_man" style="border:1px solid #95B8E7;"/></td>
				<th>手机号</th>
				<td><input id="purchase_inquiry_open_purchase_inquiry_link_mobile" style="border:1px solid #95B8E7;"/></td>
				<td colspan="2">
					<div style="float: left;margin-left:10px;">
						<a id="purchase_inquiry_open_sales_inquiry_query_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
					</div>
					<div class="datagrid-btn-separator" ></div>
					<div style="float: left;margin-left:10px;">
						<a id="purchase_inquiry_open_sales_inquiry_ok_btn"  href="#" class="easyui-linkbutton" data-options="iconCls:'icon-true'" plain="true">确定</a>
					<div>
				</td>
			</tr>
		</table>
	</fieldset>
	<div id="purchase_inquiry_open_purchase_inquiry_grd"></div>
</div>