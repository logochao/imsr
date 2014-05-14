<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
var sales_order_total_amount = 0;//合同总金额
var purchase_contract_order_goods_detail_grd = null ;
$(function(){
	//销售合同商品列表
	purchase_contract_order_goods_detail_grd=$('#purchase_contract_order_goods_detail_grd').datagrid({
       		autoRowHeight:false,
       		border:false,
       		striped:true,
       		rownumbers:true,
       		collapsible:true,
       		frozenColumns:[[
				{field:'purchaseOrderId',title:'采购订货单号',width:100},
				{field:'goodsId',title:'商品编号',width:100},
				{field:'goodsName',title:'商品名称',width:120}
       		]],
       		columns:[[
				
				{field:'specId',title:'规格编码',width:100},
				{field:'unit',title:'包装单位(规格)',width:100},
				{field:'priceUnit',title:'包装单位单价',width:100,formatter: function(value,row,index){
						if(value!=undefined&&value!=null&&(value+"").indexOf(".")<=0){
							value=value.toFixed(2);
						}
						return value;
					}	
				},
				{field:'equivalentUnit',title:'折合单位',width:100},
				{field:'priceEu',title:'折合单位单价',width:100,formatter: function(value,row,index){
						if(value!=undefined&&value!=null&&(value+"").indexOf(".")<=0){
							value=value.toFixed(2);
						}
						return value;
					}	
				},
				{field:'quantityEuPerUnit',title:'包装单位折合数量',width:100},
				{field:'quantityUnit',title:'数量',width:100},
				{field:'quantityEu',title:'折合数量',width:100},
				{field:'amount',title:'金额',width:100,formatter: function(value,row,index){
						if(value!=undefined&&value!=null&&(value+"").indexOf(".")<=0){
							value=value.toFixed(2);
						}
						return value;
					}	
				},
				{field:'status',title:'状态',width:100},
				{field:'memo',title:'备注',width:250,align:'center'}
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
				$('#purchase_contract_order_goods_detail_grd').datagrid('loadData', {total: 0,rows:[]});
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
	var rows = purchase_contract_order_goods_detail_grd.datagrid('getRows');//获取当前页所有数据行
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
	addTargetDataGridRowData(purchase_contract_order_goods_detail_grd,row_data,0);
	//2.将数据添加到缓存中
	 //2.1 将数据格式化
	var memeched_data = getPurchaseOrderGoodsInfoFormatter(row_data);
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
	updateTargetDataGridRowData(purchase_contract_order_goods_detail_grd,row_data,row_index);
	//2.更新memcached
	var memcached_data={
		purchaseOrderId:$('#purchase_order_base_id').val(),//销售订单编号
		goodsId:goodsId,//商品编号
		quantityUnit:quantityUnit,
		amount:parseFloat(amount)*100  //*100-->转化为整数
	};
	addFormatterData2Memecached(memcached_url,memcached_data);
}


/**
 * 获取采购订单商品信息（格式化后的）
 * @param{} row_data 采购订单列表数据行
 * @return 符合后台保存的数据格式(ajax)
 **/
function getPurchaseOrderGoodsInfoFormatter(row_data){
	var json={
		contractId			:$('#purchase_order_base_id').val(),//采购合同编号
		goodsId				:row_data.goodsId,//商品编号
		goodsName			:row_data.goodsName,//商品名称
		specId				:row_data.specId,//规格编码
		unit				:row_data.unit,//包装单位(规格)
		priceUnit			:parseFloat(row_data.priceUnit)*100,//折合单位
		equivalentUnit		:row_data.equivalentUnit,//折合单位
		priceEu				:parseFloat(row_data.priceEu)*100,//折合单位单价
		quantityEuPerUnit	:row_data.quantityEuPerUnit,//包装单位折合数量
		quantityUnit		:row_data.quantityUnit,//数量
		quantityEu			:row_data.quantityEu,//折合数量
		amount				:parseFloat(row_data.amount)*100,//金额
		status				:row_data.status,//状态
		memo				:row_data.memo//商品备注
	};
	return json;
}

/**
 *获取采购订单商品明细
 **/
function getPurchaseOrderGoodsDetail(purchaseOrderId){
	var ajax_url ='${path}/contract/manager/purchaseContract/purchase_order_goods_list.html';
	var ajax_data={purchaseOrderId:purchaseOrderId};
	getPurchaseContractGoodsDetail(ajax_url,ajax_data);
}

/**
 * 通过条件查询相关商品明细列表
 **/
function getPurchaseContractGoodsDetail(ajax_url,ajax_data){
	//1.通过ajax获取采购订单商品信息
	$.ajax({
		url:ajax_url,
		mehtod:'POST',
		data:ajax_data,
		success:function(r){
			if(r&&r.total>0){
				$.each(r.rows,function(index,d){
					//1.1 将数据格式化
					var row_data=getPurchaseOrderGoodsGrdRowFormatter(d);//将数据格式化
					//1.2 在数据列表中添加、在缓存中添加
					setPurchaseOrderGoodsGrd(row_data);
					$('#purchase_order_form_sales_order_goods_grd').datagrid('acceptChanges');//接受改变
					//1.3 根据当前的商品编号获取询价记录tab页签并加入到datagrid中
				});
			}
		},
		error:function(r){
			$.messager.alert('提示','访问服务发生异常....','error');
		}
	});
}
/**
 *将采购订单商品列表转为采购合同商品列表
 **/
function getPurchaseOrderGoodsGrdRowFormatter(_data){
  var json={
  		purchaseOrderId		:$('#purchase_contract_base_purchase_order_id').val(),//采购订货单编号
		goodsId				:_data.goodsId,//商品编号
		goodsName			:_data.goodsName,//商品名称
		specId				:_data.specId,//规格编码
		unit				:_data.unit,//包装单位(规格)
		priceUnit			:parseFloat(_data.priceUnit)/100,//包装单位单价
		equivalentUnit		:_data.equivalentUnit,//折合单位
		priceEu				:parseFloat(_data.priceEu)/100,//折合单位单价
		quantityEuPerUnit	:_data.quantityEuPerUnit,//包装单位折合数量
		quantityUnit		:_data.quantityUnit,//数量
		quantityEu			:_data.quantityEu,//折合数量
		amount				:parseFloat(_data.amount)/100,//金额
		memo				:_data.memo,//商品备注
		status				:_data.status//状态
  };
  return json;
}
/**
 *清空采购合同商品列表页签
 **/
function clearPurchaseContractGoodsDetailTab(){
	com.radius.datagrid.clear(purchase_contract_order_goods_detail_grd);
}

/**
 * 通过采购合同行数据获取采购合同商品明细并设置到商品明细页签中
 *@params{}  row_data 采购合同行数据
 **/
function setPurchaseContractGoodsDetail(row_data){
	var ajax_url='${path}/contract/manager/purchaseContract/purchase_contact_goods_list.html';
	var ajax_data={contractId:row_data.id};
	//移除缓存内容
	purchase_contract_order_goods_detail_grd.datagrid('loadData',{ total: 0, rows: []});
	removeFullSalesOrderGoodsGrd();
	//获取采购合同商品
	getPurchaseContractGoodsDetail(ajax_url,ajax_data);
}
//-->
</script>
<div id="purchase_contract_order_goods_detail_grd"></div>