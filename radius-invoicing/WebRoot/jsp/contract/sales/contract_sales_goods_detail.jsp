<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
var contract_sales_goods_detail_spec_type = null;//规格信息
var contract_sales_goods_detail_spec_unit = null;
var contract_sales_goods_detail_equivalent_unit = null;
var contract_sales_total_amount = 0;//交易金额
$(function(){
	//规格信息
	contract_sales_goods_detail_spec_type=$('#contract_sales_goods_detail_spec_type').combobox({
		url:'${path}/common/system/spec_type_list.html',//规格单位数据集
 		valueField: 'specId',
		textField: 'specName',
		onSelect:function(record){
			//1.设置包装单位
			contract_sales_goods_detail_spec_unit.combobox('setText',record.specUnitName);
			contract_sales_goods_detail_spec_unit.combobox('setValue',record.specUnit);
			//2.设置折合单位
			contract_sales_goods_detail_equivalent_unit.combobox('setText',record.equivalentUnitName);
			contract_sales_goods_detail_equivalent_unit.combobox('setValue',record.equivalentUnit);
			//3.折合数量
			$('#contract_sales_goods_detail_quantity_eu_per_unit').val(record.quantityEuUnit);
			//4.折合数量
		},
		editable:false
	});
	//包装单位
	contract_sales_goods_detail_spec_unit = $('#contract_sales_goods_detail_spec_unit').combobox({
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
	contract_sales_goods_detail_equivalent_unit = $('#contract_sales_goods_detail_equivalent_unit').combobox({
		url:'${path}/common/system/category_code_list.html?parentId=1400',//计量单位数据集
 		valueField: 'id',
		textField: 'name',
		onLoadSuccess:function(){
			var target = $(this);
			target.combobox("setValue",target.val());
			target.combobox('disable');
		}
	});
	//折合数量
	
	//商品对话框
	$('#constract_sales_goods_grd_form_btn').on('click',function(){
		contract_sales_goods_detail_product_dialog.dialog('open');
	});
	//数量
	$('#contract_sales_goods_detail_quantity_unit').numberspinner({
		value:0,
		min:0,
 		editable:false,
 		onChange:function(value){//通过数量计算出金额
 			var contract_sales_goods_detail_price=parseFloat($('#contract_sales_goods_detail_price').val());
 			$('#contract_sales_goods_detail_amount').val(contract_sales_goods_detail_price*parseInt(value));	
 			//折合数量=包装单位折合数量*数量
 			$('#contract_sales_goods_detail_quantity_eu').val(parseInt($('#contract_sales_goods_detail_quantity_eu_per_unit').val())*parseInt(value));
 		}
	});
	
	//添加商品信息按钮
	$('#contract_sales_goods_grd_add_btn').on('click',function(){
		//1.没有选择商品信息
		if($('#contract_sales_goods_grd_form_id').val().length<=0){
			$.messager.alert('提示','请选择商品信息...','error');
			return ;
		}
		//2.没有选择规格信息
		if(contract_sales_goods_detail_spec_type.combobox('getValue').length<=0){
			$.messager.alert('提示','请选择规格信息...','error');
			return;
		}
		if($('#constract_sales_base_id').val().length==0){
			$.messager.alert('提示','请新建按钮,构建新的销售合同...','error');
			return;
		}
		var rows=contract_sales_goods_detail_grd.datagrid('getRows');
		if(rows.length==0){
			
			addDataGridRow();
			contract_sales_goods_detail_grd.datagrid('acceptChanges');
			calculateTotalAmount();
		}else if(rows.length>0){
			var isExist=false;
			var row=null;
			var row_index=0;
			for(var i=0;i<rows.length;i++){
				row=rows[i];
				if(row.goodsId==$('#contract_sales_goods_grd_form_id').val()){//说明商品相关
					isExist=true;
					row_index=i;
					break;
				}
			}
			if(isExist){//更新datagrid列
				//1.修改datagrid中的数据
				var quantityUnit=parseInt(row.quantityUnit)+parseInt($('#contract_sales_goods_detail_quantity_unit').val());
				var quantityEuPerUnit=parseInt(row.quantityEuPerUnit)+parseInt($('#contract_sales_goods_detail_quantity_eu_per_unit').val());
				var amount=(parseFloat($('#contract_sales_goods_detail_amount').val())*100+parseFloat(row.amount)*100)/100;
				var goodsId=contract_sales_goods_detail_grd.datagrid('selectRow',row_index).goodsId;//商品编号
				contract_sales_goods_detail_grd.datagrid('updateRow',{
					index:row_index,
					row:{
						quantityUnit		:quantityUnit,//数量
						quantityEuPerUnit	:quantityEuPerUnit,//包装单位折合数量
						amount				:amount//金额
					}
				});
				//2.更新内存中的数据 
				updateProuctInfoMemcache(amount*100,quantityUnit,quantityEuPerUnit,goodsId);
				
			}else{//添加一列
				addDataGridRow();
			}
			calculateTotalAmount();
		}
	});
	
	//啥才能
	$('#contract_sales_goods_grd_delete_btn').on('click',function(){//datagrid delete
 		var rows=contract_sales_goods_detail_grd.datagrid('getSelections');
 		if(rows.length>0){
 			$.messager.confirm('提示','是否确定要删除当前已经选择的行信息',function(r){
 				if(r){
 					var array=[];//带删除的数组
 					for(var i=0;i<rows.length;i++){
		 				//1.删除对应的datagrid
		 				//contract_sales_goods_grd.datagrid('deleteRow',i);
		 				array.push(rows[i].goodsId);
		 			}
		 			//2.删除其他的页签内容(暂时不处理)
		 			console.info(array);
		 			//3.将内存中的缓存数据删除
		 			if(array.length>0){
		 				removeProudctInfoMemcache(array);
		 			}
 				}
 			});
 		}else{
 			$.messager.alert('提示','请选择待删除的行...','info');
 		}
 		
 	});
});

/**
* 将销售合同商品信息更新到memcache中
* @param amount  金额
* @param quantityUnit 数量
*/
function updateProuctInfoMemcache(amount,quantityUnit,quantityEuPerUnit,goodsId){
	$.ajax({
		url:'${path}/contract/manager/sales_contract_product_info_memcache.html',//销售合同商品列表
		method:'POST',//请求方式
		data:{
			contractId:$('#constract_sales_sale_base_id').val(),//合同编号
			goodsId:goodsId,//商品编号
			quantityUnit:quantityUnit,
			amount:amount
		},//参数
		success:function (data){
			console.info(data);
		},
		error:function(data){
			$.messager.alert('提示','与服务端通讯失败...','error');
		}
	});
}

//添加商品信息
function addDataGridRow(){
	//1.加入数据到datagrid
	var row_data =getContractSalesGoodsDetailProductGrdFormatter();
	addTargetDataGridRowData(contract_sales_goods_detail_grd,row_data,0);//添加数据
	var memcached_url = '${path}/contract/manager/sales_contract_product_info_memcache.html';//销售合同商品列表
	var memcached_data= getContractSalesGoodsInfo(row_data);
	//2.将数据保存到内存中
	addFormatterData2Memecached(memcached_url,memcached_data);
}



/**
 * 获取销售合同商品信息
 * @return json
 **/
function getContractSalesGoodsDetailProductGrdFormatter(){
	 var json={
		goodsId				:$('#contract_sales_goods_grd_form_id').val(),//商品编号
   		goodsName			:$('#contract_sales_goods_grd_form_name').val(),//商品名称
		specId				:contract_sales_goods_detail_spec_type.combobox('getValue'),//规格
		unit				:contract_sales_goods_detail_spec_unit.combobox('getValue'),//包装单位
		priceUnit			:$('#contract_sales_goods_detail_price').val(),//包装单位单价
		equivalentUnit		:contract_sales_goods_detail_equivalent_unit.combobox('getValue'),//折合单位
		priceEu				:$('#contract_sales_goods_detail_price_convert_unit').val(),//折合单位单价
		quantityEuPerUnit	:$('#contract_sales_goods_detail_quantity_eu_per_unit').val(),//包装单位折合数量
		quantityEu			:$('#contract_sales_goods_detail_quantity_eu').val(),//折合数量
		quantityUnit		:$('#contract_sales_goods_detail_quantity_unit').val(),//数量
		amount				:$('#contract_sales_goods_detail_amount').val(),//金额
		mome				:$('#contract_sales_goods_detail_mome').val(),//备注
	 };
	 return json;
}

/**
 *获取符合后台数据的数据格式
 *@params{} row_data 
 *@return   json
 **/
function getContractSalesGoodsInfo(row_data){
	var json ={
		contractId			:$('#constract_sales_base_id').val(),//合同编号
		goodsId				:row_data.goodsId,//商品编号
   		goodsName			:row_data.goodsName,//商品名称
		specId				:contract_sales_goods_detail_spec_type.combobox('getValue'),//规格
		unit				:contract_sales_goods_detail_spec_unit.combobox('getValue'),//包装单位
		priceUnit			:parseFloat(row_data.priceUnit)*100,//包装单位单价
		equivalentUnit		:contract_sales_goods_detail_equivalent_unit.combobox('getValue'),//折合单位
		priceEu				:parseFloat(row_data.priceEu)*100,//折合单位单价
		quantityEuPerUnit	:row_data.quantityEuPerUnit,//包装单位折合数量
		quantityEu			:row_data.quantityEu,//折合数量
		quantityUnit		:row_data.quantityUnit,//数量
		amount				:parseFloat(row_data.amount)*100,//金额
		mome				:row_data.mome,//备注
	};
	return json ;
}
/**
 * 清空销售合同商品明细表单
 *@params{}  goods_id
 *@params{}  goods_name
 **/
function resetContractSalesGoodsDetail(goods_id,goods_name){
		$('#contract_sales_goods_grd_form_id').val(goods_id);//商品编号
		$('#contract_sales_goods_grd_form_name').val(goods_name);//商品名称
		contract_sales_goods_detail_spec_type.combobox('setText','');//规格
		contract_sales_goods_detail_spec_type.combobox('setValue','');//规格
		contract_sales_goods_detail_spec_unit.combobox('setText','');//包装单位
		contract_sales_goods_detail_spec_unit.combobox('setValue','');//包装单位
		$('#contract_sales_goods_detail_price').val('0.00');//包装单位单价
		contract_sales_goods_detail_equivalent_unit.combobox('setText','');//折合单位
		contract_sales_goods_detail_equivalent_unit.combobox('setValue','');//折合单位
		$('#contract_sales_goods_detail_price_convert_unit').val('');//折合单位单价
		$('#contract_sales_goods_detail_quantity_eu_per_unit').val('');//包装单位折合数量
		$('#contract_sales_goods_detail_quantity_eu').val('');//折合数量
		$('#contract_sales_goods_detail_quantity_unit').val('');//数量
		$('#contract_sales_goods_detail_amount').val('');//金额
		$('#contract_sales_goods_detail_mome').val('');//备注
}

function calculateTotalAmount(){
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
	$('#contract_sales_pay_detail_surplus_amount').val($('#contract_sales_base_total_amount').val());
	//转换为大写
	toUpper($('#contract_sales_base_total_amount'),$('#contract_sales_base_upper_rmb'));
}

/**
* 将销售合同中的商品信息从memcache中进行删除
**/
function removeProudctInfoMemcache(array){
	$.ajax({
		url:'${path}/contract/manager/salescontract/sales_contract_product_info_remove_memcache.html',
		method:'POST',
		data:{
			contractId:$('#constract_sales_base_id').val(),//合同编号
			memo:array.join(',')
		},
		success:function (data){//2.将dategrid的行数据进行删除操作
			if(data.success){
				var rows=contract_sales_goods_detail_grd.datagrid('getSelections');
				for(var i=0;i<rows.length;i++){
					var index=contract_sales_goods_detail_grd.datagrid('getRowIndex',rows[i]);
					contract_sales_goods_detail_grd.datagrid('deleteRow',index);
					contract_sales_goods_detail_grd.datagrid('acceptChanges');//接受改变
				}
				calculateTotalAmount();
			}
		},
		error: function(data){
			$.messager.alert('提示','与服务端通讯失败...','error');
		}
	});
}

/**
 *清空销售合同商品明细
 *
 **/
function clearContractSalesGoodsDetail(){

	//1.清空表格
	contract_sales_goods_detail_grd.datagrid('loadData',{ total: 0, rows: []});
	//2.
	$("input[id^='contract_sales_goods_detail_']").each(function(e){
			$(this).val('');
	})
	
	$('#contract_sales_goods_grd_form_name').val('');
	$('#contract_sales_goods_grd_form_id').val('');
}
</script>
<table class="table" style="width: 99.8%;">
	<tr>
		<th>商品</th>
		<td colspan="3">
			<input class="easyui-validatebox" type="text" style="width: 300px;border:1px solid #95B8E7;float: left;" id="contract_sales_goods_grd_form_name" name="contract_sales_goods_grd_name" data-options="" readonly="readonly"/>
			<input type="hidden" id="contract_sales_goods_grd_form_id"/>
			<a id="constract_sales_goods_grd_form_btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>规格</th>
		<td>
			<input class="easyui-validatebox" type="text" style="border:1px solid #95B8E7;" id="contract_sales_goods_detail_spec_type"/>
		</td>
		<th>包装单位单价</th>
		<td>
			<input class="easyui-validatebox"  id="contract_sales_goods_detail_price" style="border:1px solid #95B8E7;float: left;" data-options="" value="0.00"/>
			<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-font'"  plain="true"></a>
		</td>
	</tr>
	<tr>
		<th>包装单位折合数量</th>
		<td>
			<input id="contract_sales_goods_detail_quantity_eu_per_unit" style="background:#eee;border:1px solid #95B8E7;" value="0"/>
		</td>
		<th>折合单位单价</th>
		<td>
			<input class="easyui-validatebox" value="0.00"  id="contract_sales_goods_detail_price_convert_unit" style="border:1px solid #95B8E7;" data-options="validType:'numberic',missingMessage:'请输入折合单价',invalidMessage:'请输入正确的格式'"/>
		</td>
		<th>数量</th>
		<td>
			<input style="width: 100px;"  id="contract_sales_goods_detail_quantity_unit"/>
			<input  id="contract_sales_goods_detail_spec_unit" style="background:#eee;width: 40px;border:1px solid #95B8E7;" readonly="readonly" value="1401"/><%--包装单位(规格)--%>
		</td>
		<th>折合数量</th>
		<td>
			<input style="width: 100px;background:#eee;border:1px solid #95B8E7;"   id="contract_sales_goods_detail_quantity_eu" readonly="readonly"/>
			<input  id="contract_sales_goods_detail_equivalent_unit" style="background:#eee;width: 40px;border:1px solid #95B8E7;" readonly="readonly" value="1401"/><%--折合单位--%>
		</td>
	</tr>
	<tr>
		<th>金额</th>
		<td>
			<input class="easyui-validatebox"  id="contract_sales_goods_detail_amount" style="border:1px solid #95B8E7;" data-options="" value="0.00" readonly="readonly"/>
		</td>
		<th>备注</th>
		<td colspan="2">
			<input class="easyui-validatebox" style="width: 250px;border:1px solid #95B8E7;"  id="contract_sales_goods_detail_mome" data-options=""/>
		</td>
		<th style="text-align: center;" colspan="2"><input type="checkbox"/> 加入后不置空</th>
		<td>
			<a id="contract_sales_goods_grd_add_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" plain="true">加入(A)</a>
			<a id="contract_sales_goods_grd_delete_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-remove'" plain="true">删除(D)</a>
		</td>
	</tr>
</table>
<jsp:include flush="true" page="contract_sales_goods_detail_product.jsp"></jsp:include>
