<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
 $(function (){
 	$('#contract_sales_base_status').combobox({
 		url:'/stock/contract/manager/sales_status_json.html',
 		valueField: 'id',
		textField: 'name',
		onLoadSuccess:function(){
			var target = $(this);
			target.combobox("setValue",target.val());
			target.combobox('disable');
		}
 	});
 	$('#contract_sales_base_contract_type').combobox({
 		url:'/stock/contract/manager/sales_contract_type_json.html',
 		valueField: 'id',
		textField: 'name',
		onLoadSuccess:function(){
			var target = $(this);
			target.combobox("setValue",target.val());
			target.combobox('disable');
		}
 	});
 	$('#contract_sales_base_order_time').datebox({
 		required:true
 	});
 	$('#contract_sales_base_order_end_time').datebox({
 		required:true
 	});
 	$('#contract_sales_base_custmer_btn').on('click',function(){
 		$('#sales_base_custmer_dialog').show().dialog({
 			 title:'选择客户',
 			 width:600,
 			 height:400,
 			 collapsible:true,//向上缩小按钮
 			 maximizable:true,
 			 modal:true
 		});
 	});
 	
 	$('#contract_sales_base_custmer_link_man_btn').on('click',function(){
 		$('#sales_base_custmer_link_man_dialog').show().dialog({
 			 title:'选择客户联系人',
 			 width:600,
 			 height:400,
 			 collapsible:true,//向上缩小按钮
 			 maximizable:true,
 			 modal:true
 		});
 	});
 	
 	$('#contract_sales_base_custmer_grd').datagrid({
 				url:'/stock/customer/split_page.html',
 				fit:true,
 				//fitColumns:true,
        		autoRowHeight:false,
        		border:false,
        		striped:true,
        		rownumbers:true,
        		collapsible:true,
        		columns:[[
        			{field:'productid',title:'客户编号',width:100},
        			{field:'productname',title:'客户名称',width:120},
					{field:'amount',title:'联系人',width:60},
					{field:'unit',title:'办公电话',width:60},
					{field:'unit',title:'联系电话',width:60},
					{field:'zmount',title:'传真',width:60},
				]]
 	});
 	
 	$('#contract_sales_base_custmer_link_man_grd').datagrid({
 				fit:true,
 				//fitColumns:true,
        		autoRowHeight:false,
        		border:false,
        		striped:true,
        		rownumbers:true,
        		collapsible:true,
        		columns:[[
        			{field:'productid',title:'客户编号',width:100},
        			{field:'productname',title:'客户名称',width:120},
					{field:'amount',title:'联系人',width:60},
					{field:'unit',title:'办公电话',width:60},
					{field:'unit',title:'联系电话',width:60},
					{field:'zmount',title:'传真',width:60},
				]]
 	});
 });
//-->
</script>
<table class="table" style="width: 100%;">
	<tr>
		<th>合同编号</th>
		<td><input class="easyui-validatebox" style="background:#eee;width: 150px;" type="text" readonly="readonly" name="name" data-options="required:true" value="H_X2014012401"/></td>
		<th>状态</th>
		<td colspan="3"><input id="contract_sales_base_status"  class="easyui-validatebox" class="easyui-combobox" name="name" data-options="required:true" value="0"/></td>
		<th>订货日期</th>
		<td><input class="easyui-validatebox" type="text" id="contract_sales_base_order_time" data-options="required:true"/></td>
	</tr>
	<tr>
		<th>客户</th>
		<td colspan="5">
			<input class="easyui-validatebox" type="text" style="width: 300px;" name="name" readonly="readonly" data-options="required:true"/> 
			<a id="contract_sales_base_custmer_btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>交货日期</th>
		<td><input class="easyui-validatebox" type="text" id="contract_sales_base_order_end_time" name="name" data-options="required:true"/></td>
	</tr>
	<tr>
		<th>联系人</th>
		<td>
			<input class="easyui-validatebox" type="text" name="name" data-options="required:true"/>
			<a id="contract_sales_base_custmer_link_man_btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>办公电话</th>
		<td><input class="easyui-validatebox" type="text" name="name" data-options="required:true"/></td>
		<th>手机号码</th>
		<td><input class="easyui-validatebox" type="text" name="name" data-options="required:true"/></td>
		<th>传真</th>
		<td><input class="easyui-validatebox" type="text" name="name" data-options="required:true"/></td>
	</tr>
	<tr>
		<th>送货地址</th>
		<td colspan="3"><input class="easyui-validatebox" type="text" name="name" data-options="required:true"/></td>
		<th>业务员</th>
		<td colspan="3">
			<input class="easyui-validatebox" type="text" name="name" data-options="required:true"/>
			<a id="btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
	</tr>
	<tr>
		<th>合同类型</th>
		<td colspan="5"><input class="easyui-validatebox" id="contract_sales_base_contract_type" type="text" name="name" data-options="required:true" value="1"/></td>
		<th colspan="2" style="text-align: center;"><input type="checkbox"/>转保函付款申请</th>
	</tr>
</table>

<div id="sales_base_custmer_dialog" style="display: none;">
	<%--弹出客户选择框--%>
	<fieldset>
			<legend>筛选条件</legend>
			<table class="table" style="width: 100%;">
				<tr>
					<th>客户名称(关键字)</th>
					<td><input/></td>
					<th>联系人</th>
					<td><input/></td>
				</tr>
				<tr>
					<th>联系电话</th>
					<td><input/></td>
					<td colspan="2">
						<div style="float: left;">
						<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
						</div>
						<div class="datagrid-btn-separator"></div>
						<div style="float: left;">
						<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-true'" plain="true">确定</a>
						<div>
					</td>
				</tr>
			</table>
	</fieldset>
	<div id="contract_sales_base_custmer_grd">
	</div>
</div>
<div id="sales_base_custmer_link_man_dialog" style="display: none;">
	<%--弹出客户联系人选择框--%>
	<fieldset>
			<legend>筛选条件</legend>
			<table class="table" style="width: 100%;">
				<tr>
					<th>联系人</th>
					<td><input/></td>
					<th>联系电话</th>
					<td><input/></td>
					<td>
						<div style="float: left;">
						<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
						</div>
						<div class="datagrid-btn-separator"></div>
						<div style="float: left;">
						<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-true'" plain="true">确定</a>
						<div>
					</td>
				</tr>
			</table>
	</fieldset>
	<div id="contract_sales_base_custmer_link_man_grd">
	</div>
</div>