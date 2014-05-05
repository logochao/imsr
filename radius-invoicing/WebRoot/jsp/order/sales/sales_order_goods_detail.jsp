<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
var sales_order_goods_detail_spec_type = null;//规格信息
var sales_order_goods_detail_spec_unit = null;//包装单位
var sales_order_goods_grd_form_equivalent_unit =null;//折合单位
var sales_order_total_amount =0;//合同总金额
$(function(){
	//规格信息
	sales_order_goods_detail_spec_type=$('#sales_order_goods_detail_spec_type').combobox({
		url:'${path}/common/system/spec_type_list.html',//规格单位数据集
 		valueField: 'specId',
		textField: 'specName',
		onSelect:function(record){
			//1.设置包装单位
			sales_order_goods_detail_spec_unit.combobox('setText',record.specUnitName);
			sales_order_goods_detail_spec_unit.combobox('setValue',record.specUnit);
			//2.设置折合单位
			sales_order_goods_detail_equivalent_unit.combobox('setText',record.equivalentUnitName);
			sales_order_goods_detail_equivalent_unit.combobox('setValue',record.equivalentUnit);
			//3.折合数量
			$('#sales_order_goods_detail_quantity_eu_per_unit').val(record.quantityEuUnit);
			//4.折合数量
		},
		editable:false
	});
	//包装单位
	sales_order_goods_detail_spec_unit = $('#sales_order_goods_detail_spec_unit').combobox({
		url:'${path}/common/system/category_code_list.html?parentId=1400',//计量单位数据集
 		valueField: 'id',
		textField: 'name',
		onLoadSuccess:function(){
			var target = $(this);
			target.combobox("setValue",target.val());
			target.combobox('disable');
		}
	});
	//折合单位
	sales_order_goods_detail_equivalent_unit = $('#sales_order_goods_detail_equivalent_unit').combobox({
		url:'${path}/common/system/category_code_list.html?parentId=1400',//计量单位数据集
 		valueField: 'id',
		textField: 'name',
		onLoadSuccess:function(){
			var target = $(this);
			target.combobox("setValue",target.val());
			target.combobox('disable');
		}
	});
	//数量
	$('#sales_order_goods_detail_quantity_unit').numberspinner({
		value:0,
		min:0,
 		editable:false,
 		onChange:function(value){//通过数量计算出金额
 			var sales_order_goods_detail_price=parseFloat($('#sales_order_goods_detail_price').val());
 			$('#sales_order_goods_detail_amount').val(sales_order_goods_detail_price*parseInt(value));	
 			//折合数量=包装单位折合数量*数量
 			$('#sales_order_goods_detail_quantity_eu').val(parseInt($('#sales_order_goods_detail_quantity_eu_per_unit').val())*parseInt(value));
 		}
	});
	//添加商品信息按钮
	$('#contract_sales_goods_grd_add_btn').on('click',function(){
		//1.没有选择商品信息
		if($('#sales_order_goods_detail_id').val().length<=0){
			$.messager.alert('提示','请选择商品信息...','error');
			return ;
		}
		//2.没有选择规格信息
		if(sales_order_goods_detail_spec_type.combobox('getValue').length<=0){
			$.messager.alert('提示','请选择规格信息...','error');
			return;
		}
		if($('#sales_order_base_id').val().length==0){
			$.messager.alert('提示','请新建按钮,构建新的销售合同...','error');
			return;
		}
		if($(this).linkbutton('options').disabled){
			return ;
		}
		var row_data=getSalesOrderGoodsGrdFormatter()//当前需要处理的数据
		setSalesOrderGoodsGrd(row_data);//该方法是判断是否是添加还是更新
		sales_order_goods_detail_grd.datagrid('acceptChanges');//接受改变
		calculateTotalAmount();
	});
	
	//销售商品查询对话框按钮
	$('#sales_order_goods_detail_btn').on('click',function(){
		sales_order_goods_detail_product_dialog.dialog('open');
	});
	
	$('#contract_sales_goods_grd_delete_btn').on('click',function(){
		if(!$(this).linkbutton('options').disabled){//表示按钮没有禁用的时候	
	 		var rows=sales_order_goods_detail_grd.datagrid('getSelections');
	 		if(rows.length==0){
	 			$.messager.alert('提示','请选择待删除的行...','info');
	 			return ;
	 		}
 			$.messager.confirm('提示','是否确定要删除当前已经选择的行信息',function(r){
 				if(r){
 					var array=[];//带删除的数组
 					for(var i=0;i<rows.length;i++){
		 				//1.删除对应的datagrid
		 				array.push(rows[i].goodsId);
		 			}
		 			//2.删除其他的页签内容(暂时不处理)
		 			//console.info(array);
		 			//3.将内存中的缓存数据删除
		 			if(array.length>0){
		 				removeProudctInfoMemcached(array);
		 				calculateTotalAmount();
		 			}
 				}
 			});
 		}
	});
});

