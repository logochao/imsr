<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
var purchase_order_base_sales_order_dialog = null;
var purchase_order_base_sales_order_goods_property =null; 
var purchase_order_base_sales_order_goods_status = null;
$(function(){
	purchase_order_base_sales_order_dialog=$('#purchase_order_base_sales_order_dialog').show().dialog({
		 title:'选择销售订单',
		 width:800,
		 height:400,
		 collapsible:true,//向上缩小按钮
		 maximizable:true,
		 modal:true,
		 closed:true
	});
	
	//商品性质
 	purchase_order_base_sales_order_goods_property=$('#purchase_order_base_sales_order_goods_property').combobox({    
 		url:'${path}/common/system/category_code_list.html?parentId=2600',
 		valueField: 'id',
		textField: 'name',
		editable:false
	}); 
	
 	//商品状态
 	purchase_order_base_sales_order_goods_status=$('#purchase_order_base_sales_order_goods_status').combobox({    
	    url:'${path}/common/system/category_code_list.html?parentId=3700',
 		valueField: 'id',
		textField: 'name',
		editable:false
	});
	
	//查询销售订单按钮
	$('#purchase_order_base_sales_order_search_btn').on('click',function(){
		purchase_order_base_sales_order_grd.datagrid('options').url='${path}/order/manager/salesorder/sales_order_2_goods.html';
 		purchase_order_base_sales_order_grd.datagrid('load',{
 			company		:$('#purchase_order_base_supplier_id').val(),//供应商编号
 			salesOrderId:$('#purchase_order_base_sales_order_id').val(),//销售订单号
 			name		:$('#purchase_order_base_sales_order_goods_name').val(),//商品名称
 			goodsType	:purchase_order_base_sales_order_goods_property.combobox('getValue'),//商品属性
 			goodStatus	:purchase_order_base_sales_order_goods_status.combobox('getValue'),//商品分类
 			realName    :$('#purchase_order_base_sales_order_goods_real_name').val()//商品真实名称
 		});
	});
	
	//选择销售订单信息
	$('#purchase_order_base_sales_order_ok_btn').on('click',function(){
		//将供应商列表信息添加到供应商表单中
 		var	rows = purchase_order_base_sales_order_grd.datagrid('getSelections');//获取所有选择的行记录
 		if(rows.length==0){
 			$.messager.alert('提示','请选择销售订单信息...','warning');
 			return ;
 		}
 		if(rows.length>1){
 			$.messager.alert('提示','请选择单行销售订单信息...','warning');
 			return ;
 		}
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
		$('#purchase_order_base_sales_order_id').val(salesOrderId);
		$('#purchase_order_base_total_amount').val(numbericCurrentyFormatter(parseInt(row.totalAmount)/100));
		purchase_order_base_sales_order_dialog.dialog('close');
		purchase_order_base_sales_order_dialog.dialog('options').closed=true;
		//4.将返回的数据行信息添加到缓存内存中
		getSalesOrderGoodsInfoByAjax(salesOrderId);
	});
});

function clearPurchaseOrderBaseSalesOrderDialog(){
	$('#purchase_order_base_sales_order_id').val('');
	$('#purchase_order_base_sales_order_goods_name').val('');
	$('#purchase_order_base_sales_order_goods_real_name').val('');
}
//-->
</script>
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
					<th>商品状态</th>
					<td><input  id="purchase_order_base_sales_order_goods_status" style="border:1px solid #95B8E7"/></td>
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
	<jsp:include flush="true" page="purchase_order_base_sales_order_grd.jsp"></jsp:include>
</div>