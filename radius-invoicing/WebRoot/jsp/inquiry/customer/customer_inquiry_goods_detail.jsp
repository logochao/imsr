<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
var customer_inquiry_goods_detail_spec_type = null;//规格信息
var customer_inquiry_goods_detail_spec_unit = null;//包装单位
var customer_inquiry_goods_grd_form_equivalent_unit =null;//折合单位
$(function(){
	//规格信息
	customer_inquiry_goods_detail_spec_type=$('#customer_inquiry_goods_detail_spec_type').combobox({
		url:'${path}/common/system/spec_type_list.html',//规格单位数据集
 		valueField: 'specId',
		textField: 'specName',
		onSelect:function(record){
			//1.设置包装单位
			customer_inquiry_goods_detail_spec_unit.combobox('setText',record.specUnitName);
			customer_inquiry_goods_detail_spec_unit.combobox('setValue',record.specUnit);
			//2.设置折合单位
			customer_inquiry_goods_detail_equivalent_unit.combobox('setText',record.equivalentUnitName);
			customer_inquiry_goods_detail_equivalent_unit.combobox('setValue',record.equivalentUnit);
			//3.折合数量
			$('#customer_inquiry_goods_detail_quantity_eu_per_unit').val(record.quantityEuUnit);
			//4.折合数量
		},
		editable:false
	});
	//包装单位
	customer_inquiry_goods_detail_spec_unit = $('#customer_inquiry_goods_detail_spec_unit').combobox({
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
	customer_inquiry_goods_detail_equivalent_unit = $('#customer_inquiry_goods_detail_equivalent_unit').combobox({
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
	$('#customer_inquiry_goods_detail_quantity_unit').numberspinner({
		value:0,
		min:0,
 		editable:false,
 		onChange:function(value){//
 			//折合数量=包装单位折合数量*数量
 			$('#customer_inquiry_goods_detail_quantity_eu').val(parseInt($('#customer_inquiry_goods_detail_quantity_eu_per_unit').val())*parseInt(value));
 		}
	});
	
	//销售商品查询对话框按钮
	$('#customer_inquiry_goods_detail_btn').on('click',function(){
		customer_inquiry_goods_detail_product_dialog.dialog('open');
	});
	
	
	//添加商品信息按钮
	$('#customer_inquiry_goods_grd_add_btn').on('click',function(){
		if($('#customer_inquiry_base_id').val().length==0){
			$.messager.alert('提示','请新建按钮,构建新的销售合同...','error');
			return;
		}
		//1.没有选择商品信息
		if($('#customer_inquiry_goods_detail_id').val().length<=0){
			$.messager.alert('提示','请选择商品信息...','error');
			return ;
		}
		//2.没有选择规格信息
		if(customer_inquiry_goods_detail_spec_type.combobox('getValue').length<=0){
			$.messager.alert('提示','请选择规格信息...','error');
			return;
		}
		if($(this).linkbutton('options').disabled){
			return ;
		}
		var row_data=getCustomerInquiryGoodsGrdFormatter()//当前需要处理的数据
		setCustomerInquiryGoodsGrd(row_data);//该方法是判断是否是添加还是更新
		customer_inquiry_goods_detail_grd.datagrid('acceptChanges');//接受改变
	});
	
	$('#customer_inquiry_goods_grd_delete_btn').on('click',function(){
		if(!$(this).linkbutton('options').disabled){//表示按钮没有禁用的时候	
	 		var rows=customer_inquiry_goods_detail_grd.datagrid('getSelections');
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
		 			//2.将内存中的缓存数据删除
		 			if(array.length>0){
		 				removeProudctInfoMemcached(array);
		 			}
 				}
 			});
 		}
	});
});

/**
 *重置销售询价商品列表
 *@params{} row_data
 **/
function resetCustomerInquiryGoodsDetail(row_data){
	$('#customer_inquiry_goods_detail_id').val(row_data.id);//商品编号
	$('#customer_inquiry_goods_detail_name').val(row_data.name);//商品名称
	customer_inquiry_goods_detail_spec_type.combobox('setValue','');//规格
	customer_inquiry_goods_detail_spec_unit.combobox('setValue','');//包装单位
	customer_inquiry_goods_detail_equivalent_unit.combobox('setValue','');//折合单位
	$('#customer_inquiry_goods_detail_quantity_eu_per_unit').val('0');//包装单位折合数量
	$('#customer_inquiry_goods_detail_quantity_eu').val(0);//折合数量
	$('#customer_inquiry_goods_detail_quantity_unit').numberspinner('setValue', 0);  
	//$('#customer_inquiry_goods_detail_quantity_unit').val(0);//数量
	$('#customer_inquiry_goods_detail_mome').val('');//备注
}


/**
 * 设置销售询价商品列表并将数据添加到内存中
 **/
function setCustomerInquiryGoodsGrd(row_data){
	var rows = customer_inquiry_goods_detail_grd.datagrid('getRows');//获取当前页所有数据行
	var url='${path}/inquiry/manager/salesInquiry/customer_inquiry_product_info_memcached.html';//缓存地址
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
			var quantity_unit=parseInt(row_data.quantityUnit)+parseInt(row.quantityUnit);
			//更新datagrid row 更新缓存
			var row_data_update={
				quantityUnit:quantity_unit//数量
			};
			updateCustomerInquiryGoodsGrdRow(url,row_data_update,goodsId,row_index);
			return ;
		}
	}
	addSalesInquiryGoods2CustomerInquiryGoodsGrd(row_data,url);
}

