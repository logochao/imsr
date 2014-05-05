<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
var sales_order_base_customer_dialog = null;
var sales_order_base_custmer_grd = null;
var sales_order_base_customer_dialog_customer_property =null;//客户属性
$(function(){
    //客户信息对话框
	sales_order_base_customer_dialog=$('#sales_order_base_customer_dialog').show().dialog({
		 title:'选择客户',
		 width:600,
		 height:400,
		 collapsible:true,//向上缩小按钮
		 maximizable:true,
		 modal:true,
		 closed:true
	});
	//客户信息列表
	sales_order_base_custmer_grd=$('#sales_order_base_custmer_grd').datagrid({
			fitColumns:true,
      		autoRowHeight:false,
      		border:false,
      		striped:true,
      		rownumbers:true,
      		collapsible:true,
      		columns:[[
      			{field:'id',title:'客户编号',width:100},
      			{field:'ab',title:'客户简称',width:100},
      			{field:'name',title:'客户名称',width:120},
				{field:'linkMan',title:'联系人',width:60},
				{field:'tel',title:'办公电话',width:60},
				{field:'contactInfo',title:'联系电话',width:60},
				{field:'fax',title:'传真',width:60}
		]]
	});
	
	
	//客户性质
 	sales_order_base_customer_dialog_customer_property=$('#sales_order_base_customer_dialog_customer_property').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=1200',
 		valueField: 'id',
		textField: 'name',
		editable:false
 	});
	
	$('#sales_order_base_customer_dialog_search_btn').on('click',function(){
 		sales_order_base_custmer_grd.datagrid('options').url='${path}/customer/manager/customer/customer_info_detail_2_customer.html';
 		sales_order_base_custmer_grd.datagrid('load',{
 				ab					:$('#sales_order_base_customer_dialog_ab').val(),
				name				:$('#sales_base_customer_name').val(),
				linkMan				:$('#sales_base_customer_link').val(),
				customerProperty	:$('#sales_base_customer_link_tel').val()
		});//params
 	});
 	
 	$('#sales_order_base_customer_dialog_ok_btn').on('click',function(){
 		var	rows = sales_order_base_custmer_grd.datagrid('getSelections');//获取所有选择的行记录
 		if(rows&&rows.length>1){
 			$.messager.alert('提示','请选择单行客户信息...','warning');
 			return ;
 		} 
 		if(rows&&rows.length==1){
 			//1将数据加载到指定的界面
 			var row=rows[0];
 			$('#sales_order_base_customer_id').val(row.id);
 			$('#sales_order_base_customer_name').val(row.name);
 			$('#sales_order_base_link_man').val(row.linkMan);
 			$('#sales_order_base_link_tel').val(row.tel);
 			$('#sales_order_base_link_mobile').val(row.contactInfo);
 			$('#sales_order_base_link_fax').val(row.fax);
 			//2将显示界面关闭
 			sales_order_base_customer_dialog.dialog('close');
 			sales_order_base_customer_dialog.dialog('options').closed=true;
 			//3.清空查询条件
 			resetCustomerDialog();
 		}
 	});
});

/**
 *重置查询客户信息对话框参数
 **/
function resetCustomerDialog(){
	$('#sales_order_base_customer_dialog_ab').val('');
	$('#sales_order_base_customer_dialog_name').val('');
}
//-->
</script>
<div id="sales_order_base_customer_dialog" style="display: none;">
	<%--弹出客户选择框--%>
	<fieldset>
			<legend>筛选条件</legend>
			<table class="table" style="width: 100%;">
				<tr>
					<th>客户简称</th>
					<td><input  id="sales_order_base_customer_dialog_ab" style="border:1px solid #95B8E7;"/></td>
					<th>客户名称</th>
					<td><input  id="sales_order_base_customer_dialog_name" style="border:1px solid #95B8E7;"/></td>
				</tr>
				<tr>
					<th>客户性质</th>
					<td><input  id="sales_order_base_customer_dialog_customer_property" style="border:1px solid #95B8E7;"/></td>
					<td colspan="2">
						<div style="float: left;">
						<a id="sales_order_base_customer_dialog_search_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
						</div>
						<div class="datagrid-btn-separator"></div>
						<div style="float: left;">
						<a id="sales_order_base_customer_dialog_ok_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-true'" plain="true">确定</a>
						<div>
					</td>
				</tr>
			</table>
	</fieldset>
	<div id="sales_order_base_custmer_grd">
	</div>
</div>