/**
* 将销售合同中的商品信息从memcache中进行删除
**/
function removeProudctInfoMemcached(array){
	$.ajax({
		url:'${path}/order/manager/salesorder/order_product_info_remove_memcached.html',
		method:'POST',
		data:{
			orderId:$('#sales_order_base_id').val(),//销售订货单编号
			memo:array.join(',')
		},
		success:function (data){//2.将dategrid的行数据进行删除操作
			if(data.success){
				/*
				var rows=$('#sales_order_goods_detail_product_grd').datagrid('getSelections');
				for(var i=0;i<rows.length;i++){
					var index=$('#sales_order_goods_detail_product_grd').datagrid('getRowIndex',rows[i]);
					console.info(index);
					$('#sales_order_goods_detail_product_grd').datagrid('deleteRow',index);
					$('#sales_order_goods_detail_product_grd').datagrid('acceptChanges');//接受改变
				}*/
				
				var rows=sales_order_goods_detail_product_grd.datagrid('getSelections');
				console.info(rows.length);
				for(var i=0;i<rows.length;i++){
					var index=sales_order_goods_detail_product_grd.datagrid('getRowIndex',rows[i]);
					sales_order_goods_detail_product_grd.datagrid('deleteRow',index);
					sales_order_goods_detail_product_grd.datagrid('acceptChanges');//接受改变
				}
				calculateTotalAmount();
			}
		},
		error: function(data){
			$.messager.alert('提示','处理缓存失败...',error);
		}
	});
}


/**
 * 获取销售订单商品列表需要的数据格式
 * @return json 
 **/
function getSalesOrderGoodsGrdFormatter(){
	 var json={
		goodsId				:$('#sales_order_goods_detail_id').val(),//商品编号
   		goodsName			:$('#sales_order_goods_detail_name').val(),//商品名称
		specId				:sales_order_goods_detail_spec_type.combobox('getValue'),//规格
		unit				:sales_order_goods_detail_spec_unit.combobox('getValue'),//包装单位
		priceUnit			:$('#sales_order_goods_detail_price').val(),//包装单位单价
		equivalentUnit		:sales_order_goods_detail_equivalent_unit.combobox('getValue'),//折合单位
		priceEu				:$('#sales_order_goods_detail_price_convert_unit').val(),//折合单位单价
		quantityEuPerUnit	:$('#sales_order_goods_detail_quantity_eu_per_unit').val(),//包装单位折合数量
		quantityEu			:$('#sales_order_goods_detail_quantity_eu').val(),//折合数量
		quantityUnit		:$('#sales_order_goods_detail_quantity_unit').val(),//数量
		amount				:$('#sales_order_goods_detail_amount').val(),//金额
		mome				:$('#sales_order_goods_detail_mome').val(),//备注
	 };
	 return json;
}

/**
 *重置销售订单商品列表
 *@params{} row_data
 **/
function resetSalesOrderGoodsDetail(row_data){
	$('#sales_order_goods_detail_id').val(row_data.id);//商品编号
	$('#sales_order_goods_detail_name').val(row_data.name);//商品名称
	sales_order_goods_detail_spec_type.combobox('setText','');//规格
	sales_order_goods_detail_spec_type.combobox('setValue','');//规格
	sales_order_goods_detail_spec_unit.combobox('setText','');//包装单位
	sales_order_goods_detail_spec_unit.combobox('setValue','');//包装单位
	$('#sales_order_goods_detail_price').val('0.00');//包装单位单价
	sales_order_goods_detail_equivalent_unit.combobox('setText','');//折合单位
	sales_order_goods_detail_equivalent_unit.combobox('setValue','');//折合单位
	$('#sales_order_goods_detail_price_convert_unit').val('');//折合单位单价
	$('#sales_order_goods_detail_quantity_eu_per_unit').val('');//包装单位折合数量
	$('#sales_order_goods_detail_quantity_eu').val('');//折合数量
	$('#sales_order_goods_detail_quantity_unit').val('');//数量
	$('#sales_order_goods_detail_amount').val('');//金额
	$('#sales_order_goods_detail_mome').val('');//备注
}

function calculateTotalAmount(){
	//计算总金额
	var rows=sales_order_goods_detail_grd.datagrid('getRows');
	sales_order_total_amount=0;
	if(rows.length==0){
		sales_order_total_amount=0;
	}
	for(var i=0;i<rows.length;i++){
		sales_order_total_amount+=parseFloat(rows[i].amount)*100;
	}
	$('#sales_order_base_total_amount').val(parseFloat(sales_order_total_amount/100));
	//转换为大写
	toUpper($('#sales_order_base_total_amount'),$('#sales_order_base_upper_total_amount'));
}

