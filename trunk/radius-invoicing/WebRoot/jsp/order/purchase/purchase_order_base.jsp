<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
<!--
var purchase_order_base_status = null; 
var purchase_order_base_supplier_dialog =null;//供应商对话框
var purchase_order_base_sales_order_dialog =null;//销售订单对话框
var purchase_order_base_supplier_grd = null ;//供应商信息列表
var purchase_order_base_sales_order_grd =null;//销售订单列表
var purchase_order_base_supplier_nature = null;//供应商(公司)性质
var purchase_order_base_sales_order_goods_category_code=null;//销售订单分类编码
$(document).ready(function(){
	purchase_order_base_status=$('#purchase_order_base_status').combobox({
 		url:'${path}/contract/manager/sales_status_json.html',
 		valueField: 'id',
		textField: 'name',
		onLoadSuccess:function(){
			var target = $(this);
			target.combobox("setValue",target.val());
			target.combobox('disable');
		}
 	});
 	$('#purchase_order_base_order_time').datebox({
 	});
 	
 	purchase_order_base_supplier_dialog=$('#purchase_order_base_supplier_dialog').show().dialog({
		 title:'选择供应商',
		 width:800,
		 height:400,
		 collapsible:true,//向上缩小按钮
		 maximizable:true,
		 modal:true,
		 closed:true
	});
 	
 	
 	$('#purchase_order_base_order_end_time').datebox({
 	});
 	//供应商对话框
 	$('#purchase_order_base_supplier_btn').on('click',function(){
 		purchase_order_base_supplier_dialog.dialog('open');
 	
 	});
 	//供应商信息列表
 	purchase_order_base_supplier_grd=$('#purchase_order_base_supplier_grd').datagrid({
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
				{field:'nature',title:'公司性质',width:100,formatter:formatterSupplierNature},
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
 	//供应商信息查询按钮
 	$('#purchase_order_base_supplier_search_btn').on('click',function(){
 		purchase_order_base_supplier_grd.datagrid('options').url='${path}/supplier/manager/supplier/supplier_info_list.html';
 		purchase_order_base_supplier_grd.datagrid('load',{
 			name		:$('#purchase_order_base_supplier_name').val(),//供应商名称
 			shortName	:$('#purchase_order_base_supplier_short_name').val(),//供应商简称
 			nature		:purchase_order_base_supplier_nature.combobox('getValue'),//供运商性质
 			linkMan		:$('#purchase_order_base_supplier_link').val(),//联系人
 			contactInfo :$('#purchase_order_base_supplier_link_tel').val()//联系电话
 		});
 	});
 	//供应商确定按钮
 	$('#purchase_order_base_supplier_ok_btn').on('click',function(){
 		//将供应商列表信息添加到供应商表单中
 		var	rows = purchase_order_base_supplier_grd.datagrid('getSelections');//获取所有选择的行记录
 		if(rows.length>1){
 			$.messager.alert('提示','请选择单行供应商信息...','warning');
 		}else if(rows.length==1){
 			//1将数据加载到指定的界面
 			var row=rows[0];
 			$('#purchase_order_base_supplier_name').val(row.name);//供应商名称
 			$('#purchase_order_base_supplier_id').val(row.id);//供应商编号
 			$('#purchase_order_base_link_man').val(row.linkMan);//联系人
 			$('#purchase_order_base_link_tel').val(row.tel1);//联系电话
 			$('#purchase_order_base_link_mobile').val(row.contactInfo);//手机号
 			$('#purchase_order_base_link_fax').val(row.fax1);//传真
 			$('#purchase_order_base_delivery_point').val(row.deliveryAddress);//送货地址
 			
 			//2将显示界面关闭
 			$('#purchase_order_base_supplier_dialog').dialog('close');
 			$('#purchase_order_base_supplier_dialog').dialog('options').closed=true;
 		}else{
 			$.messager.alert('提示','请选择供应商信息...','warning');
 		}
 	});
 	$('#purchase_order_base_custmer_link_man_btn').on('click',function(){
 		//填出对话框
 	});
 	//供运商性质
 	purchase_order_base_supplier_nature=$('#purchase_order_base_supplier_nature').combobox({    
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
 	//商品性质
 	purchase_order_base_sales_order_goods_property=$('#purchase_order_base_sales_order_goods_property').combobox({    
	}); 
 	//商品分类
 	purchase_order_base_sales_order_goods_category_code=$('#purchase_order_base_sales_order_goods_category_code').combobox({    
	}); 
	
	//销售订单列表
	purchase_order_base_sales_order_grd=$('#purchase_order_base_sales_order_grd').datagrid({
		autoRowHeight:false,
   		border:false,
   		striped:true,
   		rownumbers:true,
   		collapsible:true,
   		frozenColumns:[[
   			{field:'salesOrderId',title:'销售订单号',width:200},
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
	
 	
 	purchase_order_base_sales_order_dialog=$('#purchase_order_base_sales_order_dialog').show().dialog({
		 title:'选择销售订单',
		 width:800,
		 height:400,
		 collapsible:true,//向上缩小按钮
		 maximizable:true,
		 modal:true,
		 closed:true
	});
	
	//销售订单号按钮
	$('#purchase_order_base_sales_order_btn').on('click',function(){
		if($('#purchase_order_base_supplier_id').val().length>0){
			purchase_order_base_sales_order_dialog.dialog('open');
		}else{
			$.messager.alert('提示','请选择供应商...','warning');
		}
	}); 
	
	//查询销售订单按钮
	$('#purchase_order_base_sales_order_search_btn').on('click',function(){
		purchase_order_base_sales_order_grd.datagrid('options').url='${path}/order/manager/salesorder/sales_order_2_goods.html';
 		purchase_order_base_sales_order_grd.datagrid('load',{
 			supplierId  :$('#purchase_order_base_supplier_id').val(),//供应商编号
 			salesOrderId:$('#purchase_order_base_sales_order_id').val(),//销售订单号
 			name		:$('#purchase_order_base_sales_order_goods_name').val(),//商品名称
 			property	:purchase_order_base_sales_order_goods_property.combobox('getValue'),//商品属性
 			categoryCode:purchase_order_base_sales_order_goods_category_code.combobox('getValue'),//商品分类
 			realName    :$('#purchase_order_base_sales_order_goods_real_name').val()//商品真实名称
 		});
	});
	
	//选择销售订单信息
	$('#purchase_order_base_sales_order_ok_btn').on('click',function(){
		//将供应商列表信息添加到供应商表单中
 		var	rows = purchase_order_base_sales_order_grd.datagrid('getSelections');//获取所有选择的行记录
 		if(rows.length>1){
 			$.messager.alert('提示','请选择单行销售订单信息...','warning');
 		}else if(rows.length==1){
 			var row = rows[0];//带处理的销售订单行信息
 			//1.根据选择的销售订单行信息拼装查询条件
 			var salesOrderId=row.salesOrderId;//获取销售订单号
 			//2.如果选择的合同号跟之前的操作相同则不进行请求,如果不相同则将datagrid中对应的数据进行情况
 			var sales_order_id = $('#purchase_order_base_sales_order_id').val();
 			if(sales_order_id.length>0&&sales_order_id==salesOrderId){//选择跟上次相同的销售订单号,则不进行任何操作
 				purchase_order_base_sales_order_dialog.dialog('close');
 				purchase_order_base_sales_order_dialog.dialog('options').closed=true;
 				return ;
 			}
 			if(sales_order_id.length>0&&sales_order_id!=salesOrderId){
 				//3.异步信息将返回的结果添加到datagrid中
 				removeFullSalesOrderGoodsGrd($('#purchase_order_base_id').val());
 			}
 			$('#purchase_order_base_old_sales_order_id').val(salesOrderId);
 			$('#purchase_order_base_sales_order_id').val(salesOrderId);
 			$('#purchase_order_base_total_amount').val(numbericCurrentyFormatter(parseInt(row.totalAmount)/100));
 			purchase_order_base_sales_order_dialog.dialog('close');
 			purchase_order_base_sales_order_dialog.dialog('options').closed=true;
 			//4.将返回的数据行信息添加到缓存内存中
	 		getSalesOrderGoodsInfoByAjax(salesOrderId);
 		}else{
 			$.messager.alert('提示','请选择销售订单信息...','warning');
 		}
	});
});



/**
 * 格式化公司性质
 *@param value
 *@param row
 *@param index
 **/
function formatterSupplierNature(value,row,index){
	var combobox_data=purchase_order_base_supplier_nature.combobox('getData');
	for(var i=0;i<combobox_data.length;i++){
		var data=combobox_data[i];
		if(data.id==value){
			value=data.name;
			break;
		}
	}
	return value;
}
//-->
</script>
<table class="table" style="width: 100%;">
	<tr>
		<th>采购订单号<font color="red">*</font></th> 
		<td><input class="easyui-validatebox" style="background:#eee;width: 150px;border:1px solid #95B8E7" id="purchase_order_base_id" type="text" readonly="readonly"  data-options="" value="${purchaseOrder.purchaseOrderId}"/></td>
		<th>状态</th>
		<td colspan="3"><input id="purchase_order_base_status"  class="easyui-validatebox" class="easyui-combobox"  data-options="" value="0"/></td>
		<th>订货日期</th>
		<td><input class="easyui-validatebox" type="text" id="purchase_order_base_order_time" style="border:1px solid #95B8E7"/></td>
	</tr>
	<tr>
		<th>供应商<font color="red">*</font></th>
		<td colspan="5">
			<input  type="text" id="purchase_order_base_supplier_name" style="width: 300px;border:1px solid #95B8E7" readonly="readonly" data-options="" style="border:1px solid #95B8E7"/> 
			<input  type="hidden" id="purchase_order_base_supplier_id" readonly="readonly" data-options="" style="border:1px solid #95B8E7"/> 
			<a id="purchase_order_base_supplier_btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>交货日期</th>
		<td><input class="easyui-validatebox" type="text" id="purchase_order_base_order_end_time" data-options=""/></td>
	</tr>
	<tr>
		<th>联系人</th>
		<td>
			<input id="purchase_order_base_link_man" class="easyui-validatebox" type="text" name="man"style="border:1px solid #95B8E7" />
			<a id="purchase_order_base_custmer_link_man_btn"  href="#" class="easyui-linkbutton" plain="true" data-options="disabled:true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>办公电话</th>
		<td><input class="easyui-validatebox" type="text" id="purchase_order_base_link_tel" style="border:1px solid #95B8E7"/></td>
		<th>手机号码</th>
		<td><input class="easyui-validatebox" type="text" id="purchase_order_base_link_mobile" style="border:1px solid #95B8E7"/></td>
		<th>传真</th>
		<td><input class="easyui-validatebox" type="text" id="purchase_order_base_link_fax" style="border:1px solid #95B8E7"/></td>
	</tr>
	<tr>
		<th>送货地址</th>
		<td colspan="3"><input class="easyui-validatebox" type="text" style="width: 350px;border:1px solid #95B8E7;" id="purchase_order_base_delivery_point"/></td>
		<th>业务员</th>
		<td>
			<input class="easyui-validatebox" type="text" style="border:1px solid #95B8E7"/>
			<a id="btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th colspan="2" style="text-align: center;"></th>
	</tr>
	<tr>
		<th>销售订单号<font color="red">*</font></th>
		<td>
			<input class="easyui-validatebox" id="purchase_order_base_sales_order_id" type="text" readonly="readonly" style="border:1px solid #95B8E7"/>
			<input id="purchase_order_base_old_sales_order_id" type="hidden"/>
			<a id="purchase_order_base_sales_order_btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>合同总金额</th>
		<td><input id="purchase_order_base_total_amount"  readonly="readonly" style="background:#eee;width: 150px;border:1px solid #95B8E7;"/></td>
		<th colspan="4"></th>
	</tr>
</table>

<div id="purchase_order_base_supplier_dialog" style="display: none;">
	<%--弹出供应商选择框--%>
	<fieldset>
			<legend>筛选条件</legend>
			<table class="table" style="width: 100%;">
				<tr>
					<th>名称(关键字)</th>
					<td><input  id="purchase_order_base_supplier_name" style="border:1px solid #95B8E7"/></td>
					<th>简称</th>
					<td><input  id="purchase_order_base_supplier_short_name" style="border:1px solid #95B8E7"/></td>
					<th>公司性质</th>
					<td><input id="purchase_order_base_supplier_nature" style="border:1px solid #95B8E7"></td>
				</tr>
				<tr>
					<th>联系人</th>
					<td><input id="purchase_order_base_supplier_link" style="border:1px solid #95B8E7"/></td>
					<th>联系电话</th>
					<td><input id="purchase_order_base_supplier_link_tel" style="border:1px solid #95B8E7"/></td>
					<td colspan="2">
						<div style="float: left;">
						<a id="purchase_order_base_supplier_search_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
						</div>
						<div class="datagrid-btn-separator"></div>
						<div style="float: left;">
						<a id="purchase_order_base_supplier_ok_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-true'" plain="true">确定</a>
						<div>
					</td>
				</tr>
			</table>
	</fieldset>
	<div id="purchase_order_base_supplier_grd" style="margin-top: 5px;">
	</div>
</div>
<div id="purchase_order_base_sales_order_dialog" style="display: none;">
	<%--弹出销售订单选择框--%>
	<fieldset>
			<legend>筛选条件</legend>
			<table class="table" style="width: 100%;">
				<tr>
					<th>销售订单号</th>
					<td><input  id="purchase_order_base_sales_order_id" style="border:1px solid #95B8E7"/></td>
					<th>商品名称</th>
					<td><input  id="purchase_order_base_sales_order_goods_name" style="border:1px solid #95B8E7"/></td>
					<th>商品性质</th>
					<td><input  id="purchase_order_base_sales_order_goods_property" style="border:1px solid #95B8E7"/></td>
				</tr>
				<tr>
					<th>商品分类</th>
					<td><input  id="purchase_order_base_sales_order_goods_category_code" style="border:1px solid #95B8E7"/></td>
					<th>真实品名</th>
					<td><input  id="purchase_order_base_sales_order_goods_real_name" style="border:1px solid #95B8E7"/></td>
					<td colspan="2">
						<div style="float: left;">
						<a id="purchase_order_base_sales_order_search_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
						</div>
						<div class="datagrid-btn-separator"></div>
						<div style="float: left;">
						<a id="purchase_order_base_sales_order_ok_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-true'" plain="true">确定</a>
						<div>
					</td>
				</tr>
			</table>
	</fieldset>
	<div id="purchase_order_base_sales_order_grd" style="margin-top: 5px;">
	</div>
</div>