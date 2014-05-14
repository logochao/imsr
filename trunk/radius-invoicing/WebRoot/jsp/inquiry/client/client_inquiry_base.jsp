<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
var client_inquiry_base_status = null;
$(function(){
	//合同状态
	client_inquiry_base_status=$('#client_inquiry_base_status').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=2400',
 		valueField: 'id',
		textField: 'name',
		onLoadSuccess:function(){
			var target = $(this);
			target.combobox("setValue",target.val());
			target.combobox('disable');
		}
 	});
});
//-->
</script>

<table class="table" style="width: 100%;">
	<tr>
		<th>客户询价号</th>
		<td><input class="easyui-validatebox" style="background:#eee;width: 150px;border:1px solid #95B8E7;" id="client_inquiry_sale_base_id" readonly="readonly"/></td>
		<th>状态</th>
		<td colspan="3"><input id="client_inquiry_base_status" style="border:1px solid #95B8E7;"  class="easyui-validatebox" class="easyui-combobox" value="2401"/></td>
		<th>询价日期</th>
		<td><input class="easyui-validatebox" style="border:1px solid #95B8E7;" id="client_inquiry_base_order_time"/></td>
	</tr>
	<tr>
		<th>客户</th>
		<td colspan="3">
			<input  id="client_inquiry_base_customer_name" style="width: 300px;border:1px solid #95B8E7;float: left;" readonly="readonly"/> 
			<input  type="hidden" id="client_inquiry_base_customer_id" readonly="readonly"/> 
			<a id="client_inquiry_base_custmer_btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>货币</th>
		<td>
			<input id="" >
		</td>
		<th>最迟报价日期</th>
		<td><input class="easyui-validatebox" style="border:1px solid #95B8E7;" id="client_inquiry_base_order_end_time" data-options=""/></td>
	</tr>
	<tr>
		<th>联系人</th>
		<td>
			<input id="client_inquiry_base_link_man" class="easyui-validatebox" style="border:1px solid #95B8E7;float: left;"/>
			<a id="client_inquiry_base_custmer_link_man_btn"  href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>办公电话</th>
		<td><input class="easyui-validatebox" style="border:1px solid #95B8E7;" id="client_inquiry_base_link_tel" /></td>
		<th>手机号码</th>
		<td><input class="easyui-validatebox" style="border:1px solid #95B8E7;" id="client_inquiry_base_link_mobile" /></td>
		<th>传真</th>
		<td><input class="easyui-validatebox" style="border:1px solid #95B8E7;" id="client_inquiry_base_link_fax"/></td>
	</tr>
	<tr>
		<th>送货地址</th>
		<td colspan="3"><input class="easyui-validatebox" style="width: 350px;border:1px solid #95B8E7;" id="client_inquiry_base_delivery_point"/></td>
		<th>业务员</th>
		<td>
			<input class="easyui-validatebox" style="border:1px solid #95B8E7;float: left;"/>
			<a id="btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th colspan="2" style="text-align: center;"><input type="checkbox" id="client_inquiry_base_checkbox" onclick="javascript:contractSalesBaseCheckboxClick(this);" value="0" />转保函付款申请</th>
	</tr>
	<tr>
		<th>合同类型</th>
		<td><input class="easyui-validatebox" id="client_inquiry_base_contract_type" style="border:1px solid #95B8E7;" value="2"/></td>
		<th>合同总金额</th>
		<td><input id="client_inquiry_base_total_amount" style="background:#eee;border:1px solid #95B8E7;" readonly="readonly"/></td>
		<th>人民币大写</th>
		<td colspan="3"><input id="client_inquiry_base_upper_rmb" style="background:#eee;width: 400px;border:1px solid #95B8E7;" readonly="readonly"/></td>
	</tr>
</table>
<jsp:include flush="true" page="client_inquiry_base_customer.jsp"></jsp:include>
<jsp:include flush="true" page="client_inquiry_base_customer_link_man.jsp"></jsp:include>