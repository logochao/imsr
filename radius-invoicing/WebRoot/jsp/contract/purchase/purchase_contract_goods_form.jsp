<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
<!--
var sales_order_total_amount = 0;//合同总金额
var purchase_order_form_sales_order_goods_grd=null;//销售合同商品列表
$(function(){
   //销售合同商品列表
	purchase_contract_form_purchase_order_goods_grd=$('#purchase_contract_form_purchase_order_goods_grd').datagrid({
       		autoRowHeight:false,
       		border:false,
       		striped:true,
       		rownumbers:true,
       		collapsible:true,
       		frozenColumns:[[
       			{field:'purchaseOrderId',title:'订单编号',width:100},
       			{field:'goodsId',title:'商品编号',width:100},
       			{field:'goodsName',title:'商品名称',width:120},
       			{field:'trueGoodsName',title:'真实品名',width:120},
       			{field:'barCode',title:'条形码',width:100},
       		]],
       		columns:[[
				{field:'quantity',title:'数量',width:60},
				{field:'price',title:'单价',width:60,formatter: function(value,row,index){
						if(value!=undefined&&value!=null&&(value+"").indexOf(".")<=0){
							value=value.toFixed(2);
						}
						return value;
					}	
				},
				{field:'unit',title:'单位',width:60},
				{field:'amount',title:'金额',width:120,formatter: function(value,row,index){
						if(value!=undefined&&value!=null&&(value+"").indexOf(".")<=0){
							value=value.toFixed(2);
						}
						return value;
					}	
				 },
				{field:'originPlace',title:'产地',width:100},
				{field:'appearance',title:'外观',width:100},
				{field:'formatType',title:'规格编号',width:100},
				{field:'tax',title:'税率',width:100},
				{field:'taxAmount',title:'税额',width:100},
				{field:'seriesNo',title:'序号',width:100},
				{field:'model',title:'型号',width:100},
				{field:'property',title:'属性',width:100},
				{field:'weigthPerUnit',title:'单位重量',width:100},
				{field:'priceWeigthPerUnit',title:'单位重量单价',width:100},
				{field:'weightPerUnit',title:'每单位重量',width:100},
				{field:'batchNo',title:'批次',width:100},
				{field:'madeDate',title:'生产日期',width:100},
				{field:'validityDate',title:'有效期至',width:100},
				{field:'mome',title:'备注',width:250,align:'center'}
			]]
	});
});


/**
 * 移除全部的datagrid数据
 **/
function removeFullSalesOrderGoodsGrd(){
	$.ajax({
		url:'${path}/contract/manager/purchaseContract/contract_product_info_remove_memcached.html',//请求地址
		method:'POST',
		data:{
			contractId:$('#purchase_contract_base_id').val(),//采购合同编号
			delete:true
		},
		success:function(r){
			if(r&&r.success){
				$('#purchase_contract_form_purchase_order_goods_grd').datagrid('loadData', {total: 0,rows:[]});
				sales_order_total_amount=0;
			}
		},
		error:function(r){
			$.messager.alert('提示','与后台通讯失败...','error');
		}
	});
}

/**
 * 设置采购订单商品列表并将数据添加到内存中
 **/
function setPurchaseOrderGoodsGrd(row_data){
	var rows = purchase_contract_form_purchase_order_goods_grd.datagrid('getRows');//获取当前页所有数据行
	var url='${path}/contract/manager/purchaseContract/contract_product_info_memcached.html';//缓存地址
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
	addPurchaseOrderGoods2PurchaseOrderGoodsGrd(row_data,url);
}

/**
 *将数据添加到销售订单列表中
 *@param row_data
 *@param memcached_url 缓存地址
 **/
function addPurchaseOrderGoods2PurchaseOrderGoodsGrd(row_data,memcached_url){
	//1.添加行数据
	/*
	purchase_contract_form_purchase_order_goods_grd.datagrid('insertRow',{
		index:0,
		row:row_data
	});*/
	addTargetDataGridRowData(purchase_contract_form_purchase_order_goods_grd,row_data,0);
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
	/*purchase_contract_form_purchase_order_goods_grd.datagrid('updateRow',{
		index:row_index,
		row:row_data
	});*/
	updateTargetDataGridRowData(purchase_contract_form_purchase_order_goods_grd,row_data,row_index);
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
		purchaseOrderId:row_data.purchaseOrderId,//采购订货单编号
		barCode:row_data.barCode,//条形码
		goodsId:row_data.goodsId,//商品编号
		goodsName:row_data.goodsName,//商品名称
		quantity:row_data.quantity,//数量
		unit:row_data.unit,//单位
		price:parseFloat(row_data.price)*100,//单价
		amount:parseFloat(row_data.amount)*100,//金额
		trueGoodsName:row_data.trueGoodsName,//真实品名
		originPlace:row_data.originPlace,//产地
		appearance:row_data.appearance,//外观
		formatType:row_data.formatType,//规格编号
		tax:row_data.tax,//税率
		taxAmount:row_data.taxAmount,//税额
		seriesNo:row_data.seriesNo,//序号
		model:row_data.model,//型号
		property:row_data.property,//属性
		weigthPerUnit:row_data.weigthPerUnit,//单位重量
		priceWeigthPerUnit:row_data.priceWeigthPerUnit,//单位重量单价
		weightPerUnit:row_data.weightPerUnit,//每单位重量
		batchNo:row_data.batchNo,//
		madeDate:parseDate(row_data.madeDate),//生产日期
		validityDate:parseDate(row_data.validityDate),//有效期至
		memo:row_data.memo //
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
//-->
</script>
<div id="purchase_contract_form_purchase_order_goods_grd">
</div>
