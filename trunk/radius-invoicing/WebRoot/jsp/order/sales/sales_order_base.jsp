<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
 var sales_order_base_custmer_grd=null; 
 var sales_order_base_status=null;
 var sales_order_base_order_time=null;
 var sales_order_base_order_end_time=null;
 var sales_order_base_custmer_grd=null;
 var sales_order_base_custmer_link_man_grd=null;
 var sales_order_base_custmer_link_man=null;
 var sales_order_base_custmer_dialog=null;
 var sales_order_base_sales_contract_dialog=null;
 var sales_order_base_sales_contract_grd =  null;//销售合同列表
 $(function (){
 	sales_order_base_status=$('#sales_order_base_status').combobox({
 		url:'${path}/contract/manager/sales_status_json.html',
 		valueField: 'id',
		textField: 'name',
		onLoadSuccess:function(){
			var target = $(this);
			target.combobox("setValue",target.val());
			target.combobox('disable');
		}
 	});
 	$('#sales_order_base_order_time').datebox({
 	});
 	$('#sales_order_base_order_end_time').datebox({
 	});
 	$('#sales_order_base_custmer_btn').on('click',function(){
 		sales_order_base_custmer_dialog.dialog('open');
 	});
 	sales_order_base_custmer_dialog=$('#sales_order_base_custmer_dialog').show().dialog({
 			 title:'选择客户',
 			 width:800,
 			 height:400,
 			 collapsible:true,//向上缩小按钮
 			 maximizable:true,
 			 modal:true,
 			 closed:true
 		});
 	sales_order_base_custmer_link_man=$('#sales_order_base_custmer_link_man').show().dialog({
 			 title:'选择客户联系人',
 			 width:800,
 			 height:400,
 			 collapsible:true,//向上缩小按钮
 			 maximizable:true,
 			 modal:true,
 			 closed:true
 		});
 		
 	$('#sales_order_base_custmer_link_man_btn').on('click',function(){
 	   if($('#sales_order_base_customer_id').val().length>0){
 			sales_order_base_custmer_link_man.dialog('open');
 		}else{
 			$.messager.alert('提示','请选择客户信息...','warning');
 		}
 	});
 	sales_order_base_custmer_grd=$('#sales_order_base_custmer_grd').datagrid({
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
 	
 	sales_order_base_custmer_link_man_grd=$('#sales_order_base_custmer_link_man_grd').datagrid({
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
 	
 	
 	$('#sales_order_base_customer_search_btn').on('click',function(){
 		sales_order_base_custmer_grd.datagrid('options').url='${path}/customer/split_page.html';
 		sales_order_base_custmer_grd.datagrid('load',{
				name:$('#sales_order_base_customer_name').val(),
				linkMan:$('#sales_order_base_customer_link').val(),
				tel1:$('#sales_order_base_customer_link_tel').val()
		});//params
 	});
 	
 	
 	$('#sales_order_base_customer_ok_btn').on('click',function(){//确定按钮
 		var	rows = sales_order_base_custmer_grd.datagrid('getSelections');//获取所有选择的行记录
 		if(rows.length>1){
 			$.messager.alert('提示','请选择单行客户信息...','warning');
 		}else if(rows.length==1){
 			//1将数据加载到指定的界面
 			var row=rows[0];
 			$('#sales_order_base_customer_id').attr('value',row.id);
 			$('#sales_order_base_customer_name').attr('value',row.name);
 			$('#sales_order_base_link_man').attr('value',row.linkMan);
 			$('#sales_order_base_link_tel').attr('value',row.tel1);
 			$('#sales_order_base_link_mobile').attr('value',row.contactInfo);
 			$('#sales_order_base_link_fax').attr('value',row.fax1);
 			//2将显示界面关闭
 			$('#sales_order_base_custmer_dialog').dialog('close');
 			$('#sales_order_base_custmer_dialog').dialog('options').closed=true;
 		}else{
 			$.messager.alert('提示','请选择客户信息...','warning');
 		}
 	});
 	
 	//联系人信息查询按钮
 	$('#sales_order_base_custmer_link_man_search_btn').on('click',function(){
 		sales_order_base_custmer_link_man_grd.datagrid('options').url='${path}/customer/sales/link_man_split_page.html';
 		sales_order_base_custmer_link_man_grd.datagrid('load',{
				other:$('#sales_order_base_customer_id').val(),
				name:$('#sales_order_base_custmer_link_man_').val(),
				tel:$('#sales_order_base_custmer_link_tel_').val()
		});//params
 	});
 	//联系人信息确定按钮
 	$('#sales_order_base_custmer_link_man_ok_btn').on('click',function(){
 		var	rows = sales_order_base_custmer_link_man_grd.datagrid('getSelections');//获取所有选择的行记录
 		if(rows.length>1){
 			$.messager.alert('提示','请选择单行客户信息...','warning');
 		}else if(rows.length==1){
 			//1将数据加载到指定的界面
 			var row=rows[0];
 			$('#sales_order_base_link_man').attr('value',row.name);
 			$('#sales_order_base_link_tel').attr('value',row.tel);
 			$('#sales_order_base_link_mobile').attr('value',row.mobile);
 			$('#sales_order_base_link_fax').attr('value',row.fax);
 			//2将显示界面关闭
 			sales_order_base_custmer_link_man.dialog('close');
 			sales_order_base_custmer_link_man.dialog('options').closed=true;
 		}else{
 			$.messager.alert('提示','请选择客户信息...','warning');
 		}
 	});
 	
 	sales_order_base_sales_contract_dialog=$('#sales_order_base_sales_contract_dialog').show().dialog({//销售合同查询对话框
		 title:'选择销售合同',
		 width:800,
		 height:400,
		 collapsible:true,//向上缩小按钮
		 maximizable:true,
		 modal:true,
		 closed:true
	});
	
	$('#sales_order_base_sales_contract_btn').on('click',function(){//绑定销售合同对话框按钮
		var customer_id = $('#sales_order_base_customer_id').val();//客户编号
		if (customer_id&&customer_id.length>0) {//不为空并且长度大于0
			sales_order_base_sales_contract_dialog.dialog('open');
		}else{//提示信息
			$.messager.alert('提示','请选择客户信息','error');
		}
	});
	$('#sales_order_base_sales_contract_search_btn').on('click',function(){//选择合同确定按钮
		$.ajax({//获取销售合同信息
			url:'${path}/contract/manager/salescontract/sales_contract_info_by_customer.html',
			method:'POST',
			data:{
				customerId:$('#sales_order_base_customer_id').val(),//客户编号
				id:$('#sales_order_base_sales_contract_id').val()//销售合同编号
			},
			success:function (r){//将数据追加到销售合同列表
				//1.将获取到的合同信息追加到列表中
				sales_order_base_sales_contract_grd.datagrid('loadData',r.rows);
			},
			error:function (r){
				console.info(r);
				console.info('与服务端通信失败...');
				//$.messager.alert('提示','请选择客户信息','error');	
			} 
		});
	});
	
	//确定按钮
	$('#sales_order_base_sales_contract_ok_btn').on('click',function(){//销售合同确定按钮
		var rows=sales_order_base_sales_contract_grd.datagrid('getSelections');
		if (rows.length==1) {
			$('#sales_order_base_sales_contract_id').val(rows[0].id);
			$('#sales_order_base_total_amount').val((rows[0].totalAmount/100).toFixed(2));
			$('#sales_order_base_sales_contract_dialog').dialog('close');
			//2.异步请求获取销售合同的详细信息
			getSalesContractDetailInfo();
		}else if(rows.length>1){
			$.messager.alert('提示','请选择单行销售合同信息','warning');
		}else{
			$.messager.alert('提示','请选择销售合同行信息','warning');
		}
	});


	sales_order_base_sales_contract_grd=$('#sales_order_base_sales_contract_grd').datagrid({//销售合同列表
				fit:true,
        		autoRowHeight:false,
        		border:false,
        		striped:true,
        		rownumbers:true,
        		collapsible:true,
        		columns:[[
        			{field:'id',title:'合同编号',width:120},
        			{field:'customerName',title:'客户名称',width:100},
					{field:'effectDate',title:'有效日期',width:80},
					{field:'signTime',title:'签署日期',width:80},
					{field:'totalAmount',title:'总金额',width:80,formatter: function(value,row,index){
						return (value/100).toFixed(2);
					}},
					{field:'upperAmount',title:'大写金额',width:120}
				]]
	});
 });
//根据合同编号获取合同详细信息
function getSalesContractDetailInfo(){
	$.ajax({//获取销售合同详细信息 1.合同基本信息 2.合同附件信息 3.合同的中金额 3.合同的销售商品明细
		url:'${path}/contract/manager/salescontract/sales_contract_goods_grd_by_contract_id.html',
		method:'POST',
		data:{
			contractId:$('#sales_order_base_sales_contract_id').val()
		},
		success:function(r){//将获取的详细信息添加到tabs中
			sales_order_contract_detail_sales_contract_grd.datagrid('loadData',r.rows);
		},
		error:function (r){
			console.info(r);
			console.info('与服务端通信失败...');
			//$.messager.alert('提示','请选择客户信息','error');
		}
	});
}
//-->
</script>
<table class="table" style="width: 100%;">
	<tr>
		<th>销售订单号<font color="red">*</font></th>
		<td><input class="easyui-validatebox" style="background:#eee;width: 150px;" id="sales_order_purchase_base_id" type="text" readonly="readonly"  data-options="" value="${salesOrder.salesOrderId}"/></td>
		<th>状态</th>
		<td colspan="3"><input id="sales_order_base_status"  class="easyui-validatebox" class="easyui-combobox"  data-options="" value="0"/></td>
		<th>订货日期</th>
		<td><input class="easyui-validatebox" type="text" id="sales_order_base_order_time" /></td>
	</tr>
	<tr>
		<th>客户<font color="red">*</font></th>
		<td colspan="5">
			<input  type="text" id="sales_order_base_customer_name" style="width: 300px;" readonly="readonly" data-options=""/> 
			<input  type="hidden" id="sales_order_base_customer_id" readonly="readonly" data-options=""/> 
			<a id="sales_order_base_custmer_btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>交货日期</th>
		<td><input class="easyui-validatebox" type="text" id="sales_order_base_order_end_time" data-options=""/></td>
	</tr>
	<tr>
		<th>联系人</th>
		<td>
			<input id="sales_order_base_link_man" class="easyui-validatebox" type="text" name="man" />
			<a id="sales_order_base_custmer_link_man_btn"  href="#" class="easyui-linkbutton" plain="true" data-options="disabled:true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>办公电话</th>
		<td><input class="easyui-validatebox" type="text" id="sales_order_base_link_tel" /></td>
		<th>手机号码</th>
		<td><input class="easyui-validatebox" type="text" id="sales_order_base_link_mobile" /></td>
		<th>传真</th>
		<td><input class="easyui-validatebox" type="text" id="sales_order_base_link_fax" /></td>
	</tr>
	<tr>
		<th>送货地址</th>
		<td colspan="3"><input class="easyui-validatebox" type="text" style="width: 350px;" id="sales_order_base_delivery_point" /></td>
		<th>业务员</th>
		<td>
			<input class="easyui-validatebox" type="text" />
			<a id="btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th colspan="2" style="text-align: center;"></th>
	</tr>
	<tr>
		<th>合同编号<font color="red">*</font></th>
		<td>
			<input class="easyui-validatebox" id="sales_order_base_sales_contract_id" type="text" readonly="readonly"/>
			<a id="sales_order_base_sales_contract_btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>合同总金额</th>
		<td><input id="sales_order_base_total_amount" style="background:#eee;" readonly="readonly"/></td>
		<td colspan="4"></td>
	</tr>
</table>

<div id="sales_order_base_custmer_dialog" style="display: none;">
	<%--弹出客户选择框--%>
	<fieldset>
			<legend>筛选条件</legend>
			<table class="table" style="width: 100%;">
				<tr>
					<th>客户名称(关键字)</th>
					<td><input  id="sales_order_base_customer_name"/></td>
					<th>联系人</th>
					<td><input id="sales_order_base_customer_link"/></td>
				</tr>
				<tr>
					<th>联系电话</th>
					<td><input id="sales_order_base_customer_link_tel"/></td>
					<td colspan="2">
						<div style="float: left;">
						<a id="sales_order_base_customer_search_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
						</div>
						<div class="datagrid-btn-separator"></div>
						<div style="float: left;">
						<a id="sales_order_base_customer_ok_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-true'" plain="true">确定</a>
						<div>
					</td>
				</tr>
			</table>
	</fieldset>
	<div id="sales_order_base_custmer_grd">
	</div>
</div>
<div id="sales_order_base_custmer_link_man" style="display: none;">
	<%--弹出客户联系人选择框--%>
	<fieldset>
			<legend>筛选条件</legend>
			<table class="table" style="width: 100%;">
				<tr>
					<th>联系人</th>
					<td><input id="sales_order_base_custmer_link_man_"/></td>
					<th>联系电话</th>
					<td><input id="sales_order_base_custmer_link_tel_"/></td>
					<td>
						<div style="float: left;">
						<a id="sales_order_base_custmer_link_man_search_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
						</div>
						<div class="datagrid-btn-separator"></div>
						<div style="float: left;">
						<a id="sales_order_base_custmer_link_man_ok_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-true'" plain="true">确定</a>
						<div>
					</td>
				</tr>
			</table>
	</fieldset>
	<div id="sales_order_base_custmer_link_man_grd">
	</div>
</div>
<%-- 合同查询对话框--%>
<div id="sales_order_base_sales_contract_dialog">
	<fieldset>	
		<legend>查询销售合同</legend>
		<table class="table" style="width: 100%;"><%--商家信息 --%>
			<tr>
				<th>合同编号</th>
				<td><input id="sales_order_base_sales_contract_id"/></td>
				<td>
					<div style="float: left;">
					<a id="sales_order_base_sales_contract_search_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
					</div>
					<div class="datagrid-btn-separator"></div>
					<div style="float: left;">
					<a id="sales_order_base_sales_contract_ok_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-true'" plain="true">确定</a>
					<div>
				</td>
			</tr>
		</table>
	</fieldset>
	<div id="sales_order_base_sales_contract_grd"></div><%--销售合同列表--%>
</div>