<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
var quotation_supplier_base_supplier_dialog  = null;
var quotation_supplier_base_supplier_dialog_supplier_property = null;
$(function(){
	//客户信息对话框
	quotation_supplier_base_supplier_dialog=$('#quotation_supplier_base_supplier_dialog').show().dialog({
		 title:'选择供应商',
		 width:600,
		 height:400,
		 collapsible:true,//向上缩小按钮
		 maximizable:true,
		 modal:true,
		 closed:true
	});
	
	//供应商属性
	quotation_supplier_base_supplier_dialog_supplier_property = $('#quotation_supplier_base_supplier_dialog_supplier_property').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=1200',
 		valueField: 'id',
		textField: 'name',
		editable:false
	});
	
	//查询条件
 	$('#quotation_supplier_base_supplier_dialog_search_btn').on('click',function(){
 		quotation_supplier_base_supplier_grd.datagrid('options').url='${path}/supplier/manager/supplier/supplier_info_detail_2_supplier.html';
 		quotation_supplier_base_supplier_grd.datagrid('load',{
 			shortName					:$('#quotation_supplier_base_supplier_dialog_ab').val(),//简称
 			supplierName				:$('#quotation_supplier_base_supplier_dialog_name').val(),//名称
 			supplierProperty			:quotation_supplier_base_supplier_dialog_supplier_property.combobox('getValue')//性质
 		});
 	});
 	$('#quotation_supplier_base_supplier_dialog_ok_btn').on('click',function(){
 		var	rows = quotation_supplier_base_supplier_grd.datagrid('getSelections');//获取所有选择的行记录
 		if(rows.length>1){
 			$.messager.alert('提示','请选择单行客户信息...','warning');
 			return ;
 		}
 		if(rows.length==0){
 			$.messager.alert('提示','请选择客户信息...','warning');
 			return ;
 		}
		//1将数据加载到指定的界面
		var row=rows[0];
		$('#quotation_supplier_base_supplier_id').val(row.supplierId);
		$('#quotation_supplier_base_supplier_name').val(row.supplierName);
		$('#quotation_supplier_base_link_man').val(row.linkman);
		$('#quotation_supplier_base_link_tel').val(row.tel);
		$('#quotation_supplier_base_link_mobile').val(row.contactInfo);
		$('#quotation_supplier_base_link_fax').val(row.fax);
		//2将显示界面关闭
		quotation_supplier_base_supplier_dialog.dialog('close');
		quotation_supplier_base_supplier_dialog.dialog('options').closed=true;
		//3.清空查询条件
		resetSupplierDialog();
 	});
});

function resetSupplierDialog(){
	$('#quotation_supplier_base_supplier_dialog_ab').val('');
	$('#quotation_supplier_base_supplier_dialog_name').val('');
	quotation_supplier_base_supplier_dialog_supplier_property.combobox('setValue','');
	quotation_supplier_base_supplier_dialog_supplier_property.combobox('setText','');
}
</script>
<div id="quotation_supplier_base_supplier_dialog" style="display: none;">
	<%--弹出供应商选择框--%>
	<fieldset>
			<legend>筛选条件</legend>
			<table class="table" style="width: 100%;">
				<tr>
					<th>供应商简称</th>
					<td><input  id="quotation_supplier_base_supplier_dialog_ab" style="border:1px solid #95B8E7;"/></td>
					<th>供应商名称</th>
					<td><input  id="quotation_supplier_base_supplier_dialog_name" style="border:1px solid #95B8E7;"/></td>
				</tr>
				<tr>
					<th>供应商性质</th>
					<td><input  id="quotation_supplier_base_supplier_dialog_supplier_property" style="border:1px solid #95B8E7;"/></td>
					<td colspan="2">
						<div style="float: left;">
						<a id="quotation_supplier_base_supplier_dialog_search_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
						</div>
						<div class="datagrid-btn-separator"></div>
						<div style="float: left;">
						<a id="quotation_supplier_base_supplier_dialog_ok_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-true'" plain="true">确定</a>
						<div>
					</td>
				</tr>
			</table>
	</fieldset>
	<jsp:include flush="true" page="quotation_supplier_base_supplier_grd.jsp"></jsp:include>
</div>