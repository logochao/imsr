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
   * 通过异步获取销售订单商品信息
   *
   */
 function getSalesOrderGoodsInfoByAjax(salesOrderId){
 	if(salesOrderId!=null&&salesOrderId!=undefined&&salesOrderId.length>0){
 		$.ajax({
 			url:'${path}/order/manager/salesorder/sales_order_goods_2_salesorderid.html',
 			method:'POST',
 			data:{
 				orderId:salesOrderId
 			},
 			success:function(data){
 				if(data&&data.total>0){
 					$.each(data.rows,function(index,d){
 						//1.1 将数据格式化
						var row_data=getPurchaseOrderGoodsGrdRowFormatter(d);//将数据格式化
						//1.2 在数据列表中添加、在缓存中添加
						setPurchaseOrderGoodsGrd(row_data);
						$('#purchase_order_form_sales_order_goods_grd').datagrid('acceptChanges');//接受改变
						//1.3 根据当前的商品编号获取询价记录tab页签并加入到datagrid中
 					});
 				}
 			},
 			error:function(data){
 				$.messager.show({
					title:'提示',
					msg:'与后台通讯失败..',
					timeout:5000,
					showType:'slide'
				});
 			}
 		});
 	}
 }

/**
 * 移除全部的datagrid数据
 * @params{} purchase_order_id 合同编号
 **/
function removeFullSalesOrderGoodsGrd(purchase_order_id){
	$.ajax({
		url:'${path}/order/manager/purchaseOrder/purchase_order_info_remove_memcached.html',//请求地址
		method:'POST',
		data:{
			purchaseOrderId:purchase_order_id,
			delete:true
		},
		success:function(r){
			if(r&&r.success){
				$('#purchase_order_form_sales_order_goods_grd').datagrid('loadData', {total: 0,rows:[]});
				sales_order_total_amount=0;
			}
		},
		error:function(r){
			$.messager.alert('提示','与后台通讯失败','error');
		}
	});
}
/**
  * 将后台数据格式化为订单商品列表
  *@param{} _data
  * @return json 符合 采购订单商品信息列表规则的json
  **/
function getPurchaseOrderGoodsGrdRowFormatter(_data){
	var json={
		goodsId:_data.goodsId,//商品编号
		goodsName:_data.goodsName,//商品名称
		price:_data.price/100,//单价
		quantityUnit:_data.quantity,//数量
		equivalentUnit:_data.equivalentUnit,//折合单位
		quantityEu:_data.quantityEu,//折合数量
		priceEu:_data.priceEu/100,//折合单价
		unit:_data.unit,//规格
		amount:_data.amount/100,//金额
		stats:_data.stats,
		mome:_data.memo//备注
	};
	return json;
}


function setPurchaseOrderGoodsGrd(row_data){
	var rows = purchase_order_form_sales_order_goods_grd.datagrid('getRows');//获取当前页所有数据行
	var url='${path}/order/manager/purchaseOrder/purchase_product_info_memcached.html';//缓存地址
	if(rows.length>0){//
		//1.存在对应的数据则将其更新
		var goodsId=row_data.goodsId;
		var row=null,isExist=false,row_index=0;//初始化

		for(var i=0;i<rows.length;i++){
			row=rows[i];
			if(row.goodsId==goodsId){
				isExist=true;
				row_index=i;
				break;
			}
		}
		if(isExist){
			var total_amount=parseFloat($('#purchase_order_base_total_amount').val())*100;//获取总金额
			 total_amount+=parseFloat(row_data.amount)*100;//获取当前商品的金额
			var quantity_unit=parseInt(row_data.quantityUnit)+parseInt(row.quantityUnit);
			//更新datagrid row 更新缓存
			var row_data_update={
				quantityUnit:quantity_unit,//数量
				amount:total_amount/100//金额
			};
			updatePurchaseOrderGoodsGrdRow(url,row_data_update,goodsId,row_index);
			$('#sales_order_base_total_amount').val(total_amount/100);//将显示总金额进行修改
			return ;
		}
	}
	addSalesOrderGoods2PurchaseOrderGoodsGrd(row_data,url);
}

/**
 *将数据添加到销售订单列表中
 *@param row_data
 *@param memcached_url 缓存地址
 **/
function addSalesOrderGoods2PurchaseOrderGoodsGrd(row_data,memcached_url){
	//1.添加行数据
	purchase_order_form_sales_order_goods_grd.datagrid('insertRow',{
		index:0,
		row:row_data
	});
	//2.将数据添加到缓存中
	 //2.1 将数据格式化
	var memeched_data = getPurchaseOrderGoodsInfoFormatter(row_data);
	console.info(memeched_data);
	 //2.2 将数据添加到内存中
	purchaseOrderGoodsMemcached(memcached_url,memeched_data);
}


/**
 * 更新采购订单商品列表
 * @param  memcached_url 请求缓存的地址
 * @param  row_data      
 * @param  goodsId
 * @param  row_index     
 **/
function updatePurchaseOrderGoodsGrdRow(memcached_url,row_data,goodsId,row_index){
	//1.更新datagrid
	purchase_order_form_sales_order_goods_grd.datagrid('updateRow',{
		index:row_index,
		row:row_data
	});
	//2.更新memcached
	var memcached_data={
		purchaseOrderId:$('#purchase_order_base_id').val(),//销售订单编号
		goodsId:goodsId,//商品编号
		quantityUnit:quantityUnit,
		amount:parseFloat(amount)*100  //*100-->转化为整数
	};
	purchaseOrderGoodsMemcached(memcached_url,memcached_data);
}


/**
 * 获取采购订单商品信息（格式化后的）
 * @param{} row_data 采购订单列表数据行
 * @return 符合后台保存的数据格式(ajax)
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
