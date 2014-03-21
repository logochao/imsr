<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
var purchase_contract_pay_detail_currency = null ;//货币下拉列表
var purchase_contract_pay_detail_pay = null;//支付方式下拉列表
var purchase_contract_pay_detail_pay_grd = null;//采购订单列表
$(function (){
	//----------------------------初始化---------------------------------
	purchase_contract_pay_detail_currency=$('#purchase_contract_pay_detail_currency').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=800',
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
	//支付方式
	purchase_contract_pay_detail_pay=$('#purchase_contract_pay_detail_pay').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=400',
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
 	
 	$('#purchase_contract_pay_detail_batch').numberspinner({
 		min:0,
 		required:true
 	});
 	
 	$('#purchase_contract_pay_detail_deadline_time').datebox({
 	});
	//销售合同支付详情列表
	purchase_contract_pay_detail_pay_grd=$('#purchase_contract_pay_detail_pay_grd').datagrid({
       		autoRowHeight:false,
       		border:false,
       		striped:true,
       		rownumbers:true,
       		collapsible:true,
       		columns:[[
       			{field:'batch',title:'款项批次',width:100,align:'center'},
       			{field:'cashType',title:'币种',width:60,align:'center'},
				{field:'amount',title:'金额',width:120,align:'center'},
				{field:'validityDate',title:'款项期限',width:80,align:'center'},
				{field:'receiveType',title:'支付方式',width:120,align:'center'},
				{field:'upperAmount',title:'人民币大写',width:220,align:'center'},
				{field:'mome',title:'备注',width:250,align:'center'}
			]]
	});
	
	//---------------------------------业务处理-----------------------------------------
});
</script>
<table class="table" style="width: 100%;">
	<tr>
		<th>合同总额</th>
		<td>
			<input  id="purchase_contract_pay_detail_total_amount" style="background:#eee;border:1px solid #95B8E7;" readonly="readonly"/>
			<!-- 剩余金额 -->
			<input type="hidden"  id="purchase_contract_pay_detail_surplus_amount"/>
		</td>
		<th>币种</th>
		<td><input id="purchase_contract_pay_detail_currency"/></td>
		<th>付款方式</th>
		<td><input id="purchase_contract_pay_detail_pay"/></td>
		<th>款项批次</th>
		<td><input id="purchase_contract_pay_detail_batch" value="1"/></td>
	</tr>
	<tr>
		<th>金额</th>
		<td>
		<input style="width: 100px;border:1px solid #95B8E7;" id="purchase_contract_pay_detail_amount" type="text"  class="easyui-validatebox"  name="name" data-options="validType:'numberic(\'#purchase_contract_pay_detail_total_amount\')',missingMessage:'请输入金额',invalidMessage:'请输入正确的格式'"/>
		<input type="text" name="name" style="width: 20px;background:#eee;" readonly="readonly" value="元"/>
		</td>
		<th>人民币大写</th>
		<td colspan="3"><input  style="width: 400px;background:#eee;border:1px solid #95B8E7;" type="text"  id="purchase_contract_pay_detail_upper_rmb" /></td>
		<th>款项期限</th>
		<td><input id="purchase_contract_pay_detail_deadline_time"/></td>
	</tr>
	<tr>
		<th>备注</th>
		<td colspan="4"><input style="width: 400px;border:1px solid #95B8E7;" id="contract_sale_pay_detail_memo" /></td>
		<th colspan="2" style="text-align: center;"><input type="checkbox"/> 加入后不置空</th>
		<td>
			<a id="purchase_contract_pay_detail_add_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" plain="true">加入(A)</a>
			<a id="purchase_contract_pay_detail_delete_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-remove'" plain="true">删除(D)</a>
		</td>
	</tr>
</table>
<div id="purchase_contract_pay_detail_pay_grd">
	<%--销售合同支付方式 --%>
</div>