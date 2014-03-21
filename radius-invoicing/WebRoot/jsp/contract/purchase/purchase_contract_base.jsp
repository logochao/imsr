<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
<!--
var purchase_contract_base_status = null;//采购合同状态
var purchase_contract_base_supplier_dialog = null;//供应商对话框
var purchase_contract_base_supplier_grd = null;//供应商列表
var purchase_contract_base_supplier_nature = null;//供应商性质
var purchase_contract_base_purchase_order_dialog = null;//采购订单对话框
var purchase_contract_base_purchase_order_grd = null;;//采购订单信息列表
var purchase_contract_base_goods_property = null;//商品属性
var purchase_contract_base_goods_category_code = null;//商品分类
$(function(){
	//-------------------------初始化---------------------------------------------------//
	$('#purchase_contract_base_order_end_time').datebox({
 	});
	$('#purchase_contract_base_order_time').datebox({
 	});
 	
 	purchase_contract_base_status=$('#purchase_contract_base_status').combobox({
 		url:'${path}/contract/manager/sales_status_json.html',
 		valueField: 'id',
		textField: 'name',
		onLoadSuccess:function(){
			var target = $(this);
			target.combobox("setValue",target.val());
			target.combobox('disable');
		}
 	});
 	
 	purchase_contract_base_supplier_dialog=$('#purchase_contract_base_supplier_dialog').show().dialog({
		 title:'选择供应商',
		 width:800,
		 height:400,
		 collapsible:true,//向上缩小按钮
		 maximizable:true,
		 modal:true,
		 closed:true
	});
	
	purchase_contract_base_supplier_grd=$('#purchase_contract_base_supplier_grd').datagrid({
   		autoRowHeight:false,
   		border:false,
   		striped:true,
   		rownumbers:true,
   		collapsible:true,
   		frozenColumns:[[
   			{field:'id',title:'供应商编号',width:100},
   			{field:'shortName',title:'供应商简称',width:120},
   			{field:'name',title:'供应商名称',width:200}
   		]],
   		columns:[[
			{field:'nature',title:'公司性质',width:100},
			{field:'linkMan',title:'联系人',width:120},
			{field:'tel1',title:'办公电话',width:120},
			{field:'contactInfo',title:'联系电话',width:120},
			{field:'fax1',title:'传真',width:120},
			{field:'officeAddress',title:'办公地址',width:200},
			{field:'deliveryAddress',title:'送货地址',width:200},
			{field:'url',title:'官网地址',width:100},
			{field:'email',title:'email',width:100}
		]]
 	});
 	
 	//供运商性质
 	purchase_contract_base_supplier_nature=$('#purchase_contract_base_supplier_nature').combobox({    
 		url:'/stock/common/system/category_code_list.html?parentId=1200',
 		valueField: 'id',
		textField: 'name',
		onLoadSuccess:function(){
			var target = $(this);
			var data = target.combobox("getData");
			var options = target.combobox("options");
			if(data && data.length>0){
				var fs = data[0];
				target.combobox("setValue",fs[options.valueField]);
			}
		},
		editable:false
	}); 
 	
 	//采购订单对话框
 	purchase_contract_base_purchase_order_dialog=$('#purchase_contract_base_purchase_order_dialog').show().dialog({
		 title:'选择采购订单',
		 width:800,
		 height:400,
		 collapsible:true,//向上缩小按钮
		 maximizable:true,
		 modal:true,
		 closed:true
	});
 	
 	//采购订单列表
	purchase_contract_base_purchase_order_grd=$('#purchase_contract_base_purchase_order_grd').datagrid({
		autoRowHeight:false,
   		border:false,
   		striped:true,
   		rownumbers:true,
   		collapsible:true,
   		frozenColumns:[[
   			{field:'salesOrderId',title:'采购订单号',width:200},
   			{field:'customerName',title:'客户名称',width:120},
   			{field:'totalAmount',title:'总金额',width:120,formatter: function(value,row,index){
				 if(value!=undefined&&value!=null&&(value+"").indexOf(".")<=0){
					value=(parseInt(value)/100).toFixed(2);
				 }
				 return value;
			  }	
   			},
   			{field:'stats',title:'订单状态',width:100}
   		]],
   		columns:[[
			{field:'orderedDate',title:'订货日期',width:120},
			{field:'deliveryDate',title:'交货日期',width:120},
			{field:'linkMan',title:'联系人',width:120},
			{field:'tel',title:'办公电话',width:120},
			{field:'contactInfo',title:'联系电话',width:120},
			{field:'fax',title:'传真',width:120},
			{field:'deliveryAddress',title:'送货地址',width:200}
		]]
	});
	//商品性质
 	purchase_contract_base_goods_property=$('#purchase_contract_base_goods_property').combobox({    
	})
	//商品分类
 	purchase_contract_base_goods_category_code=$('#purchase_contract_base_goods_category_code').combobox({    
	})
 	
 	
 	//----------------------------------------------业务代码------------------------------------------------------------------//
 	//供应商按钮事件
 	$('#purchase_contract_base_supplier_btn').on('click',function(){
 		purchase_contract_base_supplier_dialog.dialog('open');
 	});
 	
 	//供应商信息查询按钮
 	$('#purchase_contract_base_supplier_search_btn').on('click',function(){
 		purchase_contract_base_supplier_grd.datagrid('options').url='${path}/supplier/manager/supplier/supplier_info_list.html';
 		purchase_contract_base_supplier_grd.datagrid('load',{
 			name		:$('#purchase_contract_base_supplier_name').val(),//供应商名称
 			shortName	:$('#purchase_contract_base_supplier_short_name').val(),//供应商简称
 			nature		:purchase_contract_base_supplier_nature.combobox('getValue'),//供运商性质
 			linkMan		:$('#purchase_contract_base_supplier_link').val(),//联系人
 			contactInfo :$('#purchase_contract_base_supplier_link_tel').val()//联系电话
 		});
 	});
 	
 	//供应商确定按钮
 	$('#purchase_contract_base_supplier_ok_btn').on('click',function(){
 		//将供应商列表信息添加到供应商表单中
 		var	rows = purchase_contract_base_supplier_grd.datagrid('getSelections');//获取所有选择的行记录
 		if(rows.length>1){
 			$.messager.alert('提示','请选择单行供应商信息...','warning');
 		}else if(rows.length==1){
 			//1将数据加载到指定的界面
 			var row=rows[0];
 			$('#purchase_contract_base_supplier_name').val(row.name);//供应商名称
 			$('#purchase_contract_base_supplier_id').val(row.id);//供应商编号
 			$('#purchase_contract_base_link_man').val(row.linkMan);//联系人
 			$('#purchase_contract_base_link_tel').val(row.tel1);//联系电话
 			$('#purchase_contract_base_link_mobile').val(row.contactInfo);//手机号
 			$('#purchase_contract_base_link_fax').val(row.fax1);//传真
 			$('#purchase_contract_base_delivery_point').val(row.deliveryAddress);//送货地址
 			
 			//2将显示界面关闭
 			$('#purchase_contract_base_supplier_dialog').dialog('close');
 			$('#purchase_contract_base_supplier_dialog').dialog('options').closed=true;
 		}else{
 			$.messager.alert('提示','请选择供应商信息...','warning');
 		}
 	});
 	
 	//采购订单按钮
 	$('#purchase_contract_base_purchase_order_btn').on('click',function(){
		if($('#purchase_contract_base_supplier_id').val().length>0){
			purchase_contract_base_purchase_order_dialog.dialog('open');
		}else{
			$.messager.alert('提示','请选择供应商...','warning');
		}
	}); 
	//采购订单查询按钮
	$('#purchase_contract_base_purchase_order_search_btn').on('click',function(){
		purchase_contract_base_purchase_order_grd.datagrid('options').url='${path}';
 		purchase_contract_base_purchase_order_grd.datagrid('load',{
 			supplierId  :$('#purchase_contract_base_supplier_id').val(),//供应商编号
 			salesOrderId:$('#purchase_contract_base_purchase_order_id').val(),//销售订单号
 			name		:$('#purchase_contract_base_purchase_order_goods_name').val(),//商品名称
 			property	:purchase_contract_base_goods_property.combobox('getValue'),//商品属性
 			categoryCode:purchase_contract_base_goods_category_code.combobox('getValue'),//商品分类
 			realName    :$('#purchase_order_base_purchase_order_goods_real_name').val()//商品真实名称
 		});
	});
	//采购订单确定按钮
	$('#purchase_contract_base_purchase_order_ok_btn').on('click',function(){
		//将供应商列表信息添加到供应商表单中
 		var	rows = purchase_contract_base_purchase_order_grd.datagrid('getSelections');//获取所有选择的行记录
 		if(rows.length>1){
 			$.messager.alert('提示','请选择单行销售订单信息...','warning');
 		}else if(rows.length==1){
 			var row = rows[0];//带处理的销售订单行信息
 		}else{
 			$.messager.alert('提示','请选择销售订单信息...','warning');
 		}
	});
});
//-->
</script>
<table class="table" style="width: 100%;">
	<tr>
		<th>采购合同号<font color="red">*</font></th> 
		<td><input class="easyui-validatebox" style="background:#eee;width: 150px;border:1px solid #95B8E7" id="purchase_contract_base_id" type="text" readonly="readonly"  data-options="" value="${purchaseOrder.purchaseOrderId}"/></td>
		<th>状态</th>
		<td colspan="3"><input id="purchase_contract_base_status"  class="easyui-validatebox" class="easyui-combobox"  data-options="" value="0"/></td>
		<th>订货日期</th>
		<td><input class="easyui-validatebox" type="text" id="purchase_contract_base_order_time" style="border:1px solid #95B8E7"/></td>
	</tr>
	<tr>
		<th>供应商<font color="red">*</font></th>
		<td colspan="5">
			<input  type="text" id="purchase_contract_base_supplier_name" style="width: 300px;border:1px solid #95B8E7" readonly="readonly" data-options="" style="border:1px solid #95B8E7"/> 
			<input  type="hidden" id="purchase_contract_base_supplier_id" readonly="readonly" data-options="" style="border:1px solid #95B8E7"/> 
			<a id="purchase_contract_base_supplier_btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>交货日期</th>
		<td><input class="easyui-validatebox" type="text" id="purchase_contract_base_order_end_time" style="border:1px solid #95B8E7" data-options=""/></td>
	</tr>
	<tr>
		<th>联系人</th>
		<td>
			<input id="purchase_contract_base_link_man" class="easyui-validatebox" type="text" name="man"style="border:1px solid #95B8E7" />
			<a id="purchase_contract_base_custmer_link_man_btn"  href="#" class="easyui-linkbutton" plain="true" data-options="disabled:true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>办公电话</th>
		<td><input class="easyui-validatebox" type="text" id="purchase_contract_base_link_tel" style="border:1px solid #95B8E7"/></td>
		<th>手机号码</th>
		<td><input class="easyui-validatebox" type="text" id="purchase_contract_base_link_mobile" style="border:1px solid #95B8E7"/></td>
		<th>传真</th>
		<td><input class="easyui-validatebox" type="text" id="purchase_contract_base_link_fax" style="border:1px solid #95B8E7"/></td>
	</tr>
	<tr>
		<th>送货地址</th>
		<td colspan="3"><input class="easyui-validatebox" type="text" style="width: 350px;border:1px solid #95B8E7;" id="purchase_contract_base_delivery_point"/></td>
		<th>业务员</th>
		<td>
			<input class="easyui-validatebox" type="text" style="border:1px solid #95B8E7"/>
			<a id="btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th colspan="2" style="text-align: center;"></th>
	</tr>
	<tr>
		<th>采购订单号<font color="red">*</font></th>
		<td>
			<input class="easyui-validatebox" id="purchase_contract_base_purchase_order_id" type="text" readonly="readonly" style="border:1px solid #95B8E7"/>
			<a id="purchase_contract_base_purchase_order_btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>合同总金额</th>
		<td><input id="purchase_contract_base_total_amount"  readonly="readonly" style="background:#eee;width: 150px;border:1px solid #95B8E7;"/></td>
		<th>大写金额</th>
		<td colspan="3"><input id="purchase_contract_base_upper_rmb"  readonly="readonly" style="background:#eee;width: 350px;border:1px solid #95B8E7;"/></td>
	</tr>
