<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
var quotation_sales_goods_detail_grd = null;//销售合同明细列表
$(function(){
	//销售报价商品列表
	quotation_sales_goods_detail_grd=$('#quotation_sales_goods_detail_grd').datagrid({
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
				{field:'specId',title:'规格编码',width:100,formatter:specIdFormatter},
				{field:'unit',title:'包装单位(规格)',width:100,formatter:equivalentUnitFormatter},
				{field:'equivalentUnit',title:'折合单位',width:100,formatter:equivalentUnitFormatter},
				{field:'quantityEuPerUnit',title:'包装单位折合数量',width:100},
				{field:'supplyCashType',title:'供应币种',width:100,formatter:cashTypeFormatter},//查看查询商品列表货币格式化
				{field:'priceUnitSupply',title:'包装单位供应单价',width:100,formatter: function(value,row,index){
						if(value!=undefined&&value!=null&&(value+"").indexOf(".")<=0){
							value=(value/100).toFixed(2);
						}
						return value;
					}	
				},
				{field:'priceEuSupply',title:'折合单位供应单价',width:100,formatter: function(value,row,index){
						if(value!=undefined&&value!=null&&(value+"").indexOf(".")<=0){
							value=(value/100).toFixed(2);
						}
						return value;
					}	
				},
				{field:'salesCashType',title:'销售币种',width:100,formatter:cashTypeFormatter},//查看查询商品列表货币格式化
				{field:'exchRate',title:'折算汇率',width:100},
				{field:'priceEuCustomer',title:'销售报价',width:100,formatter: function(value,row,index){
						if(value!=undefined&&value!=null&&(value+"").indexOf(".")<=0){
							value=(value/100).toFixed(2);
						}
						return value;
					}	
				},
				{field:'markUpRate',title:'综合加价率',width:100},
				//{field:'madeDate',title:'生产日期',width:100},
				{field:'validityDate',title:'有效期至',width:100},
				{field:'memo',title:'备注',width:200}
		]]
	});
});

//规格格式化
function specIdFormatter(value,row,index){
	return com.radius.datagrid.spec_type.formatter(value,row,index,$('#quotation_sales_goods_detail_spec_type'));
}
//规格格式化
function unitFormatter(value,row,index){
	return com.radius.datagrid.formatter(value,row,index,quotation_sales_goods_detail_spec_unit);
}
</script>
<div id="quotation_sales_goods_detail_grd"></div>