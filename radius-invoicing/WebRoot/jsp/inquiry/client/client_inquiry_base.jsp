<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
<!--
//-->
</script>

<table class="table" style="width: 100%;">
	<tr>
		<th>合同编号</th>
		<td><input class="easyui-validatebox" style="background:#eee;width: 150px;" id="constract_sales_sale_base_id" type="text" readonly="readonly" name="name" data-options="" value="${salesContract.id}"/></td>
		<th>状态</th>
		<td colspan="3"><input id="contract_sales_base_status"  class="easyui-validatebox" class="easyui-combobox" name="name" data-options="" value="0"/></td>
		<th>订货日期</th>
		<td><input class="easyui-validatebox" type="text" id="contract_sales_base_order_time" data-options="required:true"/></td>
	</tr>
	<tr>
		<th>客户</th>
		<td colspan="5">
			<input  type="text" name="customerName" id="contract_sales_base_customer_name" style="width: 300px;" name="name" readonly="readonly" data-options=""/> 
			<input  type="hidden"  name="customerId" id="contract_sales_base_customer_id" readonly="readonly" data-options=""/> 
			<a id="contract_sales_base_custmer_btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>交货日期</th>
		<td><input class="easyui-validatebox" type="text" id="contract_sales_base_order_end_time" data-options=""/></td>
	</tr>
	<tr>
		<th>联系人</th>
		<td>
			<input id="contract_sales_base_link_man" class="easyui-validatebox" type="text" name="man" data-options=""/>
			<a id="contract_sales_base_custmer_link_man_btn"  href="#" class="easyui-linkbutton" plain="true" data-options="disabled:true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>办公电话</th>
		<td><input class="easyui-validatebox" type="text" name="tel" id="contract_sales_base_link_tel" data-options=""/></td>
		<th>手机号码</th>
		<td><input class="easyui-validatebox" type="text" name="mobile" id="contract_sales_base_link_mobile" data-options=""/></td>
		<th>传真</th>
		<td><input class="easyui-validatebox" type="text" name="fax" id="contract_sales_base_link_fax" data-options=""/></td>
	</tr>
	<tr>
		<th>送货地址</th>
		<td colspan="3"><input class="easyui-validatebox" type="text" style="width: 350px;" id="contract_sales_base_delivery_point" data-options=""/></td>
		<th>业务员</th>
		<td>
			<input class="easyui-validatebox" type="text" name="salesMan" data-options=""/>
			<a id="btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th colspan="2" style="text-align: center;"><input type="checkbox" id="contract_sales_base_checkbox" onclick="javascript:contractSalesBaseCheckboxClick(this);" value="0" />转保函付款申请</th>
	</tr>
	<tr>
		<th>合同类型</th>
		<td><input class="easyui-validatebox" id="contract_sales_base_contract_type" type="text" name="name" data-options="" value="2"/></td>
		<th>合同总金额</th>
		<td><input id="contract_sales_base_total_amount" style="background:#eee;" readonly="readonly"/></td>
		<th>人民币大写</th>
		<td colspan="3"><input id="contract_sales_base_upper_rmb" style="background:#eee;width: 400px;" readonly="readonly"/></td>
		
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