/**
 *清空销售商品明细页签
 **/
function clearSalesOrderGoodsDetailTab(){
	$('#sales_order_goods_detail_id').val('');//商品编号
	$('#sales_order_goods_detail_name').val('');//商品名称
	com.radius.combobox.setelement(sales_order_goods_detail_spec_type,'setText','');//规格
	com.radius.combobox.setelement(sales_order_goods_detail_spec_type,'setValue','');//规格
	com.radius.combobox.setelement(sales_order_goods_detail_spec_unit,'setText','');//包装单位
	com.radius.combobox.setelement(sales_order_goods_detail_spec_unit,'setValue','');//包装单位
	$('#sales_order_goods_detail_price').val('0.00');//包装单位单价
	com.radius.combobox.setelement(sales_order_goods_detail_equivalent_unit,'setText','');//折合单位
	com.radius.combobox.setelement(sales_order_goods_detail_equivalent_unit,'setValue','');//折合单位
	$('#sales_order_goods_detail_price_convert_unit').val('');//折合单位单价
	$('#sales_order_goods_detail_quantity_eu_per_unit').val('');//包装单位折合数量
	$('#sales_order_goods_detail_quantity_eu').val('');//折合数量
	$('#sales_order_goods_detail_quantity_unit').val('');//数量
	$('#sales_order_goods_detail_amount').val('');//金额
	$('#sales_order_goods_detail_mome').val('');//备注
}


//-->
</script>
<table class="table" style="width: 99.8%;">
	<tr>
		<th>商品</th>
		<td colspan="3">
			<input class="easyui-validatebox" type="text" style="width: 300px;border:1px solid #95B8E7;float: left;" id="sales_order_goods_detail_name" data-options="" readonly="readonly"/>
			<input type="hidden" id="sales_order_goods_detail_id"/>
			<a id="sales_order_goods_detail_btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>规格</th>
		<td>
			<input class="easyui-validatebox" type="text" style="border:1px solid #95B8E7;" id="sales_order_goods_detail_spec_type"/>
		</td>
		<th>包装单位单价</th>
		<td>
			<input class="easyui-validatebox"  id="sales_order_goods_detail_price" style="border:1px solid #95B8E7;float: left;" data-options="" value="0.00"/>
			<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-font'"  plain="true"></a>
		</td>
	</tr>
	<tr>
		<th>包装单位折合数量</th>
		<td>
			<input id="sales_order_goods_detail_quantity_eu_per_unit" style="background:#eee;border:1px solid #95B8E7;" value="0"/>
		</td>
		<th>折合单位单价</th>
		<td>
			<input class="easyui-validatebox" value="0.00"  id="sales_order_goods_detail_price_convert_unit" style="border:1px solid #95B8E7;" data-options="validType:'numberic',missingMessage:'请输入折合单价',invalidMessage:'请输入正确的格式'"/>
		</td>
		<th>数量</th>
		<td>
			<input style="width: 100px;"  id="sales_order_goods_detail_quantity_unit"/>
			<input  id="sales_order_goods_detail_spec_unit" style="background:#eee;width: 40px;border:1px solid #95B8E7;" readonly="readonly" value="1401"/><%--包装单位(规格)--%>
		</td>
		<th>折合数量</th>
		<td>
			<input style="width: 100px;background:#eee;border:1px solid #95B8E7;"   id="sales_order_goods_detail_quantity_eu" readonly="readonly"/>
			<input  id="sales_order_goods_detail_equivalent_unit" style="background:#eee;width: 40px;border:1px solid #95B8E7;" readonly="readonly" value="1401"/><%--折合单位--%>
		</td>
	</tr>
	<tr>
		<th>金额</th>
		<td>
			<input class="easyui-validatebox"  id="sales_order_goods_detail_amount" style="border:1px solid #95B8E7;" data-options="" value="0.00" readonly="readonly"/>
		</td>
		<th>备注</th>
		<td colspan="2">
			<input class="easyui-validatebox" style="width: 250px;border:1px solid #95B8E7;"  id="sales_order_goods_detail_mome" data-options=""/>
		</td>
		<th style="text-align: center;" colspan="2"><input type="checkbox"/> 加入后不置空</th>
		<td>
			<a id="contract_sales_goods_grd_add_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" plain="true">加入(A)</a>
			<a id="contract_sales_goods_grd_delete_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-remove'" plain="true">删除(D)</a>
		</td>
	</tr>
</table>

<jsp:include flush="true" page="sales_order_goods_detail_product.jsp"></jsp:include>