/**
 * 获取销售询价商品列表需要的数据格式
 * @return json 
 **/
function getCustomerInquiryGoodsGrdFormatter(){
	 var json={
		salesInquiryId			:$('#customer_inquiry_base_id').val(),//销售询价单编号
		goodsId					:$('#customer_inquiry_goods_detail_id').val(),//商品编号
		goodsName				:$('#customer_inquiry_goods_detail_name').val(),//商品名称
		specId					:customer_inquiry_goods_detail_spec_type.combobox('getValue'),//规格编码
		unit					:customer_inquiry_goods_detail_spec_unit.combobox('getValue'),//单位(规格)
		quantityUnit			:$('#customer_inquiry_goods_detail_quantity_unit').val(),//数量
		quantityEuPerUnit		:$('#customer_inquiry_goods_detail_quantity_eu_per_unit').val(),//包装单位折合数量
		quantityEu				:$('#customer_inquiry_goods_detail_quantity_eu').val(),//合数量
		//status				://状态
		memo					:$('#customer_inquiry_goods_detail_mome').val()//备注
	 };
	 return json;
}

/**
 *将数据添加到销售询价列表中
 *@param row_data
 *@param memcached_url 缓存地址
 **/
function addSalesInquiryGoods2CustomerInquiryGoodsGrd(row_data,memcached_url){
	//1.添加行数据
	
	addTargetDataGridRowData(customer_inquiry_goods_detail_grd,row_data,0);
	//2.将数据添加到缓存中
	addFormatterData2Memecached(memcached_url,row_data);
}

/**
 * 更新销售询价商品列表
 * @param  memcached_url 请求缓存的地址
 * @param  row_data      
 * @param  goodsId
 * @param  row_index     
 **/
function updateCustomerInquiryGoodsGrdRow(memcached_url,row_data,goodsId,row_index){
	//1.更新datagrid
	updateTargetDataGridRowData(customer_inquiry_goods_detail_grd,row_data,row_index);
	//2.更新memcached
	var memcached_data={
		purchaseOrderId:$('#customer_inquiry_base_id').val(),//销售订单编号
		goodsId:goodsId,//商品编号
		quantityUnit:quantityUnit
	};
	addFormatterData2Memecached(memcached_url,memcached_data);
}
/**
 * 设置销售询价商品列表
 **/
function setCustomerInquiryGoodsDetail(row_data){
	//1.获取商品列表
	var ajax_url='${path}/inquiry/manager/salesInquiry/customer_inquiry_goods_2_salesinquiryid.html';
	var ajax_data={salesInquiryId:row_data.salesInquiryId};
	//移除缓存内容
	customer_inquiry_goods_detail_grd.datagrid('loadData', {total: 0,rows:[]});
	removeFullCustomerInquiryGoodsGrd();
	//获取采购合同商品
	getCustomerInquiryGoodsDetail(ajax_url,ajax_data);
}

/**
 * 移除全部的datagrid数据
 **/
function removeFullCustomerInquiryGoodsGrd(){
	$.ajax({
		url:'${path}/inquiry/manager/salesInquiry/customer_inquiry_product_info_remove_memcached.html',//请求地址
		method:'POST',
		data:{
			salesInquiryId:$('#customer_inquiry_base_id').val(),//销售询价编号
			delete:true
		},
		success:function(r){
			if(r&&r.success){
				console.info(r.message);
			}
		},
		error:function(r){
			$.messager.alert('提示','与后台通讯失败...','error');
		}
	});
}


/**
* 将销售合同中的商品信息从memcache中进行删除
**/
function removeProudctInfoMemcached(array){
	$.ajax({
		url:'${path}/inquiry/manager/salesInquiry/customer_inquiry_product_info_remove_memcached.html',
		method:'POST',
		data:{
			salesInquiryId:$('#customer_inquiry_base_id').val(),//销售询价单编号
			memo:array.join(',')
		},
		success:function (data){//2.将dategrid的行数据进行删除操作
			if(data.success){
				var rows=customer_inquiry_goods_detail_grd.datagrid('getSelections');
				for(var i=0;i<rows.length;i++){
					var index=customer_inquiry_goods_detail_grd.datagrid('getRowIndex',rows[i]);
					customer_inquiry_goods_detail_grd.datagrid('deleteRow',index);
					customer_inquiry_goods_detail_product_grd.datagrid('acceptChanges');//接受改变
				}
			}
		},
		error: function(data){
			$.messager.alert('提示','处理缓存失败...',error);
		}
	});
}

