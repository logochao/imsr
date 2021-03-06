<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
var purchase_order_base_link_man_dialog = null;//联系人对话框
var purchase_order_base_link_man_grd = null;//联系人列表
var purchase_order_base_link_man_dialog_link_sex =null;//联系人性别
$(function(){
	//联系人查询对话框
	purchase_order_base_link_man_dialog=$('#purchase_order_base_link_man_dialog').show().dialog({
		 title:'选择客户联系人',
		 width:600,
		 height:400,
		 collapsible:true,//向上缩小按钮
		 maximizable:true,
		 modal:true,
		 closed:true
	});
	//联系人列表
	purchase_order_base_link_man_grd=$('#purchase_order_base_link_man_grd').datagrid({
	       	fitColumns:false,
	   		autoRowHeight:false,
	   		border:false,
	   		striped:true,
	   		rownumbers:true,
	   		collapsible:true,
	   		frozenColumns:[[
	   			{field:'id',title:'编号',width:40},
				{field:'name',title:'姓名',width:100},
				{field:'pinyin',title:'拼音',width:100},
				{field:'sex2',title:'性别',width:40,formatter:sexFormatter},
				{field:'numbers',title:'身份证号',width:80}
	   		]],
	   		columns:[[
	   			 {field:'mobile1',title:'手机1',width:100},
				 {field:'mobile2',title:'手机2',width:120},
				 {field:'mobile3',title:'手机3',width:130},
				 {field:'tel',title:'电话号码',width:130},
				 {field:'homeTel',title:'固定电话',width:130},
				 {field:'address',title:'通讯地址',width:140},
				 {field:'qq',title:'qq',width:80},
				 {field:'email',title:'email',width:80},
				 {field:'jobDuty',title:'职务',width:100},
				 {field:'expertise',title:'职业专长',width:180},
				 {field:'jobTitle',title:'职称',width:120},
				 {field:'jobContent',title:'负责工作内容',width:200},
				 {field:'hobbies',title:'兴趣爱好',width:200},
				 {field:'postCode',title:'邮编',width:80},
				 {field:'officeAddress',title:'办公地址',width:200},
				 {field:'staff',title:'业务员编号',width:100},
				 {field:'memo',title:'备注',width:250,align:'center'}
			]]
 	});
 	
 	//性别
	purchase_order_base_link_man_dialog_link_sex=$('#purchase_order_base_link_man_dialog_link_sex').combobox({
		url:'${path}/common/system/sex_list.html',
 		valueField: 'id',
		textField: 'name',
		editable:false
	});
 	
 	
 	//联系人信息查询按钮
 	$('#purchase_order_base_link_man_search_btn').on('click',function(){
 		purchase_order_base_link_man_grd.datagrid('options').url='${path}/customer/sales/link_man_split_page.html';
 		purchase_order_base_link_man_grd.datagrid('load',{
				companyId			:$('#purchase_order_base_supplier_id').val(),
				companyName			:$('#purchase_order_base_supplier_name').val(),
				name				:$('#purchase_order_base_link_man_dialog_link_man').val(),
				sex2				:purchase_order_base_link_man_dialog_link_sex.combobox('getValue')//性别
		});//params
 	});
 	
 	//联系人信息确定按钮
 	$('#purchase_order_base_link_man_ok_btn').on('click',function(){
 		var	rows = purchase_order_base_link_man_grd.datagrid('getSelections');//获取所有选择的行记录
 		if(rows&&rows.length>1){
 			$.messager.alert('提示','请选择单行客户信息...','warning');
 		}else if(rows&&rows.length==1){
 			//1将数据加载到指定的界面
 			var row=rows[0];
 			$('#purchase_order_base_link_man').val(row.name);
 			$('#purchase_order_base_link_tel').val(row.tel);
 			$('#purchase_order_base_link_mobile').val(row.mobile1);
 			$('#purchase_order_base_link_fax').val(row.fax);
 			//2将显示界面关闭
 			purchase_order_base_link_man_dialog.dialog('close');
 			purchase_order_base_link_man_dialog.dialog('options').closed=true;
 			//3.清空查询条件
 			resetSupplierLinkManDialog();
 		}
 	});
});

function sexFormatter(value,row,index){
	return com.radius.datagrid.formatter(value,row,index,purchase_order_base_link_man_dialog_link_sex);
}

function resetSupplierLinkManDialog(){
  $('#purchase_order_base_link_man_dialog_link_man').val();
}
//-->
</script>
<div id="purchase_order_base_link_man_dialog" style="display: none;">
	<%--弹出客户联系人选择框--%>
	<fieldset>
			<legend>筛选条件</legend>
			<table class="table" style="width: 100%;">
				<tr>
					<th>姓名</th>
					<td><input id="purchase_order_base_link_man_dialog_link_man" style="border:1px solid #95B8E7;"/></td>
					<th>性别</th>
					<td><input id="purchase_order_base_link_man_dialog_link_sex" style="border:1px solid #95B8E7;"/></td>
					<td>
						<div style="float: left;">
						<a id="purchase_order_base_link_man_search_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
						</div>
						<div class="datagrid-btn-separator"></div>
						<div style="float: left;">
						<a id="purchase_order_base_link_man_ok_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-true'" plain="true">确定</a>
						<div>
					</td>
				</tr>
			</table>
	</fieldset>
	<div id="purchase_order_base_link_man_grd">
	</div>
</div>