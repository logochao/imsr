<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
var purchase_contract_base_contract_type = null;
var purchase_contract_base_status = null;
$(function(){
	//合同类型
 	purchase_contract_base_contract_type=$('#purchase_contract_base_contract_type').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=1',
 		valueField: 'id',
		textField: 'name',
		onLoadSuccess:function(){
			var target = $(this);
			var data = target.combobox("getData");
			var options = target.combobox("options");
			if(data && data.length>0){
				for(var i=0;i<data.length;i++){
					var fs = data[i];
					if(fs[options.valueField]==target.val()){//如果设置的值等于默认值，将将对应的显示内容显示
						target.combobox("setValue",fs[options.textField]);
					}
				}
			}
			target.combobox('disable');//设置当前下拉列表不可用
		}
 	});
 	//状态
 	purchase_contract_base_status=$('#purchase_contract_base_status').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=2400',
 		valueField: 'id',
		textField: 'name',
		onLoadSuccess:function(){
			var target = $(this);
			target.combobox("setValue",target.val());
			target.combobox('disable');
		}
 	});
 	
 	$('#purchase_contract_base_supplier_btn').on('click',function(){
 		purchase_contract_base_supplier_dialog.dialog('open');
 	});
 	
 	$('#purchase_contract_base_custmer_link_man_btn').on('click',function(){
	 	purchase_contract_base_link_man_dialog.dialog('open');
 	});
 	$('#purchase_contract_base_purchase_order_btn').on('click',function(){
 		if($('#purchase_contract_base_id').val().length==0){
 			$.messager.alert('提示','请点击<font color=red>新建</font>按钮构建采购合同信息...','warning');
 			return ;
 		}
	 	purchase_contract_base_purchase_order_dialog.dialog('open');
 	});
});
/**
 *清空采购合同基本信息
 **/
function clearPurchaseContractBase(){
	$('#purchase_contract_base_id').val('');
	purchase_contract_base_status.combobox('setValue','2401');
	$('#purchase_contract_base_supplier_name').val('');
	$('#purchase_contract_base_supplier_id').val('');
	$('#purchase_contract_base_link_man').val('');
	$('#purchase_contract_base_link_tel').val('');
	$('#purchase_contract_base_link_fax').val('');
	$('#purchase_contract_base_delivery_point').val('');
	$('#purchase_contract_base_clerk').val('');
	$('#purchase_contract_base_purchase_order_id').val('');
	
	resetSupplierDialog();
	com.radius.datagrid.clear(purchase_order_base_supplier_grd);
	resetSupplierLinkManDialog();
	com.radius.datagrid.clear(purchase_contract_base_link_man_grd);
	clearPurchaseOrderBaseSalesOrderDialog();
	com.radius.datagrid.clear(purchase_contract_base_purchase_order_grd);
}

/**
 *
 *设置采购合同基本信息
 *@params{} row_data 采购合同信息行
 **/
function setPurchaseContractBaseInfo(row_data){
	$('#purchase_contract_base_id').val(row_data.id);
	$('#purchase_contract_base_order_time').val(row_data.orderedDate);
	$('#purchase_contract_base_supplier_id').val(row_data.supplierId);
	$('#purchase_contract_base_supplier_name').val(row_data.supplierName);
	$('#purchase_contract_base_order_end_time').val(row_data.deliveryDate);
	$('#purchase_contract_base_link_man').val(row_data.man);
	$('#purchase_contract_base_link_tel').val(row_data.tel);
	$('#purchase_contract_base_link_mobile').val(row_data.mobile);
	$('#purchase_contract_base_link_fax').val(row_data.fax);
	$('#purchase_contract_base_delivery_point').val(row_data.deliveryPoint);
	$('#purchase_contract_base_clerk').val(row_data.purchaser);
	
	resetSupplierDialog();
	com.radius.datagrid.clear(purchase_order_base_supplier_grd);
	resetSupplierLinkManDialog();
	com.radius.datagrid.clear(purchase_contract_base_link_man_grd);
	clearPurchaseOrderBaseSalesOrderDialog();
	com.radius.datagrid.clear(purchase_contract_base_purchase_order_grd);
	purchase_contract_base_status.combobox('setValue',row_data.status);
	$('#purchase_contract_base_purchase_order_id').val(row_data.orderId);
}
//-->
</script>
<table class="table" style="width: 100%;">
	<tr>
		<th>采购合同号<font color="red">*</font></th> 
		<td><input class="easyui-validatebox" style="background:#eee;width: 150px;border:1px solid #95B8E7" id="purchase_contract_base_id" type="text" readonly="readonly"/></td>
		<th>状态</th>
		<td colspan="3"><input id="purchase_contract_base_status"  class="easyui-validatebox"  value="2401"/></td>
		<th>订货日期</th>
		<td><input class="easyui-validatebox Wdate" type="text" id="purchase_contract_base_order_time" onClick="WdatePicker()" style="border:1px solid #95B8E7"/></td>
	</tr>
	<tr>
		<th>供应商<font color="red">*</font></th>
		<td colspan="5">
			<input  type="text" id="purchase_contract_base_supplier_name" style="width: 300px;border:1px solid #95B8E7;float: left;" readonly="readonly"  style="border:1px solid #95B8E7"/> 
			<input  type="hidden" id="purchase_contract_base_supplier_id" readonly="readonly"  style="border:1px solid #95B8E7"/> 
			<a id="purchase_contract_base_supplier_btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>交货日期</th>
		<td><input class="easyui-validatebox Wdate" type="text" id="purchase_contract_base_order_end_time"  onClick="WdatePicker()" style="border:1px solid #95B8E7" /></td>
	</tr>
	<tr>
		<th>联系人</th>
		<td>
			<input id="purchase_contract_base_link_man" class="easyui-validatebox" type="text" style="border:1px solid #95B8E7;float: left;" />
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
			<input class="easyui-validatebox" id="purchase_contract_base_clerk" type="text" style="border:1px solid #95B8E7;float: left;"/>
			<a id="btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th colspan="2" style="text-align: center;"></th>
	</tr>
	<tr>
		<th>采购订单号<font color="red">*</font></th>
		<td>
			<input class="easyui-validatebox" id="purchase_contract_base_purchase_order_id" type="text" readonly="readonly" style="border:1px solid #95B8E7;float: left;"/>
			<a id="purchase_contract_base_purchase_order_btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>合同类型</th>
		<td colspan="5"><input id="purchase_contract_base_contract_type"  class="easyui-validatebox"  value="3"/></td>
	</tr>
</table>
<jsp:include flush="true" page="purchase_contract_base_supplier.jsp"></jsp:include>
<jsp:include flush="true" page="purchase_contract_base_supplier_link_man.jsp"></jsp:include>
<jsp:include flush="true" page="purchase_contract_base_purchase_order.jsp"></jsp:include>