</table>

<div id="purchase_contract_base_supplier_dialog" style="display: none;">
	<%--弹出供应商选择框--%>
	<fieldset>
			<legend>筛选条件</legend>
			<table class="table" style="width: 100%;">
				<tr>
					<th>名称(关键字)</th>
					<td><input  id="purchase_contract_base_supplier_name" style="border:1px solid #95B8E7"/></td>
					<th>简称</th>
					<td><input  id="purchase_contract_base_supplier_short_name" style="border:1px solid #95B8E7"/></td>
					<th>公司性质</th>
					<td><input id="purchase_contract_base_supplier_nature" style="border:1px solid #95B8E7"></td>
				</tr>
				<tr>
					<th>联系人</th>
					<td><input id="purchase_contract_base_supplier_link" style="border:1px solid #95B8E7"/></td>
					<th>联系电话</th>
					<td><input id="purchase_contract_base_supplier_link_tel" style="border:1px solid #95B8E7"/></td>
					<td colspan="2">
						<div style="float: left;">
						<a id="purchase_contract_base_supplier_search_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
						</div>
						<div class="datagrid-btn-separator"></div>
						<div style="float: left;">
						<a id="purchase_contract_base_supplier_ok_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-true'" plain="true">确定</a>
						<div>
					</td>
				</tr>
			</table>
	</fieldset>
	<div id="purchase_contract_base_supplier_grd" style="margin-top: 5px;">
	</div>
