<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
var purchase_contract_base_purchase_order_grd = null;
$(function(){
	//采购订单列表
	purchase_contract_base_purchase_order_grd=$('#purchase_contract_base_purchase_order_grd').datagrid({
		autoRowHeight:false,
   		border:false,
   		striped:true,
   		rownumbers:true,
   		collapsible:true,
   		frozenColumns:[[
			{field:'purchaseOrderId',title:'采购订货单编号',width:200},
			{field:'supplierId',title:'供货商编号',width:120},
			{field:'supplierName',title:'供货商名称',width:120}
   		]],
   		columns:[[
			{field:'linkMan',title:'联系人',width:120},
			{field:'mobile',title:'联系人手机',width:120},
			{field:'tel',title:'电话',width:120},
			{field:'fax',title:'传真',width:120},
			{field:'salesOrderId',title:'销售订单号',width:120},
			{field:'totalAmont',title:'订单金额',width:120,formatter: function(value,row,index){
				 if(value!=undefined&&value!=null&&(value+"").indexOf(".")<=0){
					value=(parseInt(value)/100).toFixed(2);
				 }
				 return value;
			  }	
			},
			{field:'orderedDate',title:'订单日期',width:120},
			{field:'deliveryDate',title:'送货日期',width:120},
			{field:'status',title:'状态',width:120,formatter:function(value,row,index){
   				return com.radius.datagrid.formatter(value,row,index,purchase_contract_base_status);
   			  }
   			 },
			//{field:'consolidatedFlg',title:'合单标识',width:120},
			//{field:'consolidatedPurchaseOrderId',title:'合单后订单号',width:120},
			//{field:'printTimes',title:'打印次数',width:120},
			//{field:'printTime',title:'最新打印时间',width:120},
			//{field:'printAcc',title:'最新打印帐号',width:120},
			//{field:'printRecord',title:'最新打印记录',width:120},
			//{field:'purchaser=""',title:'采购员',width:120},
			{field:'terms',title:'条款',width:200},
			{field:'memo',title:'备注',width:200}
		]]
	});
});
//-->
</script>
<div id="purchase_contract_base_purchase_order_grd" style="margin-top: 5px;">
</div>