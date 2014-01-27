<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
 var contract_sales_base_custmer_grd=null; 
 var contract_sales_base_status=null;
 var contract_sales_base_contract_type=null;
 var contract_sales_base_order_time=null;
 var contract_sales_base_order_end_time=null;
 var contract_sales_base_custmer_grd=null;
 var contract_sales_base_custmer_link_man_grd=null;
 var contract_sales_base_custmer_link_man=null;
 $(function (){
 	contract_sales_base_status=$('#contract_sales_base_status').combobox({
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
 	
 	contract_sales_base_custmer_link_man=$('#contract_sales_base_custmer_link_man').show().dialog({
 			 title:'选择客户联系人',
 			 width:600,
 			 height:400,
 			 collapsible:true,//向上缩小按钮
 			 maximizable:true,
 			 modal:true,
 			 closed:true
 		});
 		
 	$('#contract_sales_base_custmer_link_man_btn').on('click',function(){
 	   if($('#contract_sales_base_customer_id').val().length>0){
 			contract_sales_base_custmer_link_man.dialog('open');
 		}else{
 			$.messager.alert('提示','请选择客户信息...','warning');
 		}
 	});
 	contract_sales_base_custmer_grd=$('#contract_sales_base_custmer_grd').datagrid({
 				fit:true,
 				//fitColumns:true,
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
					{field:'tel1',title:'办公电话',width:60},
					{field:'contactInfo',title:'联系电话',width:60},
					{field:'fax1',title:'传真',width:60}
				]]
 	});
 	
 	contract_sales_base_custmer_link_man_grd=$('#contract_sales_base_custmer_link_man_grd').datagrid({
 				fit:true,
 				//fitColumns:true,
        		autoRowHeight:false,
        		border:false,
        		striped:true,
        		rownumbers:true,
        		collapsible:true,
        		columns:[[
        			{field:'id',title:'编号',width:40},
        			{field:'name',title:'联系人名称',width:100},
					{field:'tel',title:'办公电话',width:100},
					{field:'mobile',title:'联系电话',width:100},
					{field:'email',title:'邮箱',width:100},
					{field:'address',title:'地址',width:120}
				]]
 	});
 	
 	
 	$('#sales_base_customer_search_btn').on('click',function(){
 		contract_sales_base_custmer_grd.datagrid('options').url='/stock/customer/split_page.html';
 		contract_sales_base_custmer_grd.datagrid('load',{
				name:$('#sales_base_customer_name').val(),
				linkMan:$('#sales_base_customer_link').val(),
				tel1:$('#sales_base_customer_link_tel').val()
		});//params
 	});
 	
 	
 	$('#sales_base_customer_ok_btn').on('click',function(){//确定按钮
 		var	rows = contract_sales_base_custmer_grd.datagrid('getSelections');//获取所有选择的行记录
 		if(rows&&rows.length>1){
 			$.messager.alert('提示','请选择单行客户信息...','warning');
 		}else if(rows&&rows.length==1){
 			//1将数据加载到指定的界面
 			var row=rows[0];
 			$('#contract_sales_base_customer_id').attr('value',row.id);
 			$('#contract_sales_base_customer_name').attr('value',row.name);
 			$('#contract_sales_base_link_man').attr('value',row.linkMan);
 			$('#contract_sales_base_link_tel').attr('value',row.tel1);
 			$('#contract_sales_base_link_mobile').attr('value',row.contactInfo);
 			$('#contract_sales_base_link_fax').attr('value',row.fax1);
 			//2将显示界面关闭
 			//$('#contract_sales_base_custmer_link_man').dialog('close');
 			$('#contract_sales_base_custmer_link_man').dialog('options').closed=true;
 		}
 	});
 	
 	//联系人信息查询按钮
 	$('#contract_sales_base_custmer_link_man_search_btn').on('click',function(){
 		contract_sales_base_custmer_link_man_grd.datagrid('options').url='/stock//customer/sales/link_man_split_page.html';
 		contract_sales_base_custmer_link_man_grd.datagrid('load',{
				other:$('#contract_sales_base_customer_id').val(),
				name:$('#contract_sales_base_custmer_link_man_').val(),
				tel:$('#contract_sales_base_custmer_link_tel_').val()
		});//params
 	});
 	//联系人信息确定按钮
 	$('#contract_sales_base_custmer_link_man_ok_btn').on('click',function(){
 		var	rows = contract_sales_base_custmer_link_man_grd.datagrid('getSelections');//获取所有选择的行记录
 		if(rows&&rows.length>1){
 			$.messager.alert('提示','请选择单行客户信息...','warning');
 		}else if(rows&&rows.length==1){
 			//1将数据加载到指定的界面
 			var row=rows[0];
 			console.info(row);
 			$('#contract_sales_base_link_man').attr('value',row.name);
 			$('#contract_sales_base_link_tel').attr('value',row.tel);
 			$('#contract_sales_base_link_mobile').attr('value',row.mobile);
 			$('#contract_sales_base_link_fax').attr('value',row.fax);
 			//2将显示界面关闭
 			//$('#contract_sales_base_custmer_link_man').dialog('close');
 			$('#contract_sales_base_custmer_link_man').dialog('options').closed=true;
 		}
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
		<td><input class="easyui-validatebox" type="text" id="contract_sales_base_order_time" name="orderedDate" data-options="required:true"/></td>
	</tr>
	<tr>
		<th>客户</th>
		<td colspan="5">
			<input  type="text" name="customerName" id="contract_sales_base_customer_name" style="width: 300px;" name="name" readonly="readonly" data-options="required:true"/> 
			<input  type="hidden"  name="customerId" id="contract_sales_base_customer_id" readonly="readonly" data-options="required:true"/> 
			<a id="contract_sales_base_custmer_btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>交货日期</th>
		<td><input class="easyui-validatebox" type="text" id="contract_sales_base_order_end_time" name="deliveryDate" data-options="required:true"/></td>
	</tr>
	<tr>
		<th>联系人</th>
		<td>
			<input id="contract_sales_base_link_man" class="easyui-validatebox" type="text" name="man" data-options="required:true"/>
			<a id="contract_sales_base_custmer_link_man_btn"  href="#" class="easyui-linkbutton" plain="true" data-options="disabled:true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>办公电话</th>
		<td><input class="easyui-validatebox" type="text" name="tel" id="contract_sales_base_link_tel" data-options="required:true"/></td>
		<th>手机号码</th>
		<td><input class="easyui-validatebox" type="text" name="mobile" id="contract_sales_base_link_mobile" data-options="required:true"/></td>
		<th>传真</th>
		<td><input class="easyui-validatebox" type="text" name="fax" id="contract_sales_base_link_fax" data-options="required:true"/></td>
	</tr>
	<tr>
		<th>送货地址</th>
		<td colspan="3"><input class="easyui-validatebox" type="text" style="width: 350px;" name="deliveryPoint" data-options="required:true"/></td>
		<th>业务员</th>
		<td colspan="3">
			<input class="easyui-validatebox" type="text" name="salesMan" data-options="required:true"/>
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
					<td><input name="customer_name" id="sales_base_customer_name"/></td>
					<th>联系人</th>
					<td><input name="customer_link" id="sales_base_customer_link"/></td>
				</tr>
				<tr>
					<th>联系电话</th>
					<td><input name="customer_link_tel" id="sales_base_customer_link_tel"/></td>
					<td colspan="2">
						<div style="float: left;">
						<a id="sales_base_customer_search_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
						</div>
						<div class="datagrid-btn-separator"></div>
						<div style="float: left;">
						<a id="sales_base_customer_ok_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-true'" plain="true">确定</a>
						<div>
					</td>
				</tr>
			</table>
	</fieldset>
	<div id="contract_sales_base_custmer_grd">
	</div>
</div>
<div id="contract_sales_base_custmer_link_man" style="display: none;">
	<%--弹出客户联系人选择框--%>
	<fieldset>
			<legend>筛选条件</legend>
			<table class="table" style="width: 100%;">
				<tr>
					<th>联系人</th>
					<td><input id="contract_sales_base_custmer_link_man_"/></td>
					<th>联系电话</th>
					<td><input id="contract_sales_base_custmer_link_tel_"/></td>
					<td>
						<div style="float: left;">
						<a id="contract_sales_base_custmer_link_man_search_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
						</div>
						<div class="datagrid-btn-separator"></div>
						<div style="float: left;">
						<a id="contract_sales_base_custmer_link_man_ok_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-true'" plain="true">确定</a>
						<div>
					</td>
				</tr>
			</table>
	</fieldset>
	<div id="contract_sales_base_custmer_link_man_grd">
	</div>
</div>