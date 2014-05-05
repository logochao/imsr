<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
<!--
var sales_order_goods_quoted_grd=null;
$(function (){
	//销售合同报价列表
	sales_order_goods_quoted_grd=$('#sales_order_goods_quoted_grd').datagrid({
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
/**
 *清空销售订单报价页签
 */
function clearSalesOrderQuotedTab(){
	com.radius.datagrid.clear(sales_order_goods_quoted_grd);
}
//-->
</script>
<div id="sales_order_goods_quoted_grd"></div>