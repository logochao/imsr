<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
//-->
</script>
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