<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
var quotation_supplier_goods_detail_grd = null;//销售合同明细列表
$(function(){
	//销售合同商品列表
	quotation_supplier_goods_detail_grd=$('#quotation_supplier_goods_detail_grd').datagrid({
   		fitColumns:true,
   		autoRowHeight:false,
   		border:false,
   		striped:true,
   		rownumbers:true,
   		collapsible:true,
   		frozenColumns:[[
   			{field:'goodsId',title:'商品编号',width:100},
   			{field:'goodsName',title:'商品名称',width:120}
   		]],
      	columns:[[
				
				{field:'specId',title:'规格编码',width:120},
				{field:'unit',title:'包装单位(规格)',width:120},
				{field:'equivalentUnit',title:'折合单位',width:100},
				{field:'quantityEuPerUnit',title:'包装单位折合数量',width:120},
				{field:'cashType',title:'币种',width:100},
				{field:'priceUnitSupply',title:'包装单位单价',width:100},
				{field:'priceEuSupply',title:'折合单位单价',width:100},
				{field:'validityDate',title:'有效期至',width:100},
				{field:'memo',title:'商品备注',width:120}
		]]
	});
});

//规格格式化
function specIdFormatter(value,row,index){
	return com.radius.datagrid.spec_type.formatter(value,row,index,quotation_supplier_goods_detail_spec_type);
}
//规格格式化
function unitFormatter(value,row,index){
	return com.radius.datagrid.formatter(value,row,index,quotation_supplier_goods_detail_spec_unit);
}
</script>
<div id="quotation_supplier_goods_detail_grd"></div>