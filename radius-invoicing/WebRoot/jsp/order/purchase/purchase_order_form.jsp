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




/**
 *将数据添加到销售订单列表中
 *@param row_data
 *@param memcached_url 缓存地址
 **/
function addSalesOrderGoodsGrd(row_data,memcached_url){
	//1.添加行数据
	purchase_order_form_sales_order_goods_grd.datagrid('insertRow',{
		index:0,
		row:row_data
	});
	//2.将数据添加到缓存中
	 //2.1 将数据格式化
	var memeched_data = getPurchaseOrderGoodsInfoFormatter(row_data);
	 //2.2 将数据添加到内存中
	 purchaseOrderGoodsMemcached(memcached_url,memeched_data);
}

/**
 * 获取采购订单商品信息（格式化后的）
 * @param
 *
 **/
function getPurchaseOrderGoodsInfoFormatter(row_data){
	var json={
	
	};
	return json;
}

/**
 * 异常处理缓存数据
 * @param memcached_url 缓存的请求地址
 * @param memcahed_data 缓存的数据
 **/
function purchaseOrderGoodsMemcached(memcached_url,memcahed_data){
	$.ajax({
		url:memcached_url,//缓存地址
		method:'POST',//请求方式
		data:memcahed_data,
		success:function (data){
			console.info(data);
		},
		error:function(data){
			console.info("与后台通讯失败.. ");
		}
	});
} 

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
//-->
</script>
<div id="purchase_order_form_sales_order_goods_grd">
</div>
