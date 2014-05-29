<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
var quotation_sales_goods_detail_product_dialog = null;//查询商品对话框
var quotation_sales_goods_detail_product_grd = null;//查询商品信息列表
var quotation_sales_goods_detail_product_goods_type = null;//商品类型
var quotation_sales_goods_detail_product_goods_status = null;//商品状态
var quotation_sales_goods_detail_product_dialog = null;//生产厂商
$(function(){
	quotation_sales_goods_detail_product_dialog=$('#quotation_sales_goods_detail_product_dialog').show().dialog({
		 title:'选择商品',
		 width:850,
		 height:400,
		 collapsible:true,//向上缩小按钮
		 maximizable:true,
		 modal:true,
		 closed:true
	});
	quotation_sales_goods_detail_product_grd=$('#quotation_sales_goods_detail_product_grd').datagrid({
			fitColumns:false,
	   		autoRowHeight:false,
	   		border:false,
	   		striped:true,
	   		rownumbers:true,
	   		collapsible:true,
      		frozenColumns:[[
				{field:'goodsId',title:'商品编号',width:120},
				{field:'goodsName',title:'商品名称',width:120},
      		]],
      		columns:[[
				{field:'specId',title:'规则编码',width:120,formatter:specTypeFormatter},
				{field:'unit',title:'包装单位(规格)',width:120,formatter:equivalentUnitFormatter},
				{field:'equivalentUnit',title:'折合单位',width:120,formatter:equivalentUnitFormatter},
				{field:'quantityEuPerUnit',title:'包装单位折合数量',width:120},
				{field:'supplyCashType',title:'供应币种',width:120,formatter:cashTypeFormatter},
				{field:'priceUnitSupply',title:'包装单位供应单位',width:120,formatter: function(value,row,index){
						if(value!=undefined&&value!=null&&(value+"").indexOf(".")<=0){
							value=(value/100).toFixed(2);
						}
						return value;
					}	
				},
				{field:'priceEuSupply',title:'折合单位供应单位',width:120,formatter: function(value,row,index){
						if(value!=undefined&&value!=null&&(value+"").indexOf(".")<=0){
							value=(value/100).toFixed(2);
						}
						return value;
					}	
				},
				{field:'validityDate',title:'有效期至',width:120},
				{field:'memo',title:'备注',width:220}
		]]
 	});
 	//查询商品信息
 	$('#quotation_sales_goods_detail_product_search_btn').on('click',function(){
 		quotation_sales_goods_detail_product_grd.datagrid('options').url='${path}/quotation/manager/salesQuotation/supplier_goods_list.html';
 		quotation_sales_goods_detail_product_grd.datagrid('load',{
 			goodsName		:$('#quotation_sales_goods_detail_product_goods_name').val(),//商品名称
 			specId			:$('#quotation_sales_goods_detail_product_goods_spec_type').combobox('getValue'),
 			supplierId		:$('#quotation_sales_goods_detail_product_goods_company_id').val()
 		});
 	});
 	
	
	$('#quotation_sales_goods_detail_product_goods_company_search_btn').on('click',function(){
		contract_sales_goods_detail_compay_dialog.dialog('open');
	});
	
	$('#quotation_sales_goods_detail_product_ok_btn').on('click',function(){
		var	rows = quotation_sales_goods_detail_product_grd.datagrid('getSelections');//获取所有选择的行记录
 		if(rows&&rows.length>1){
 			$.messager.alert('提示','请选择单行商品信息...','warning');
 		}else if(rows&&rows.length==1){
 			//1将数据加载到指定的界面
 			var row=rows[0];
 			resetGoodsDetail(row);//清空商品明细表单
 			//2将显示界面关闭
 			quotation_sales_goods_detail_product_dialog.dialog('close');
 		} 
	});
});
/**
 * 格式化规格
 **/
function specTypeFormatter(value,row,index){
	var combobox_data =$('#quotation_sales_goods_detail_spec_type').combobox('getData');
	for(var i=0,length=combobox_data.length;i<length;i++){
		if(combobox_data[i].specId==value){
			value=combobox_data[i].specName;
			break;
		}
	}
	return value;
}
/**
 * 格式化容量单位
 **/
function equivalentUnitFormatter(value,row,index){
	for(var i=0,length=spec_unit_data.length;i<length;i++){
		if(spec_unit_data[i].id==value){
			value=spec_unit_data[i].name;
			break;
		}
	}
	return value;
}

function cashTypeFormatter(value,row,index){
	return com.radius.datagrid.formatter(value,row,index,quotation_sales_base_cash_type);
}

//-->
</script>
<div id="quotation_sales_goods_detail_product_dialog" style="display: none;width: 99.5">
	<fieldset>
			<legend>筛选条件</legend>
			<table class="table" style="width: 100%;">
				<tr>
					<th>商品名称<br></th>
					<td><input  id="quotation_sales_goods_detail_product_goods_name" style="border:1px solid #95B8E7;"/></td>
					<th>生产厂商</th>
					<td>
						<input  id="quotation_sales_goods_detail_product_goods_company_name" style="border:1px solid #95B8E7;float:left;"/>
						<input type="hidden"  id="quotation_sales_goods_detail_product_goods_company_id"/>
						<a id="quotation_sales_goods_detail_product_goods_company_search_btn" href="#" class="easyui-linkbutton" plain="true" from="0"><font style="font-size:3ex">...</font></a>	
					</td>
					<th>规格</th>
					<td><input id="quotation_sales_goods_detail_product_goods_spec_type"/></td>
					<td>
						<div style="float: left;">
							<a id="quotation_sales_goods_detail_product_search_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
						</div>
						<div class="datagrid-btn-separator"></div>
						<div style="float: left;">
							<a id="quotation_sales_goods_detail_product_ok_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-true'" plain="true">确定</a>
						<div>
					</td>
				</tr>
			</table>
	</fieldset>
	<div id="quotation_sales_goods_detail_product_grd">
	</div>
</div>
<jsp:include flush="true" page="quotation_sales_goods_detail_compay.jsp"></jsp:include>