/**
 * 通过条件查询相关商品明细列表
 **/
function getCustomerInquiryGoodsDetail(ajax_url,ajax_data){
	//1.通过ajax获取销售询价商品信息
	$.ajax({
		url:ajax_url,
		mehtod:'POST',
		data:ajax_data,
		success:function(r){
			if(r&&r.total>0){
				$.each(r.rows,function(index,d){
					//1.1 将数据格式化
					var row_data=getCustomerInquiryGoodsGrdRowFormatter(d);//将数据格式化
					//1.2 在数据列表中添加、在缓存中添加
					setCustomerInquiryGoodsGrd(row_data);
					$('#customer_inquiry_goods_detail_grd').datagrid('acceptChanges');//接受改变
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
function getCustomerInquiryGoodsGrdRowFormatter(_data){
  var json={
		salesInquiryId			:_data.salesInquiryId,//销售询价单编号
		goodsId					:_data.goodsId,//商品编号
		goodsName				:_data.goodsName,//商品名称
		specId					:_data.specId,//规格编码
		unit					:_data.unit,//单位(规格)
		quantityUnit			:_data.quantityUnit,//数量
		quantityEuPerUnit		:_data.quantityEuPerUnit,//包装单位折合数量
		//status				:_data.status,//状态
		memo					:_data.memo//备注
  };
  return json;
}


/**
 *清空销售商品明细页签
 **/
function clearCustomerInquiryGoodsDetail(){
	$('#customer_inquiry_goods_detail_id').val('');//商品编号
	$('#customer_inquiry_goods_detail_name').val('');//商品名称
	com.radius.combobox.setelement(customer_inquiry_goods_detail_spec_type,'setValue','');//规格
	com.radius.combobox.setelement(customer_inquiry_goods_detail_spec_unit,'setValue','');//包装单位
	com.radius.combobox.setelement(customer_inquiry_goods_detail_equivalent_unit,'setValue','');//折合单位
	$('#customer_inquiry_goods_detail_quantity_eu_per_unit').val(0);//包装单位折合数量
	$('#customer_inquiry_goods_detail_quantity_eu').val(0);//折合数量
	$('#customer_inquiry_goods_detail_quantity_unit').numberspinner('setValue', 0);  
	//$('#customer_inquiry_goods_detail_quantity_unit').val(0);//数量
	$('#customer_inquiry_goods_detail_mome').val('');//备注
}
//-->
</script>
<table class="table" style="width: 99.8%;">
	<tr>
		<th>商品</th>
		<td colspan="3">
			<input class="easyui-validatebox" type="text" style="width: 300px;border:1px solid #95B8E7;float: left;" id="customer_inquiry_goods_detail_name" data-options="" readonly="readonly"/>
			<input type="hidden" id="customer_inquiry_goods_detail_id"/>
			<a id="customer_inquiry_goods_detail_btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>规格</th>
		<td>
			<input class="easyui-validatebox" type="text" style="border:1px solid #95B8E7;" id="customer_inquiry_goods_detail_spec_type"/>
		</td>
	</tr>
	<tr>
		<th>包装单位折合数量</th>
		<td>
			<input id="customer_inquiry_goods_detail_quantity_eu_per_unit" style="background:#eee;border:1px solid #95B8E7;" value="0"/>
		</td>
		<th>数量</th>
		<td>
			<input style="width: 100px;"  id="customer_inquiry_goods_detail_quantity_unit"/>
			<input  id="customer_inquiry_goods_detail_spec_unit" style="background:#eee;width: 40px;border:1px solid #95B8E7;" readonly="readonly" value="1401"/><%--包装单位(规格)--%>
		</td>
		<th>折合数量</th>
		<td>
			<input style="width: 100px;background:#eee;border:1px solid #95B8E7;"   id="customer_inquiry_goods_detail_quantity_eu" readonly="readonly"/>
			<input  id="customer_inquiry_goods_detail_equivalent_unit" style="background:#eee;width: 40px;border:1px solid #95B8E7;" readonly="readonly" value="1401"/><%--折合单位--%>
		</td>
	</tr>
	<tr>
		<th>备注</th>
		<td colspan="2">
			<input type="hidden" id="customer_inquiry_goods_detail_amount" style="border:1px solid #95B8E7;" data-options="" value="0.00" readonly="readonly"/>
			<input class="easyui-validatebox" style="width: 350px;border:1px solid #95B8E7;"  id="customer_inquiry_goods_detail_mome" data-options=""/>
		</td>
		<th style="text-align: center;"><input type="checkbox"/> 加入后不置空</th>
		<td style="text-align: center;" colspan="2">
			<a id="customer_inquiry_goods_grd_add_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" plain="true">加入(A)</a>
			<a id="customer_inquiry_goods_grd_delete_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-remove'" plain="true">删除(D)</a>
		</td>
	</tr>
</table>
<jsp:include flush="true" page="customer_inquiry_goods_detail_product.jsp"></jsp:include>