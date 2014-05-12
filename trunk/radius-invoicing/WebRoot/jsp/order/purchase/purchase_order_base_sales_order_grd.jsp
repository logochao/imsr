<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
var purchase_order_base_sales_order_grd = null;
$(function(){
	//销售订单列表
	purchase_order_base_sales_order_grd=$('#purchase_order_base_sales_order_grd').datagrid({
		autoRowHeight:false,
   		border:false,
   		striped:true,
   		rownumbers:true,
   		collapsible:true,
   		frozenColumns:[[
   			{field:'salesOrderId',title:'销售订单号',width:200},
   			{field:'customerName',title:'客户名称',width:120},
   			{field:'totalAmount',title:'总金额',width:120,formatter: function(value,row,index){
				 if(value!=undefined&&value!=null&&(value+"").indexOf(".")<=0){
					value=(parseInt(value)/100).toFixed(2);
				 }
				 return value;
			  }	
   			},
   			{field:'status',title:'订单状态',width:100,formatter:function(value,row,index){
   				return com.radius.datagrid.formatter(value,row,index,purchase_order_base_status);
   			  }
   			}
   		]],
   		columns:[[
			{field:'orderedDate',title:'订货日期',width:120},
			{field:'deliveryDate',title:'交货日期',width:120},
			{field:'linkMan',title:'联系人',width:120},
			{field:'tel',title:'办公电话',width:120},
			{field:'contactInfo',title:'联系电话',width:120},
			{field:'fax',title:'传真',width:120},
			{field:'deliveryAddress',title:'送货地址',width:200}
		]]
	});
});
//-->
</script>
<div id="purchase_order_base_sales_order_grd" style="margin-top: 5px;">
</div>