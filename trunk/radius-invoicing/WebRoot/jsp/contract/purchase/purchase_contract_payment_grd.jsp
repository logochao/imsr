<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
var purchase_contract_pay_detail_pay_grd  =null;
$(function(){
	//销售合同支付详情列表
	purchase_contract_pay_detail_pay_grd=$('#purchase_contract_pay_detail_pay_grd').datagrid({
       		autoRowHeight:false,
       		border:false,
       		striped:true,
       		rownumbers:true,
       		collapsible:true,
       		columns:[[
       			{field:'batch',title:'款项批次',width:100,align:'center'},
       			{field:'cashType',title:'币种',width:60,align:'center',formatter:cashTypeFormatter},
				{field:'amount',title:'金额',width:120,align:'center',formatter: function(value,row,index){
					 if(value!=undefined&&value!=null&&(value+"").indexOf(".")<=0){
						value=(parseInt(value)/100).toFixed(2);
					 }
					 return value;
				  }	
				},
				{field:'validityDate',title:'款项期限',width:80,align:'center'},
				{field:'receiveType',title:'收付款方式',width:120,formatter:receiveTypeFormatter},
				{field:'payType',title:'支付方式',width:120,align:'center',formatter:payTypeFormatter},
				{field:'upperAmount',title:'人民币大写',width:220,align:'center'},
				{field:'memo',title:'备注',width:250,align:'center'}
			]]
	});
});

/**
 *格式化供应商属性
 *
 */
function cashTypeFormatter(value,row,index){
	return com.radius.datagrid.formatter(value,row,index,purchase_contract_payment_detail_currency);
}

function receiveTypeFormatter(value,row,index){
	return com.radius.datagrid.formatter(value,row,index,purchase_contract_payment_detail_receive_type);
}
function payTypeFormatter(value,row,index){
	return com.radius.datagrid.formatter(value,row,index,purchase_contract_payment_detail_pay);
}
//-->
</script>
<div id="purchase_contract_pay_detail_pay_grd"></div>