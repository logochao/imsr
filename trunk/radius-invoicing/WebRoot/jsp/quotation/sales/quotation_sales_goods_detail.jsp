<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
var quotation_sales_goods_detail_spec_type = null;//规格信息
$(function(){
	//调出销售商品对话按钮
	$('#quotation_sales_goods_detail_btn').on('click',function(){
		var success=validataSalesQuotationBaseId();
		if(success){
			quotation_sales_goods_detail_product_dialog.dialog('open');
		}
	});
	$('#quotation_sales_goods_detail_spec_type,#quotation_sales_goods_detail_product_goods_spec_type').combobox({
		url:'${path}/common/system/spec_type_list.html',//规格单位数据集
 		valueField: 'specId',
		textField: 'specName',
		editable:false
	});
	//折合汇率的change事件
	$("#quotation_sales_goods_detail_exch_rate").blur(function(e){
		$('#quotation_sales_goods_detail_price_eu_supply').val(parseFloat($('#quotation_sales_goods_detail_price_unit_supply').val())*parseFloat($(this).val()));
    });
    
    
	//报价的change事件
	$("#quotation_sales_goods_detail_price_eu_customer").blur(function(e){
		//(报价-折合单价)/折合单价*100%
		if(parseFloat($('#quotation_sales_goods_detail_price_eu_supply').val())==0){//折合单价要大于零
			$.messager.alert('提示','请核对折算单价...','error');
			return ;
		}
		if(parseFloat($(this).val())==0){//输入的报价要大于0
			$.messager.alert('提示','请输入正确的报价...','error');
			return ;
		}
		var supply_price=parseFloat($('#quotation_sales_goods_detail_price_eu_supply').val());
		if(parseFloat($(this).val())<=supply_price){
			$.messager.alert('提示','请核实,报价需要大于折算单价...','error');
			return ;
		}
		$('#quotation_sales_goods_detail_mark_up_rate').val(((parseFloat($(this).val())-supply_price)/supply_price)*100);
    });
    
    //添加销售报价商品信息
    $('#quotation_sales_goods_grd_add_btn').on('click',function(){
    	var success=validataSalesQuotationBaseId();
    	//1.添加必要校验
    	if(success){
	    	//2.检查按钮是否禁用
	    	if($(this).linkbutton('options').disabled){
				return ;
			}
			//3.获取格式化得数据
			var row_data=getSalesQunotationGoodsFormatter();
			//4.datagrid接受数据
			setSalesQuotationGoodsGrd(row_data);
			quotation_sales_goods_detail_grd.datagrid('acceptChanges');//接受改变
    	}
    });
    //删除销售报价商品信息
    $('quotation_sales_goods_grd_delete_btn').on('click',function(){
    	if(!$(this).linkbutton('options').disabled){//表示按钮没有禁用的时候	
	 		var rows=quotation_sales_goods_detail_grd.datagrid('getSelections');
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
 *将供应商报价==>销售报价
 **/
function resetGoodsDetail(row_data){
	$('#quotation_sales_goods_detail_spec_type').combobox('enable');
	$('#quotation_sales_goods_detail_id').val(row_data.goodsId);//商品编号
	$('#quotation_sales_goods_detail_name').val(row_data.goodsName);//商品名称
	$('#quotation_sales_goods_detail_spec_type').combobox('setValue',row_data.specId);//规格
	$('#quotation_sales_goods_detail_spec_type').combobox('disable');
	$('#quotation_sales_goods_detail_unit').attr('type_value',row_data.unit);//设置包装单位的编号
	$('#quotation_sales_goods_detail_unit').val(getFormatterSpecType(spec_unit_data,row_data.unit));//包装单位
	$('#quotation_sales_goods_detail_equivalent_unit').attr('type_value',row_data.equivalentUnit);//折合单位编号
	$('#quotation_sales_goods_detail_equivalent_unit').val(getFormatterSpecType(spec_unit_data,row_data.equivalentUnit));//折合单位
	$('#quotation_sales_goods_detail_quantity_eu_per_unit').val(row_data.quantityEuPerUnit);//单位折合数量
	$('#quotation_sales_goods_detail_quantity_eu_per_unit_text').val($('#quotation_sales_goods_detail_equivalent_unit').val()+"/"+$('#quotation_sales_goods_detail_unit').val());//单位折合数量(单位)
	$('#quotation_sales_goods_detail_price_unit_supply').val(parseFloat(row_data.priceUnitSupply)/100);//折合后供应单位
	$('#quotation_sales_goods_detail_supply_cash_type').val(row_data.supplyCashType);//供应商货币单位
	var data=quotation_sales_base_cash_type.combobox('getData');
	 setPriceUnitSupplyText(row_data,data);//设置折合后供应单位后面的显示内容
     setExchRateText(row_data,data);//汇率后面的显示内容
     setPriceEuSupplyText();
}


function getFormatterCashType(data,supply_cash_type){
	var value="";
	for(var i=0,length=data.length;i<length;i++){
		if(data[i].id==row_data.supply_cash_type){
			value=rmbFormatter(data[i].name);
			break;
		}
	}
	return value;
}

function rmbFormatter(str_value){
  if(str_value=='人民币'){
  	return '元';
  }
  return str_value;
}

/**
 *折算单位后面的显示内容
 **/
function setPriceEuSupplyText(){
	var cash_type_text=quotation_sales_base_cash_type.combobox('getText');
	var quotation_sales_goods_detail_price_eu_supply_text=cash_type_text;
	quotation_sales_goods_detail_price_eu_supply_text=rmbFormatter(quotation_sales_goods_detail_price_eu_supply_text);
	$('#quotation_sales_goods_detail_price_eu_supply_text').val(quotation_sales_goods_detail_price_eu_supply_text+"/"+$('#quotation_sales_goods_detail_equivalent_unit').val());
	$('#quotation_sales_goods_detail_price_eu_customer_text').val($('#quotation_sales_goods_detail_price_eu_supply_text').val());
}

/**
 *汇率后面的显示内容
 **/
 function setExchRateText(row_data,data){
 	var cash_type_value=quotation_sales_base_cash_type.combobox('getValue');
	var cash_type_text=quotation_sales_base_cash_type.combobox('getText');
	for(var i=0,length=data.length;i<length;i++){
		var value=cash_type_text;
		if(data[i].id==row_data.supplyCashType){
			value=rmbFormatter(value);
			value+="/"+rmbFormatter(data[i].name);
			$('#quotation_sales_goods_detail_exch_rate_text').val(value);
			break;
		}
	}
 }
 /**
  *设置折合后供应单位后面的显示内容
  **/
  function setPriceUnitSupplyText(row_data,data){
  	var data=quotation_sales_base_cash_type.combobox('getData');
	for(var i=0,length=data.length;i<length;i++){
		if(data[i].id=row_data.supplyCashType){
			$('#quotation_sales_goods_detail_price_unit_supply_text').val(rmbFormatter(data[i].name)+"/"+$('#quotation_sales_goods_detail_equivalent_unit').val());
			break;
		}
	}
  }

/**
 * 设置销售询价商品列表并将数据添加到内存中
 **/
function setSalesQuotationGoodsGrd(row_data){
	var rows = quotation_sales_goods_detail_grd.datagrid('getRows');//获取当前页所有数据行
	var url='${path}/quotation/manager/salesQuotation/sales_quotation_product_info_memcached.html';//缓存地址
	console.info(rows);
	if(rows.length>0){//
		//1.存在对应的数据则将其更新
		var goodsId=row_data.goodsId;
		var row=null,isExist=false,row_index=0;//初始化

		for(var i=0;i<rows.length;i++){
			row=rows[i];
			if(row.goodsId==goodsId){
				console.info(row.goodsId+","+goodsId);
				isExist=true;
				row_index=i;
				break;
			}
		}
		if(isExist){
			$.messager.alert('提示','请不要添加相同的商品报价...','error');
			return ;
		}
	}
	addSalesQuotationGoodsGrd2DatagridAndCached(row_data,url);
}

/**
 * 将添加商品信息添加到datagrid并添加到缓存中
 **/
function addSalesQuotationGoodsGrd2DatagridAndCached(row_data,memcached_url){
	//1.添加行数据
	addTargetDataGridRowData(quotation_sales_goods_detail_grd,row_data,0);
	//2.将数据添加到缓存中
	getSalesQunotationGoods2Formatter(row_data);
	addFormatterData2Memecached(memcached_url,row_data);
}

/**
* 将销售合同中的商品信息从memcache中进行删除
**/
function removeProudctInfoMemcached(array){
	$.ajax({
		url:'${path}/quotation/manager/salesQuotation/sales_quotation_product_info_remove_memcached.html',
		method:'POST',
		data:{
			quotationId:$('#quotation_sales_base_id').val(),//销售询价单编号
			memo:array.join(',')
		},
		success:function (data){//2.将dategrid的行数据进行删除操作
			if(data.success){
				var rows=quotation_sales_goods_detail_grd.datagrid('getSelections');
				for(var i=0;i<rows.length;i++){
					var index=quotation_sales_goods_detail_grd.datagrid('getRowIndex',rows[i]);
					quotation_sales_goods_detail_grd.datagrid('deleteRow',index);
					quotation_sales_goods_detail_grd.datagrid('acceptChanges');//接受改变
				}
			}
		},
		error: function(data){
			$.messager.alert('提示','处理缓存失败...',error);
		}
	});
}

/**
 *将表单域中的数据封装为datagrid需要的数据格式
 **/ 
function getSalesQunotationGoodsFormatter(){
	var json={
		salesQuotationId		:$('#quotation_sales_base_id').val(),//销售报价单编号
		goodsId					:$('#quotation_sales_goods_detail_id').val(),//商品编号
		goodsName				:$('#quotation_sales_goods_detail_name').val(),//商品名称
		specId					:$('#quotation_sales_goods_detail_spec_type').combobox('getValue'),//规格编码
		unit					:$('#quotation_sales_goods_detail_unit').attr('type_value'),//包装单位(规格)
		equivalentUnit			:$('#quotation_sales_goods_detail_equivalent_unit').attr('type_value'),//折合单位
		quantityEuPerUnit		:$('#quotation_sales_goods_detail_quantity_eu_per_unit').val(),//包装单位折合数量
		supplyCashType			:$('#quotation_sales_goods_detail_supply_cash_type').val(),//供应币种
		priceUnitSupply			:parseFloat($('#quotation_sales_goods_detail_price_unit_supply').val())*100,//包装单位供应单价
		priceEuSupply			:parseFloat($('#quotation_sales_goods_detail_price_eu_supply').val())*100,//折合单位供应单价
		salesCashType			:quotation_sales_base_cash_type.combobox('getValue'),//销售币种
		exchRate				:parseFloat($('#quotation_sales_goods_detail_exch_rate').val()),//折算汇率
		priceEuCustomer			:parseFloat($('#quotation_sales_goods_detail_price_eu_customer').val())*100,//销售报价
		markUpRate				:parseFloat($('#quotation_sales_goods_detail_mark_up_rate').val()),//综合加价率
		memo					:$('#quotation_sales_goods_detail_mome').val(),//备注
		//madeDate				:$('#').val(),//生产日期
		validityDate			:$('#quotation_sales_goods_detail_validity_date').val(),//有效期至
	};
	return json;
}
/**
 * 将表单域中的数据封装为datagrid需要的数据格式(后台)
 **/
function getSalesQunotationGoods2Formatter(row_data){
	row_data.validityDate=parseDate(row_data.validityDate);
}




function clearSalesQuotationGoodsDetail(){
	$('#quotation_sales_goods_detail_spec_type').combobox('enable');
	$("input[id^='quotation_sales_goods_detail_']").each(function(e){
		$(this).val('');
	})
	$('#quotation_sales_goods_detail_unit').val('桶');
	$('#quotation_sales_goods_detail_equivalent_unit').val('升');
	$('#quotation_sales_goods_detail_quantity_eu_per_unit_text').val('升/桶');
	$('#quotation_sales_goods_detail_price_unit_supply_text').val('美元/升');
	$('#quotation_sales_goods_detail_exch_rate_text').val('元/美元');
	$('#quotation_sales_goods_detail_price_eu_supply_text').val('元/升');
	$('#quotation_sales_goods_detail_price_eu_customer_text').val('元/升');
	$('#quotation_sales_goods_detail_equivalent_unit_text').val('%');
	quotation_sales_goods_detail_grd.datagrid('loadData', {total: 0,rows:[]});
	quotation_sales_goods_detail_product_grd.datagrid('loadData', {total: 0,rows:[]});
}

function setSalesQuotationGoodsDetail(row_data){
	//1.通过异步获取所有的报价商品列表
	var ajax_url='${path}/quotation/manager/salesQuotation/sales_quotation_goods_2_salesquotationid.html';
	var ajax_data={salesQuotationId:row_data.salesQuotationId};
	//移除缓存内容
	quotation_sales_goods_detail_grd.datagrid('loadData', {total: 0,rows:[]});
	removeFullSalesQuotationGoodsGrd();
	//获取采购合同商品
	getSalesQuotationGoodsDetail(ajax_url,ajax_data);
}


/**
 * 移除全部的datagrid数据
 **/
function removeFullSalesQuotationGoodsGrd(){
	$.ajax({
		url:'${path}/quotation/manager/salesQuotation/sales_quotation_product_info_remove_memcached.html',//请求地址
		method:'POST',
		data:{
			salesQuotationId:$('#quotation_sales_base_id').val(),//销售报价单编号
			delete:true
		},
		success:function(r){
			if(r&&r.success){
				console.info(r);
			}
		},
		error:function(r){
			$.messager.alert('提示','与后台通讯失败...','error');
		}
	});
}

/**
 * 通过条件查询相关商品明细列表
 **/
function getSalesQuotationGoodsDetail(ajax_url,ajax_data){
	//1.通过ajax获取销售询价商品信息
	$.ajax({
		url:ajax_url,
		mehtod:'POST',
		data:ajax_data,
		success:function(r){
			if(r&&r.total>0){
				$.each(r.rows,function(index,d){
					//1.1 将数据格式化
					var row_data=getSalesQuotationGoodsGrdRowFormatter(d);//将数据格式化
					//1.2 在数据列表中添加、在缓存中添加
					setSalesQuotationGoodsGrd(row_data);
					$('#quotation_sales_goods_detail_grd').datagrid('acceptChanges');//接受改变
				});
			}
		},
		error:function(r){
			$.messager.alert('提示','访问服务发生异常....','error');
		}
	});
}
/**
 * 将后台数据转为datagrid格式化的数据
 **/
function getSalesQuotationGoodsGrdRowFormatter(_data){
	var json={
		salesQuotationId		:_data.salesQuotationId,//销售报价单编号
		goodsId					:_data.goodsId,//商品编号
		goodsName				:_data.goodsName,//商品名称
		specId					:_data.specId,//规格编码
		unit					:_data.unit,//包装单位(规格)
		equivalentUnit			:_data.equivalentUnit,//折合单位
		quantityEuPerUnit		:_data.quantityEuPerUnit,//包装单位折合数量
		supplyCashType			:_data.supplyCashType,//供应币种
		priceUnitSupply			:_data.priceUnitSupply,//包装单位供应单价
		priceEuSupply			:_data.priceEuSupply,//折合单位供应单价
		salesCashType			:_data.salesCashType,//销售币种
		exchRate				:_data.exchRate,//折算汇率
		priceEuCustomer			:_data.priceEuCustomer,//销售报价
		markUpRate				:_data.markUpRate,//综合加价率
		memo					:_data.memo,//备注
		//madeDate				:$('#').val(),//生产日期
		validityDate			:_data.validityDate,//有效期至
	};
	return json;
}
//-->
</script>
<table class="table" style="width: 99.8%;">
	<tr>
		<th>商品</th>
		<td colspan="3">
			<input class="easyui-validatebox" type="text" style="width: 300px;border:1px solid #95B8E7;float: left;" id="quotation_sales_goods_detail_name" data-options="" readonly="readonly"/>
			<input type="hidden" id="quotation_sales_goods_detail_id"/>
			<a id="quotation_sales_goods_detail_btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>有效期至</th>
		<td><input class="easyui-validatebox Wdate"  onClick="WdatePicker()" style="border:1px solid #95B8E7;" id="quotation_sales_goods_detail_validity_date"/></td>
		<th>规格</th>
		<td>
			<input class="easyui-validatebox" type="text" style="border:1px solid #95B8E7;" id="quotation_sales_goods_detail_spec_type"/>
		</td>
	</tr>
	<tr>
		<th>包装单位</th>
		<td>
			<input id="quotation_sales_goods_detail_unit" style="background:#eee;border:1px solid #95B8E7;width: 40px;" type_value="" readonly="readonly" value="桶"/>
		</td>
		<th>折合单位</th>
		<td><input id="quotation_sales_goods_detail_equivalent_unit" readonly="readonly" style="background:#eee;border:1px solid #95B8E7;width: 40px;" type_value="" value="升"/></td>
		<th>单位折合数量</th>
		<td>
			<input id="quotation_sales_goods_detail_quantity_eu_per_unit" readonly="readonly" style="background:#eee;border:1px solid #95B8E7;width: 60px;" value="0"/>
			<input  id="quotation_sales_goods_detail_quantity_eu_per_unit_text" style="background:#eee;width: 60px;border:1px solid #95B8E7;" readonly="readonly" value="升/桶"/>
		</td>
		
		<th>折合后供应单位</th>
		<td>
			<input style="width: 100px;border:1px solid #95B8E7;background:#eee;" readonly="readonly" id="quotation_sales_goods_detail_price_unit_supply"/>
			<input type="hidden" id="quotation_sales_goods_detail_supply_cash_type"/><%--供应商货币单位--%>
			<input  id="quotation_sales_goods_detail_price_unit_supply_text" style="background:#eee;width: 60px;border:1px solid #95B8E7;" readonly="readonly" value="美元/升"/>
		</td>
	</tr>
	<tr>
		<th>折算汇率</th>
		<td>
			<input style="width: 100px;border:1px solid #95B8E7;" id="quotation_sales_goods_detail_exch_rate"/>
			<input  id="quotation_sales_goods_detail_exch_rate_text" style="background:#eee;width: 60px;border:1px solid #95B8E7;" readonly="readonly" value="元/美元"/>
		</td>
		<th>折算单位</th>
		<td>
			<input style="background:#eee;width: 100px;border:1px solid #95B8E7;" readonly="readonly" id="quotation_sales_goods_detail_price_eu_supply"/>
			<input  id="quotation_sales_goods_detail_price_eu_supply_text" style="background:#eee;width: 60px;border:1px solid #95B8E7;" readonly="readonly" value="元/升"/>
		</td>
		<th>报价</th>
		<td>
			<input style="width: 100px;border:1px solid #95B8E7;" id="quotation_sales_goods_detail_price_eu_customer"/>
			<input  id="quotation_sales_goods_detail_price_eu_customer_text" style="background:#eee;width: 60px;border:1px solid #95B8E7;" readonly="readonly" value="元/升"/>
		</td>
		<th>综合加价率</th>
		<td>
			<input style="width: 100px;background:#eee;border:1px solid #95B8E7;" id="quotation_sales_goods_detail_mark_up_rate" readonly="readonly"/>
			<input  id="quotation_sales_goods_detail_equivalent_unit_text" style="background:#eee;width: 20px;border:1px solid #95B8E7;" readonly="readonly" value="%"/>
		</td>
	</tr>
	<tr>
		<th>备注</th>
		<td colspan="3">
			<input class="easyui-validatebox" style="width: 350px;border:1px solid #95B8E7;"  id="quotation_sales_goods_detail_mome" data-options=""/>
		</td>
		<th style="text-align: center;" colspan="2"><input type="checkbox"/> 加入后不置空</th>
		<td style="text-align: center;" colspan="2">
			<a id="quotation_sales_goods_grd_add_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" plain="true">加入(A)</a>
			<a id="quotation_sales_goods_grd_delete_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-remove'" plain="true">删除(D)</a>
		</td>
	</tr>
</table>
<jsp:include flush="true" page="quotation_sales_goods_detail_product.jsp"></jsp:include>