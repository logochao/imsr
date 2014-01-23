<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function (){
	$('#contract_sales_pay_detail_currency').combobox({
 		valueField: 'label',
		textField: 'value',
 		data: [{
			label: '人民币',
			value: '人民币'
		},{
			label: '美元',
			value: '美元'
		},{
			label: '欧元',
			value: '欧元'
		}]
 	});
	$('#contract_sales_pay_detail_pay').combobox({
 		valueField: 'label',
		textField: 'value',
 		data: [{
			label: '转账汇款',
			value: '转账汇款'
		},{
			label: '支票',
			value: '支票'
		},{
			label: '现金',
			value: '现金'
		}]
 	});
 	
 	$('#contract_sales_pay_detail_batch').spinner({
 		required:true
 	});
 	
 	$('#contract_sales_pay_detail_deadline_time').datebox({
 		required:true
 	});
});
</script>
<table class="table" style="width: 100%;">
	<tr>
		<th>合同总额</th>
		<td><input/></td>
		<th>币种</th>
		<td><input id="contract_sales_pay_detail_currency"/></td>
		<th>付款方式</th>
		<td><input id="contract_sales_pay_detail_pay"/></td>
		<th>款项批次</th>
		<td><input id="contract_sales_pay_detail_batch" value="1"/></td>
	</tr>
	<tr>
		<th>金额</th>
		<td>
		<input style="width: 100px;" type="text"  name="name" data-options="required:true"/>
		<input type="text" name="name" style="width: 20px;background:#eee;" readonly="readonly" value="元"/>
		</td>
		<th>人民币大写</th>
		<td colspan="3"><input  style="width: 400px;background:#eee;" type="text"  name="name" /></td>
		<th>款项期限</th>
		<td><input id="contract_sales_pay_detail_deadline_time"/></td>
	</tr>
	<tr>
		<th>备注</th>
		<td colspan="4"><input style="width: 400px;"/></td>
		<th colspan="2" style="text-align: center;"><input type="checkbox"/> 加入后不置空</th>
		<td>
			<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" plain="true">加入(A)</a>
			<a id="btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-remove'" plain="true">删除(D)</a>
		</td>
	</tr>
</table>
<div id="contract_sales_pay_grd">
	<%--销售合同支付方式 --%>
</div>