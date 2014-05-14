<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
//-->
</script>
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
	<jsp:include flush="true" page="client_inquiry_base_customer_grd.jsp"></jsp:include>
</div>