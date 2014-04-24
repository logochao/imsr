<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
var contract_sales_goods_detail_grd = null;//销售合同明细列表
$(function(){
	//销售合同商品列表
	contract_sales_goods_detail_grd=$('#contract_sales_goods_detail_grd').datagrid({
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
		{field:'specId',title:'规格',width:120,formatter:specIdFormatter},
		{field:'unit',title:'包装单位',width:120,formatter:unitFormatter},
		{field:'priceUnit',title:'包装单位单价',width:120},
		{field:'equivalentUnit',title:'折合单位',width:120,formatter:equivalentUnitFormatter},
		{field:'priceEu',title:'折合单位单价',width:120},
		{field:'quantityEuPerUnit',title:'包装单位折合数量',width:140},
		{field:'quantityEu',title:'折合数量',width:120},
		{field:'quantityUnit',title:'数量',width:120},
		{field:'amount',title:'金额',width:120},
		{field:'mome',title:'备注',width:250,align:'center'}
		]]
	});
});

//规格格式化
function specIdFormatter(value,row,index){
	var combobox_data = contract_sales_goods_detail_spec_type.combobox('getData');
	for(var i=0,length=combobox_data.length;i<length;i++){
		if(combobox_data[i].specId==value){
			value=combobox_data[i].specName;
			break;
		}
	}
	return value;
}
//规格格式化
function unitFormatter(value,row,index){
	var combobox_data = contract_sales_goods_detail_spec_unit.combobox('getData');
	for(var i=0,length=combobox_data.length;i<length;i++){
		if(combobox_data[i].id==value){
			value=combobox_data[i].name;
			break;
		}
	}
	return value;
}
//
function equivalentUnitFormatter(value,row,index){
	var combobox_data = contract_sales_goods_detail_equivalent_unit.combobox('getData');
	for(var i=0,length=combobox_data.length;i<length;i++){
		if(combobox_data[i].id==value){
			value=combobox_data[i].name;
			break;
		}
	}
	return value;
}

/**
 * 添加销售合同商品列表
 */
function insertContractSalesGoodsDetailGrd(){
	
}
/**
 * 设置销售合同商品列表明细页签
 *
 **/
function setContractSalesGoodsGrdTab(row_data){
	contract_sales_goods_detail_grd.datagrid('loadData',{ total: 0, rows: []});
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
					addTargetDataGridRowData($('#contract_sales_goods_detail_grd'),row_data,0);
					//2.将数据添加到memcahed中
					var memcached_url = '${path}/contract/manager/sales_contract_product_info_memcache.html';//销售合同商品列表
					addFormatterData2Memecached(memcached_url,d);
					$('#contract_sales_goods_detail_grd').datagrid('acceptChanges');
				});
				//3.计算
				setCalculateTotalAmount();
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
		priceUnit:parseFloat(_data.priceUnit)/100,//包装单位单价
		equivalentUnit:_data.equivalentUnit,//折合单位
		priceEu:parseFloat(_data.priceEu)/100,//折合单位单价
		quantityEuPerUnit:_data.quantityEuPerUnit,//包装单位折合数量
		quantityEu:_data.quantityEu,//折合数量
		quantityUnit:_data.quantityUnit,//数量
		amount:parseFloat(_data.amount)/100,//金额
		mome:_data.memo//备注
	};
	return json;
}

function setCalculateTotalAmount(){
	//计算总金额
	var rows=contract_sales_goods_detail_grd.datagrid('getRows');
	contract_sales_total_amount=0;
	if(rows.length==0){
		contract_sales_total_amount=0;
	}
	for(var i=0;i<rows.length;i++){
		contract_sales_total_amount+=parseFloat(rows[i].amount)*100;
	}
	$('#contract_sales_base_total_amount').val(parseFloat(contract_sales_total_amount/100));
	$('#contract_sales_pay_detail_total_amount').val($('#contract_sales_base_total_amount').val());
	//转换为大写
	toUpper($('#contract_sales_base_total_amount'),$('#contract_sales_base_upper_rmb'));
}
</script>
<div id="contract_sales_goods_detail_grd"></div>