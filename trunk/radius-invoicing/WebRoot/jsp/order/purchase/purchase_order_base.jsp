<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
var purchase_order_base_status = null;//采购订单状态
$(function(){
	purchase_order_base_status=$('#purchase_order_base_status').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=2400',
 		valueField: 'id',
		textField: 'name',
		onLoadSuccess:function(){
			var target = $(this);
			target.combobox("setValue",target.val());
			target.combobox('disable');
		}
 	});
 	
 	$('#purchase_order_base_supplier_btn').on('click',function(){
 		purchase_order_base_supplier_dialog.dialog('open');
 	});
 	$('#purchase_order_base_custmer_link_man_btn').on('click',function(){
 		if($('#purchase_order_base_supplier_id').val().length==0){
 			$.messager.alert('提示','请选择供应商信息...','warning');
 			return ;
 		}
 		purchase_order_base_link_man_dialog.dialog('open');
 	});
 	
 	$('#purchase_order_base_sales_order_btn').on('click',function(){
 		if($('#purchase_order_base_supplier_id').val().length==0){
 			$.messager.alert('提示','请选择供应商信息...','warning');
 			return ;
 		}
 		purchase_order_base_sales_order_dialog.dialog('open');
 	});
});

/**
 *清空采购订单基本信息
 */
function clearPurchaseOrderBase(){
	com.radius.combobox.setelement(purchase_order_base_status,'setValue','2401');//设置合同默认状态
	$('#purchase_order_base_order_time').val('');//清空订货日期
	$('#purchase_order_base_supplier_name').val('');
	$('#purchase_order_base_supplier_id').val('');
	$('#purchase_order_base_order_end_time').val('');
	$('#purchase_order_base_link_man').val('');
	$('#purchase_order_base_link_tel').val('');
	$('#purchase_order_base_link_mobile').val('');
	$('#purchase_order_base_link_fax').val('');
	$('#purchase_order_base_delivery_point').val('');
	$('#purchase_order_base_sales_order_id').val('');
	$('#purchase_order_base_total_amount').val('');
	resetSupplierDialog();
	com.radius.datagrid.clear(purchase_order_base_supplier_grd);
	resetSupplierLinkManDialog();
	com.radius.datagrid.clear($('#purchase_order_base_link_man_grd'));
	clearPurchaseOrderBaseSalesOrderDialog();
	com.radius.datagrid.clear($('#purchase_order_base_sales_order_grd'));
}

/**
 *设置采购订单基本信息
 **/
function setPurchaseOrderBase(row_data){
	console.info(row_data.salesOrderId);
	com.radius.combobox.setelement(purchase_order_base_status,'setValue',row_data.status);//设置合同默认状态
	$('#purchase_order_base_order_time').val(row_data.orderedDate);
	$('#purchase_order_base_supplier_name').val(row_data.supplierName);
	$('#purchase_order_base_supplier_id').val(row_data.supplierId);
	$('#purchase_order_base_order_end_time').val(row_data.deliveryDate);
	$('#purchase_order_base_link_man').val(row_data.linkMan);
	$('#purchase_order_base_link_tel').val(row_data.tel);
	$('#purchase_order_base_link_mobile').val(row_data.mobile);
	$('#purchase_order_base_link_fax').val(row_data.fax);
	$('#purchase_order_base_delivery_point').val(row_data.deliveryPoint);
	$('#purchase_order_base_sales_order_id').val(row_data.salesOrderId);
	$('#purchase_order_base_total_amount').val(parseFloat(row_data.totalAmont)/100);
	$('#purchase_order_base_purchaser').val(row_data.purchaser);
	resetSupplierDialog();
	com.radius.datagrid.clear(purchase_order_base_supplier_grd);
	resetSupplierLinkManDialog();
	com.radius.datagrid.clear($('#purchase_order_base_link_man_grd'));
	clearPurchaseOrderBaseSalesOrderDialog();
	com.radius.datagrid.clear($('#purchase_order_base_sales_order_grd'));
}
</script>
<table class="table" style="width: 99.2%;">
	<tr>
		<th>采购订单号<font color="red">*</font></th> 
		<td><input class="easyui-validatebox" style="background:#eee;width: 150px;border:1px solid #95B8E7" id="purchase_order_base_id" type="text" readonly="readonly"  data-options=""/></td>
		<th>状态</th>
		<td colspan="3"><input id="purchase_order_base_status"  class="easyui-validatebox" class="easyui-combobox"  data-options="" value="2401"/></td>
		<th>订货日期</th>
		<td><input class="easyui-validatebox Wdate" type="text" id="purchase_order_base_order_time" onClick="WdatePicker()" style="border:1px solid #95B8E7"/></td>
	</tr>
	<tr>
		<th>供应商<font color="red">*</font></th>
		<td colspan="5">
			<input  type="text" id="purchase_order_base_supplier_name" style="width: 300px;border:1px solid #95B8E7;float: left;" readonly="readonly" data-options="" style="border:1px solid #95B8E7"/> 
			<input  type="hidden" id="purchase_order_base_supplier_id" readonly="readonly" data-options="" style="border:1px solid #95B8E7"/> 
			<a id="purchase_order_base_supplier_btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>交货日期</th>
		<td><input class="easyui-validatebox Wdate"  type="text" id="purchase_order_base_order_end_time" onClick="WdatePicker()" style="border:1px solid #95B8E7"/></td>
	</tr>
	<tr>
		<th>联系人</th>
		<td>
			<input id="purchase_order_base_link_man" class="easyui-validatebox" type="text" name="man"style="border:1px solid #95B8E7;float: left;" />
			<a id="purchase_order_base_custmer_link_man_btn"  href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
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
			<input class="easyui-validatebox" type="text" id="purchase_order_base_purchaser" style="border:1px solid #95B8E7;float: left;"/>
			<a id="btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th colspan="2" style="text-align: center;"></th>
	</tr>
	<tr>
		<th>销售订单号<font color="red">*</font></th>
		<td>
			<input class="easyui-validatebox" id="purchase_order_base_sales_order_id" type="text" readonly="readonly" style="border:1px solid #95B8E7;float: left;"/>
			<a id="purchase_order_base_sales_order_btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>合同总金额</th>
		<td><input id="purchase_order_base_total_amount"  readonly="readonly" style="background:#eee;width: 150px;border:1px solid #95B8E7;"/></td>
		<th colspan="4"></th>
	</tr>
</table>
<jsp:include flush="true" page="purchase_order_base_supplier.jsp"></jsp:include>
<jsp:include flush="true" page="purchase_order_base_link_man.jsp"></jsp:include>
<jsp:include flush="true" page="purchase_order_base_sales_order.jsp"></jsp:include>