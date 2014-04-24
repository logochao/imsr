<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
var contract_sales_goods_quoted_grd=null;
$(function (){
	//销售合同报价列表
	contract_sales_goods_quoted_grd=$('#contract_sales_goods_quoted_grd').datagrid({
			url:'${path}/jsp/contract/sales/datagrid_data2.json',
       		fitColumns:true,
       		autoRowHeight:false,
       		border:false,
       		striped:true,
       		rownumbers:true,
       		collapsible:true,
       		columns:[[
       			{field:'productid',title:'商品编号',width:100},
       			{field:'productname',title:'商品名称',width:120},
				{field:'amount',title:'数量',width:60},
				{field:'unit',title:'单位',width:60},
				{field:'zmount',title:'折合数量',width:60},
				{field:'aunit',title:'折合单位',width:60},
				{field:'format',title:'包装规格',width:120},
				{field:'price',title:'单价',width:60},
				{field:'zprice',title:'折合单价',width:60},
				{field:'sum',title:'金额',width:120},
				{field:'marker',title:'备注',width:250,align:'center'}
			]]
	});
});

function clearContractSalesGoodsQuoted(){
	contract_sales_goods_quoted_grd.datagrid('loadData',{ total: 0, rows: []});
}
</script>
<div id="contract_sales_goods_quoted_grd"></div>