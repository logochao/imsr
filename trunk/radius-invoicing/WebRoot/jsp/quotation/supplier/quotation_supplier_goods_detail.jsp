<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
var quotation_supplier_goods_detail_spec_type = null;//规格信息
var spec_unit_data={};
$(function(){
	getLoadQuotationSupplierGoodsDetailData();
	//规格信息
	quotation_supplier_goods_detail_spec_type=$('#quotation_supplier_goods_detail_spec_type').combobox({
		url:'${path}/common/system/spec_type_list.html',//规格单位数据集
 		valueField: 'specId',
		textField: 'specName',
		onSelect:function(record){
			$(spec_unit_data).each(function(index,obj) {
				var cach_type_text=quotation_supplier_base_cash_type.combobox("getText");
				if(record.specUnit==obj.id){
					$('#quotation_supplier_goods_detail_unit_text').val(cach_type_text+"/"+obj.name);
					$('#quotation_supplier_goods_detail_unit').val(record.specUnit);
				}
				if(record.equivalentUnit==obj.id){
					$('#quotation_supplier_goods_detail_equivalent_unit_text').val(cach_type_text+"/"+obj.name);
					$('#quotation_supplier_goods_detail_equivalent_unit').val(record.equivalentUnit);
				}
			});
			$('#quotation_supplier_goods_detail_quantity_eu_per_unit').val(record.quantityEuUnit);
		},
		editable:false
	});
	$('#quotation_supplier_goods_detail_price_unit_supply').on('focusout',function(){
		var value=parseFloat($(this).val())*100/parseFloat($('#quotation_supplier_goods_detail_quantity_eu_per_unit').val());
		$('#quotation_supplier_goods_detail_price_eu_supply').val(value/100);
	});
	
	//查询商品明细对话框
	$('#quotation_supplier_goods_detail_btn').on('click',function(){
		var success=validataSupplierInquiryBaseId();
		if(success){
			success=validataSupplierId()
		}	
		if(success){
			success=validataPurchaseInquiryId();
		}
		if(success){
			$('#quotation_supplier_goods_detail_product_goods_company_name').val($('#quotation_supplier_base_supplier_name').val());
			$('#quotation_supplier_goods_detail_product_goods_company_id').val($('#quotation_supplier_base_supplier_id').val());
			quotation_supplier_goods_detail_product_dialog.dialog('open');
		}
	});
	//添加商品信息
	$('#quotation_supplier_goods_grd_add_btn').on('click',function(){
		var success=validataSupplierInquiryBaseId(); 
		if(success){
			//1.没有选择商品信息
			if($('#quotation_supplier_goods_detail_id').val().length<=0){
				$.messager.alert('提示','请选择商品信息...','error');
				return ;
			}
			//2.没有选择规格信息
			if(quotation_supplier_goods_detail_spec_type.combobox('getValue').length<=0){
				$.messager.alert('提示','请选择规格信息...','error');
				return;
			}
			if($(this).linkbutton('options').disabled){
				return ;
			}
			var row_data=getSupplierQuotationGoodsGrdFormatter()//当前需要处理的数据
			setSupplierQuotationGoodsGrd(row_data);//该方法是判断是否是添加还是更新
			quotation_supplier_goods_detail_grd.datagrid('acceptChanges');//接受改变
		}
	});
	
	//移除供应商报价商品信息
	$('#quotation_supplier_goods_grd_delete_btn').on('click',function(){
		if(!$(this).linkbutton('options').disabled){//表示按钮没有禁用的时候	
	 		var rows=quotation_supplier_goods_detail_grd.datagrid('getSelections');
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
 * 设置销售询价商品列表并将数据添加到内存中
 **/
function setSupplierQuotationGoodsGrd(row_data){
	var rows = quotation_supplier_goods_detail_grd.datagrid('getRows');//获取当前页所有数据行
	var url='${path}/quotation/manager/supplierQuotation/supplier_quotation_product_info_memcached.html';//缓存地址
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
			$.messager.alert('提示','请不要添加相同的商品报价...','error');
		}
	}
	addSalesInquiryGoods2CustomerInquiryGoodsGrd(row_data,url);
}

/**
 *将数据添加到销售询价列表中
 *@param row_data
 *@param memcached_url 缓存地址
 **/
function addSalesInquiryGoods2CustomerInquiryGoodsGrd(row_data,memcached_url){
	//1.添加行数据
	addTargetDataGridRowData(quotation_supplier_goods_detail_grd,row_data,0);
	//2.将数据添加到缓存中
	var memcached_data=getSupplierQuotationGrdFormatter(row_data);
	addFormatterData2Memecached(memcached_url,memcached_data);
}

/*
 * 获取销售询价商品列表需要的数据格式
 * @return json 
 **/
function getSupplierQuotationGoodsGrdFormatter(){
	 var json={
	 	quotationId				:$('#quotation_supplier_base_id').val(),//供应商报价单编号
		goodsId					:$('#quotation_supplier_goods_detail_id').val(),//商品编号
		goodsName				:$('#quotation_supplier_goods_detail_name').val(),//商品名称
		specId					:quotation_supplier_goods_detail_spec_type.combobox('getValue'),//规格编码
		unit					:$('#quotation_supplier_goods_detail_unit').val(),//包装单位(规格)
		equivalentUnit			:$('#quotation_supplier_goods_detail_equivalent_unit').val(),//折合单位
		quantityEuPerUnit		:$('#quotation_supplier_goods_detail_quantity_eu_per_unit').val(),//包装单位折合数量
		cashType				:quotation_supplier_base_cash_type.combobox('getValue'),//供应币种
		priceUnitSupply			:$('#quotation_supplier_goods_detail_price_unit_supply').val(),//包装单位供应单价
		priceEuSupply			:$('#quotation_supplier_goods_detail_price_eu_supply').val(),//折合单位供应单价
		validityDate			:$('#quotation_supplier_goods_detail_validity_date').val(),//有效期至
		memo					:$('#quotation_supplier_goods_detail_mome').val()//备注
	 };
	 return json;
}


/*
 * 获取后台格式的供应商报价
 * @return json 
 **/
function getSupplierQuotationGrdFormatter(row_data){
	 var json={
	 	quotationId				:row_data.quotationId,//供应商报价单编号
		goodsId					:row_data.goodsId,//商品编号
		goodsName				:row_data.goodsName,//商品名称
		specId					:row_data.specId,//规格编码
		unit					:row_data.unit,//包装单位(规格)
		equivalentUnit			:row_data.equivalentUnit,//折合单位
		quantityEuPerUnit		:row_data.quantityEuPerUnit,//包装单位折合数量
		cashType				:row_data.cashType,//供应币种
		priceUnitSupply			:parseFloat(row_data.priceUnitSupply)*100,//包装单位供应单价
		priceEuSupply			:parseFloat(row_data.priceEuSupply)*100,//折合单位供应单价
		validityDate			:parseDate(row_data.validityDate),//有效期至
		memo					:row_data.memo//备注
	 };
	 return json;
}

function resetQuotationInquiryGoodsDetail(row_data){
	$('#quotation_supplier_goods_detail_id').val(row_data.id);//商品编号
	$('#quotation_supplier_goods_detail_name').val(row_data.name);//商品名称
	quotation_supplier_goods_detail_spec_type.combobox('setValue','');//规格
	$('#quotation_supplier_goods_detail_quantity_eu_per_unit').val('0');//单位折合数量
	$('#quotation_supplier_goods_detail_price_unit_supply').val('0');//包装单位报价
	$('#quotation_supplier_goods_detail_unit').val('0');//包装单位
	$('#quotation_supplier_goods_detail_price_eu_supply').val('0');//折合单位单价
	$('#quotation_supplier_goods_detail_equivalent_unit').val('0');//折合单位
	$('#quotation_supplier_goods_detail_mome').val('');//备注
}

function getLoadQuotationSupplierGoodsDetailData(){
	$.ajax({
		url:'${path}/common/system/category_code_list.html?parentId=1400',
		method:'POST',
		data:{},
		success:function(r){
			spec_unit_data=r;
		},error:function(r){
			$.messager.alert('提示','与后台通讯失败...','error');
		}
	});
}

/**
 * 设置销售询价商品列表
 **/
function setSupplierQuotationGoodsDetail(row_data){
	//1.获取商品列表
	var ajax_url='${path}/quotation/manager/supplierQuotation/supplier_quotation_goods_2_supplierquotationid.html';
	var ajax_data={supplierQuotationId:row_data.supplierQuotationId};
	//移除缓存内容
	quotation_supplier_goods_detail_grd.datagrid('loadData', {total: 0,rows:[]});
	removeFullSupplierQuotationGoodsGrd();
	//获取采购合同商品
	getSupplierQuotationGoodsDetail(ajax_url,ajax_data);
}

/**
 * 移除全部的datagrid数据
 **/
function removeFullSupplierQuotationGoodsGrd(){
	$.ajax({
		url:'${path}/quotation/manager/supplierQuotation/supplier_quotation_product_info_remove_memcached.html',//请求地址
		method:'POST',
		data:{
			quotationId:$('#quotation_supplier_base_id').val(),//销售询价编号
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
		url:'${path}/quotation/manager/supplierQuotation/supplier_quotation_product_info_remove_memcached.html',
		method:'POST',
		data:{
			quotationId:$('#quotation_supplier_base_id').val(),//销售询价单编号
			memo:array.join(',')
		},
		success:function (data){//2.将dategrid的行数据进行删除操作
			if(data.success){
				var rows=quotation_supplier_goods_detail_grd.datagrid('getSelections');
				for(var i=0;i<rows.length;i++){
					var index=quotation_supplier_goods_detail_grd.datagrid('getRowIndex',rows[i]);
					quotation_supplier_goods_detail_grd.datagrid('deleteRow',index);
					quotation_supplier_goods_detail_product_grd.datagrid('acceptChanges');//接受改变
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
function getSupplierQuotationGoodsDetail(ajax_url,ajax_data){
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
					setSupplierQuotationGoodsGrd(row_data);
					$('#quotation_supplier_goods_detail_grd').datagrid('acceptChanges');//接受改变
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
	 	quotationId				:_data.quotationId,//供应商报价单编号
		goodsId					:_data.goodsId,//商品编号
		goodsName				:_data.goodsName,//商品名称
		specId					:_data.specId,//规格编码
		unit					:_data.unit,//包装单位(规格)
		equivalentUnit			:_data.equivalentUnit,//折合单位
		quantityEuPerUnit		:_data.quantityEuPerUnit,//包装单位折合数量
		cashType				:_data.cashType,//供应币种
		priceUnitSupply			:parseFloat(_data.priceUnitSupply)/100,//包装单位供应单价
		priceEuSupply			:parseFloat(_data.priceEuSupply)/100,//折合单位供应单价
		validityDate			:_data.validityDate,//有效期至
		memo					:_data.memo//备注
	 };
	 console.info(json);
  return json;
}

//-->
</script>
<table class="table" style="width: 99.8%;">
	<tr>
		<th>商品</th>
		<td>
			<input class="easyui-validatebox" type="text" style="width: 300px;border:1px solid #95B8E7;float: left;" id="quotation_supplier_goods_detail_name" data-options="" readonly="readonly"/>
			<input type="hidden" id="quotation_supplier_goods_detail_id"/>
			<a id="quotation_supplier_goods_detail_btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>有效期至</th>
		<td><input class="easyui-validatebox Wdate"  onClick="WdatePicker()" style="border:1px solid #95B8E7;" id="quotation_supplier_goods_detail_validity_date"/></td>
		<th>规格</th>
		<td>
			<input class="easyui-validatebox" type="text" style="border:1px solid #95B8E7;" id="quotation_supplier_goods_detail_spec_type"/>
		</td>
	</tr>
	<tr>
		<th>单位折合数量</th>
		<td>
			<input id="quotation_supplier_goods_detail_quantity_eu_per_unit" style="background:#eee;border:1px solid #95B8E7;" value="0"/>
		</td>
		<th>包装单位报价</th>
		<td>
			<input style="width: 100px;" id="quotation_supplier_goods_detail_price_unit_supply"/>
			<input  id="quotation_supplier_goods_detail_unit_text" style="background:#eee;width: 60px;border:1px solid #95B8E7;" readonly="readonly" value="人民币/L"/>
			<input id="quotation_supplier_goods_detail_unit" type="hidden"><%--包装单位 --%>
		</td>
		<th>折合单位单价</th>
		<td>
			<input style="width: 100px;background:#eee;border:1px solid #95B8E7;" id="quotation_supplier_goods_detail_price_eu_supply" readonly="readonly"/>
			<input  id="quotation_supplier_goods_detail_equivalent_unit_text" style="background:#eee;width: 60px;border:1px solid #95B8E7;" readonly="readonly" value="人民币/箱"/>
			<input type="hidden" id="quotation_supplier_goods_detail_equivalent_unit"><%-- 折合单位--%>
		</td>
	</tr>
	<tr>
		<th>备注</th>
		<td colspan="2">
			<input class="easyui-validatebox" style="width: 350px;border:1px solid #95B8E7;"  id="quotation_supplier_goods_detail_mome" data-options=""/>
		</td>
		<th style="text-align: center;"><input type="checkbox"/> 加入后不置空</th>
		<td style="text-align: center;" colspan="2">
			<a id="quotation_supplier_goods_grd_add_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" plain="true">加入(A)</a>
			<a id="quotation_supplier_goods_grd_delete_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-remove'" plain="true">删除(D)</a>
		</td>
	</tr>
</table>
<jsp:include flush="true" page="quotation_supplier_goods_detail_product.jsp"></jsp:include>