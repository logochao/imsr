<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
var quotation_supplier_base_supplier_dialog  = null;
var quotation_supplier_base_supplier_dialog_supplier_property = null;
$(function(){
	//客户信息对话框
	quotation_supplier_base_purchase_inquiry_dialog=$('#quotation_supplier_base_purchase_inquiry_dialog').show().dialog({
		 title:'选择采购询价单',
		 width:600,
		 height:400,
		 collapsible:true,//向上缩小按钮
		 maximizable:true,
		 modal:true,
		 closed:true
	});
	quotation_supplier_base_purchase_inquiry_status=$('#quotation_supplier_base_purchase_inquiry_status').combobox({
		url:'${path}/common/system/goods_inquiry_status_list.html',//商品询价状态列表
 		valueField: 'specId',
		textField: 'specName',
		editable:false
	});
	//查询销售询价单列表信息
	$('#quotation_supplier_base_purchase_inquiry_query_btn').on('click',function(){
		quotation_supplier_base_purchase_inquiry_grd.datagrid('options').url='${path}/inquiry/manager/purchaseInquiry/purchase_inquiry_info_list.html';
 		quotation_supplier_base_purchase_inquiry_grd.datagrid('load',{
 			purchaseInquiryId			:$('#quotation_supplier_base_purchase_inquiry_id').val(),//采购询价单号
 			supplierName				:$('#quotation_supplier_base_purchase_inquiry_supplier_name').val(),//供应商名称
 			status						:quotation_supplier_base_purchase_inquiry_status.combobox('getValue')//采购询价状态
 		});
	});
	//添加采购询价单信息
	$('#quotation_supplier_base_purchase_inquiry_ok_btn').on('click',function(){
		var	rows = quotation_supplier_base_purchase_inquiry_grd.datagrid('getSelections');//获取所有选择的行记录
 		if(rows.length>1){
 			$.messager.alert('提示','请选择单行采购询价单信息...','warning');
 			return ;
 		}
 		if(rows.length==0){
 			$.messager.alert('提示','请选择采购询价单信息...','warning');
 			return ;
 		}
		//1将数据加载到指定的界面
		var row=rows[0];
		$('#quotation_supplier_base_purchase_inquiry_id').val(row.purchaseInquiryId);
		//2将显示界面关闭
		quotation_supplier_base_purchase_inquiry_dialog.dialog('close');
		quotation_supplier_base_purchase_inquiry_dialog.dialog('options').closed=true;
		//3.清空查询条件
		resetSupplierDialog();
	});
});
/**
 * 清空采购询价对话框查询条件
 **/
function resetPurchaseInquiryDialog(){
	$('#quotation_supplier_base_purchase_inquiry_id').val('');
	$('#quotation_supplier_base_purchase_inquiry_supplier_name').val('');
}
</script>
<div id="quotation_supplier_base_purchase_inquiry_dialog" style="display: none;">
	<%--弹出供应商选择框--%>
	<fieldset>
			<legend>筛选条件</legend>
			<table class="table" style="width: 100%;">
				<tr>
					<th>采购询价单号</th>
					<td><input  id="quotation_supplier_base_purchase_inquiry_id" style="border:1px solid #95B8E7;"/></td>
					<th>供应商名称</th>
					<td><input  id="quotation_supplier_base_purchase_inquiry_supplier_name" style="border:1px solid #95B8E7;"/></td>
				</tr>
				<tr>
					<th>采购询价状态</th>
					<td><input  id="quotation_supplier_base_purchase_inquiry_status" style="border:1px solid #95B8E7;"/></td>
					<td colspan="2">
						<div style="float: left;">
						<a id="quotation_supplier_base_purchase_inquiry_query_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
						</div>
						<div class="datagrid-btn-separator"></div>
						<div style="float: left;">
						<a id="quotation_supplier_base_purchase_inquiry_ok_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-true'" plain="true">确定</a>
						<div>
					</td>
				</tr>
			</table>
	</fieldset>
	<jsp:include flush="true" page="quotation_supplier_base_purchse_inquiry_grd.jsp"></jsp:include>
</div>