</div>
<div id="purchase_contract_base_purchase_order_dialog" style="display: none;">
	<%--弹出销售订单选择框--%>
	<fieldset>
			<legend>筛选条件</legend>
			<table class="table" style="width: 100%;">
				<tr>
					<th>采购订单号</th>
					<td><input  id="purchase_contract_base_purchase_order_id" style="border:1px solid #95B8E7"/></td>
					<th>商品名称</th>
					<td><input  id="purchase_contract_base_purchase_order_goods_name" style="border:1px solid #95B8E7"/></td>
					<th>商品性质</th>
					<td><input  id="purchase_contract_base_goods_property" style="border:1px solid #95B8E7"/></td>
				</tr>
				<tr>
					<th>商品分类</th>
					<td><input  id="purchase_contract_base_goods_category_code" style="border:1px solid #95B8E7"/></td>
					<th>真实品名</th>
					<td><input  id="purchase_contract_base_purchase_order_goods_real_name" style="border:1px solid #95B8E7"/></td>
					<td colspan="2">
						<div style="float: left;">
						<a id="purchase_contract_base_purchase_order_search_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
						</div>
						<div class="datagrid-btn-separator"></div>
						<div style="float: left;">
						<a id="purchase_contract_base_purchase_order_ok_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-true'" plain="true">确定</a>
						<div>
					</td>
				</tr>
			</table>
	</fieldset>
	<div id="purchase_contract_base_purchase_order_grd" style="margin-top: 5px;">
	</div>
</div>