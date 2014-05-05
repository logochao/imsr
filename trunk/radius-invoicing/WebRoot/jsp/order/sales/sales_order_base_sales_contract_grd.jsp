<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
var sales_order_base_sales_contract_grd = null;//销售合同列表
$(function(){
	sales_order_base_sales_contract_grd=$('#sales_order_base_sales_contract_grd').datagrid({//销售合同列表
			fit:false,
      		autoRowHeight:false,
      		border:false,
      		striped:true,
      		rownumbers:true,
      		collapsible:true,
      		columns:[[
      			{field:'id',title:'合同编号',width:120},
      			{field:'contractFile',title:'合同文件编号',width:120},
      			{field:'customerName',title:'客户名称',width:120},
				{field:'signTime',title:'签署日期',width:80},
				{field:'effectDate',title:'生效日期',width:80},
				{field:'validityDate',title:'有效期至',width:80},
				{field:'orderedDate',title:'订货日期',width:80},
				{field:'deliveryDate',title:'送货日期',width:80},
				{field:'totalAmount',title:'总金额',width:80,formatter: function(value,row,index){
					return (value/100).toFixed(2);
				}},
				{field:'upperAmount',title:'大写金额',width:120},
				{field:'man',title:'联系人',width:120},
				{field:'mobile',title:'手机',width:120},
				{field:'tel',title:'电话',width:120},
				{field:'fax',title:'传真',width:120},
				{field:'memo',title:'合同备注',width:220}
		]]
	});
});
</script>
<div id="sales_order_base_sales_contract_grd"></div>