<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
var contract_sales_open_sales_contract_grd= null;
var contract_sales_open_sales_contract_status =null;
$(function(){
	contract_sales_open_sales_contract_grd = $('#contract_sales_open_sales_contract_grd').datagrid({
		fitColumns:false,
   		autoRowHeight:false,
   		border:false,
   		striped:true,
   		rownumbers:true,
   		collapsible:true,
   		frozenColumns:[[
   			{field:'id',title:'合同编号',width:120},
			{field:'customerId',title:'客户编号',width:60},
			{field:'customerName',title:'客户名称',width:200},
			{field:'contractFile',title:'合同文件编号',width:120}
   		]],
   		columns:[[
			{field:'effectDate',title:'生效日期',width:120},
			{field:'signTime',title:'签署日期',width:80},
			{field:'man',title:'联系人',width:120},
			{field:'mobile',title:'联系人手机',width:80},
			{field:'tel',title:'联系电话',width:80},
			{field:'fax',title:'传真',width:80},
			{field:'orderedDate',title:'订货日期',width:80},
			{field:'deliveryDate',title:'送货日期',width:80},
			{field:'deliveryPoint',title:'送货地点',width:200},
			{field:'contractTerms',title:'合同条款',width:200},
			/*
			{field:'printTimes',title:'打印次数',width:120},
			{field:'printTime',title:'最新打印时间',width:120},
			{field:'printAcc',title:'最新打印帐号',width:120},
			{field:'printRecord',title:'最新打印记录',width:120},
			*/
			{field:'status',title:'状态',width:80},
			/*
			{field:'auditedStatus',title:'审批状态',width:120},
			{field:'checkedStatus',title:'验货状态',width:120},
			*/
			{field:'salesMan',title:'业务员',width:120},
			{field:'validityDate',title:'有效期至',width:80},
			{field:'mome',title:'备注',width:250,align:'center'}
	   ]]
	});
	//合同状态
	contract_sales_open_sales_contract_status = $('#contract_sales_open_sales_contract_status').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=2400',
 		valueField: 'id',
		textField: 'name',
		editable:false
 	});
 	//销售销售合同按钮
 	$('#contract_sales_open_sales_contract_query_btn').on('click',function(){
 		contract_sales_open_sales_contract_grd.datagrid('options').url='${path}/contract/manager/salescontract/sales_contract_info_list.html';
 		contract_sales_open_sales_contract_grd.datagrid('load',{
 			id				:$('#contract_sales_open_sales_contract_id').val(),//合同编号
 			customerName	:$('#contract_sales_open_sales_contract_customer_name').val(),//客户名称
 			status			:contract_sales_open_sales_contract_status.combobox('getValue'),//状态
 			man				:$('#contract_sales_open_sales_contract_link_man').val(),//联系人
 			salesMan		:$('#contract_sales_open_sales_contract_sales_man').val()//这个地方有带完善的地方(通过下拉列表)
 		});
 	});
 	//选择销售合同按钮
 	$('#contract_sales_open_sales_contract_ok_btn').on('click',function(){
 		var rows=contract_sales_open_sales_contract_grd.datagrid('getSelections');
 		if(rows.length==0){
 			$.messager.alert('提示','请选择销售合同...','warning');
 			return ;
 		}
 		if(rows.length>1){
 			$.messager.alert('提示','请选择单行销售合同...','warning');
 			return ;
 		}
 		//1.设置对应的操作按钮
 		var pend_btn = $('#contract_sales_toolbar_pend_btn');
 		var contract_status =pend_btn.attr('contract_status');
 		if(contract_status==rows[0].status){//判断合同当前状态禁用当前按钮
 			//选择了未确认的销售合同,并将挂单按钮禁用
 			pend_btn.attr("disabled",true);
			pend_btn.linkbutton('disable');
 		}else{//选择当前已确认的销售合同
 			//禁用挂单按钮
 			pend_btn.attr("disabled",true);
			pend_btn.linkbutton('disable');
			//禁用提交合同按钮
 			$("#contract_sales_toolbar_ok_btn").attr("disabled",true);
			$('#contract_sales_toolbar_ok_btn').linkbutton('disable');
 		}
 		//2.填充销售合同基本信息
 		//7.合同备注
 		setContractSalesBaseInfo(rows[0]);
 		//3.销售合同商品明细
 		setContractSalesGoodsGrdTab(rows[0]);
 		//4.合同条款
 		setContractSalesContractTermsTab(rows[0]);
 		//5.销售保函
 		//6.支付明细
 		setContractSalesPayDetailTab(rows[0]);
 		//8.合同扫描件
 		setContractSalesContractScanTab(rows[0]);
 		
 		//清空查询列表
 		contract_sales_open_sales_contract_grd.datagrid('loadData',{ total: 0, rows: []});
 		
 		contract_sales_open_dialog.dialog('close');
 	});
});
</script>
<div id="contract_sales_open_dialog">
	<fieldset>
		<legend>筛选条件</legend>
		<table class="table" width="99.5%">
			<tr>
				<th>合同文件编号</th>
				<td><input id="contract_sales_open_sales_contract_id" style="border:1px solid #95B8E7;"/></td>
				<th>合同状态</th>
				<td><input id="contract_sales_open_sales_contract_status" style="border:1px solid #95B8E7;"/></td>
				<th>客户名称</th>
				<td><input id="contract_sales_open_sales_contract_customer_name" style="border:1px solid #95B8E7;"/></td>
			</tr>
			<tr>
				<th>联系人</th>
				<td><input id="contract_sales_open_sales_contract_link_man" style="border:1px solid #95B8E7;"/></td>
				<th>业务员</th>
				<td><input id="contract_sales_open_sales_contract_sales_man" style="border:1px solid #95B8E7;"/></td>
				<td colspan="2">
					<div style="float: left;margin-left:10px;">
						<a id="contract_sales_open_sales_contract_query_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
					</div>
					<div class="datagrid-btn-separator" ></div>
					<div style="float: left;margin-left:10px;">
						<a id="contract_sales_open_sales_contract_ok_btn"  href="#" class="easyui-linkbutton" data-options="iconCls:'icon-true'" plain="true">确定</a>
					<div>
				</td>
			</tr>
		</table>
	</fieldset>
	<div id="contract_sales_open_sales_contract_grd"></div>
</div>