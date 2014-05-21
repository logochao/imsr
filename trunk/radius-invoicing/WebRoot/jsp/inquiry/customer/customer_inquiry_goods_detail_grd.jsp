<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
var customer_inquiry_goods_detail_grd = null;//销售合同明细列表
$(function(){
	//销售合同商品列表
	customer_inquiry_goods_detail_grd=$('#customer_inquiry_goods_detail_grd').datagrid({
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
		
				{field:'specId',title:'规格编码',width:120,formatter:specIdFormatter},
				{field:'unit',title:'包装单位(规格)',width:120,formatter:unitFormatter},
				{field:'quantityEuPerUnit',title:'包装单位折合数量',width:120},
				{field:'quantityEu',title:'折合数量',width:120},
				{field:'quantityUnit',title:'数量',width:120},
				{field:'memo',title:'商品备注',width:120}
		]]
	});
});

//规格格式化
function specIdFormatter(value,row,index){
	return com.radius.datagrid.spec_type.formatter(value,row,index,customer_inquiry_goods_detail_spec_type);
}
//规格格式化
function unitFormatter(value,row,index){
	return com.radius.datagrid.formatter(value,row,index,customer_inquiry_goods_detail_spec_unit);
}

/**
 * 设置销售合同商品列表明细页签
 *
 **/
function setContractSalesGoodsGrdTab(row_data){
	customer_inquiry_goods_detail_grd.datagrid('loadData',{ total: 0, rows: []});
	//1.获取当前合同编号
	var contract_id = row_data.id;
	//2.将缓存中的数据进行删除
	var memcached_url='${path}/contract/manager/purchaseContract/contract_pay_info_remove_memcached.html';
	var memcached_data={
		contractId:contract_id,
		delete:true
	};
	removeFormatterData2Memecached(memcached_url,memcached_data);
	//2.根据合同编号获取销售合同明细列表
	$.ajax({
		url:'${path}/contract/manager/salescontract/sales_contract_goods_grd_by_contract_id.html',
		method:'POST',
		data:{contractId:contract_id},
		success:function(r){
			if(r&&r.total>0){
				$.each(r.rows,function(index,d){
				//遍历销售合同商品信息
					//1.获取格式化数据并设置到表格里
					var row_data = contractSalesGoodsDetailGrdFormatter(d);
					addTargetDataGridRowData($('#customer_inquiry_goods_detail_grd'),row_data,0);
					//2.将数据添加到memcahed中
					var memcached_url = '${path}/contract/manager/sales_contract_product_info_memcache.html';//销售合同商品列表
					addFormatterData2Memecached(memcached_url,d);
					$('#customer_inquiry_goods_detail_grd').datagrid('acceptChanges');
				});
			}
		},error:function(r){
			$.messager.alert('提示','访问服务发生异常....','error');
		}
	});
}
/**
 *根据后台的数据格式化符合销售合同详细明细datagrid
 *@params{} _data
 *@return	{json}
 **/
function contractSalesGoodsDetailGrdFormatter(_data){
	var json={
		goodsId:_data.goodsId,//商品编号
   		goodsName:_data.goodsName,//商品名称
		specId:_data.specId,//规格
		unit:_data.unit,//包装单位
		quantityEuPerUnit:_data.quantityEuPerUnit,//包装单位折合数量
		quantityEu:_data.quantityEu,//折合数量
		quantityUnit:_data.quantityUnit,//数量
		mome:_data.memo//备注
	};
	return json;
}
</script>
<div id="customer_inquiry_goods_detail_grd"></div>