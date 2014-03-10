<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
<!--
var purchase_order_base_status = null; 
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
 	$('#purchase_order_base_order_end_time').datebox({
 	});
});
//-->
</script>
<table class="table" style="width: 100%;">
	<tr>
		<th>采购订单号<font color="red">*</font></th> 
		<td><input class="easyui-validatebox" style="background:#eee;width: 150px;border:1px solid #95B8E7" id="purchase_order_base_id" type="text" readonly="readonly"  data-options="" value="${salesOrder.salesOrderId}"/></td>
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
			<a id="purchase_order_base_custmer_btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
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
			<input class="easyui-validatebox" id="purchase_order_base_sales_contract_id" type="text" readonly="readonly" style="border:1px solid #95B8E7"/>
			<a id="purchase_order_base_sales_contract_btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>合同总金额</th>
		<td><input id="purchase_order_base_total_amount"  readonly="readonly" style="background:#eee;width: 150px;border:1px solid #95B8E7;"/></td>
		<th colspan="4"></th>
	</tr>
</table>