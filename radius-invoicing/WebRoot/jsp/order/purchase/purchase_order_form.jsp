<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
<!--
var sales_order_total_amount = 0;//合同总金额
var purchase_order_form_sales_order_goods_grd=null;//销售合同商品列表
$(function(){
   //销售合同商品列表
	purchase_order_form_sales_order_goods_grd=$('#purchase_order_form_sales_order_goods_grd').datagrid({
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
				{field:'quantityUnit',title:'数量',width:60},
				{field:'equivalentUnit',title:'折合单位',width:60},
				{field:'quantityEu',title:'折合数量',width:60},
				{field:'priceEu',title:'折合单价',width:60,formatter: function(value,row,index){
						if(value!=undefined&&value!=null&&(value+"").indexOf(".")<=0){
							value=parseInt(value).toFixed(2);
						}
						return value;
					}	
				},
				{field:'unit',title:'规格',width:120},
				{field:'amount',title:'金额',width:120,formatter: function(value,row,index){
						if(value!=undefined&&value!=null&&(value+"").indexOf(".")<=0){
							value=value.toFixed(2);
						}
						return value;
					}	
				 },
				{field:'mome',title:'备注',width:250,align:'center'}
			]]
	});
});




function calculateTotalAmount(){
	//计算总金额
	var rows=purchase_order_form_sales_order_goods_grd.datagrid('getRows');
	sales_order_total_amount=0;
	for(var i=0;i<rows.length;i++){
		sales_order_total_amount+=parseFloat(rows[i].amount)*100;
		$('#sales_order_base_total_amount').val(numbericCurrentyFormatter(sales_order_total_amount/100));
		//转换为大写
		//toUpper($('#sales_order_base_total_amount'),$('#sales_order_base_upper_rmb'));
	}
}
/**
 * 数据数字格式化
 * @param numberic 带格式化得数字或是字符
 * @return 
 **/
function numbericCurrentyFormatter(numberic){
	//1.利用js交易是否为数字
	if(numberic==null||numberic==undefined){
		return '0.00';
	}else{
		numberic=numberic+"";
		if(numberic.indexOf('.')>0){
			return numberic;
		}else{
			return parseInt(numberic).toFixed(2);
		}
	}
}
//-->
</script>
<div id="purchase_order_form_sales_order_goods_grd">
</div>
