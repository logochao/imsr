<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
var purchase_inquiry_goods_detail_product_dialog = null;//查询商品对话框
var purchase_inquiry_goods_detail_product_grd = null;//查询商品信息列表
var purchase_inquiry_goods_detail_product_goods_type = null;//商品类型
var purchase_inquiry_goods_detail_product_goods_status = null;//商品状态
var purchase_inquiry_goods_detail_product_dialog = null;//生产厂商
$(function(){
	purchase_inquiry_goods_detail_product_dialog=$('#purchase_inquiry_goods_detail_product_dialog').show().dialog({
		 title:'选择商品',
		 width:750,
		 height:400,
		 collapsible:true,//向上缩小按钮
		 maximizable:true,
		 modal:true,
		 closed:true
	});
	purchase_inquiry_goods_detail_product_grd=$('#purchase_inquiry_goods_detail_product_grd').datagrid({
			fitColumns:false,
	   		autoRowHeight:false,
	   		border:false,
	   		striped:true,
	   		rownumbers:true,
	   		collapsible:true,
      		frozenColumns:[[
      			{field:'id',title:'商品编号',width:120},//商品编号
				{field:'name',title:'商品名称',width:120},//商品名称
				{field:'realName',title:'真实品名称',width:120}//真实品名
      		]],
      		columns:[[
				{field:'goodsType',title:'商品类型',width:120,formatter:goodsTypeFormatter},//商品类型
				{field:'machineSeries',title:'所属设备名称',width:180},//所属设备名
				{field:'machinePosition',title:'设备位号',width:120},//设备位号
				{field:'partNo',title:'备件号',width:120},//备件号
				{field:'mapSeries',title:'图号',width:120},//图号
				{field:'company',title:'生产厂商',width:120},//生产厂商
				{field:'goodStatus',title:'商品状态',width:120,formatter:goodsStatusFormatter},//商品状态 液态
				{field:'weightProp',title:'比重',width:120},//比重
				{field:'vulnerability',title:'易损性',width:120},//易损性
				{field:'description',title:'商品说明',width:120},//商品说明
				{field:'useStatus',title:'使用状态',width:120},//使用状态
				{field:'memo',title:'备注',width:120}//备注
		]]
 	});
 	//查询商品信息
 	$('#purchase_inquiry_goods_detail_product_search_btn').on('click',function(){
 		purchase_inquiry_goods_detail_product_grd.datagrid('options').url='${path}/goods/split_page.html';
 		purchase_inquiry_goods_detail_product_grd.datagrid('load',{
 			name			:$('#purchase_inquiry_goods_detail_product_goods_name').val(),
 			realName		:$('#purchase_inquiry_goods_detail_product_goods_real_name').val(),
 			goodsType		:purchase_inquiry_goods_detail_product_goods_type.combobox('getValue'),
 			goodStatus		:purchase_inquiry_goods_detail_product_goods_status.combobox('getValue'),
 			company			:$('#purchase_inquiry_goods_detail_product_goods_company_id').val()
 		});
 	});
 	
 	//商品类型
	purchase_inquiry_goods_detail_product_goods_type=$('#purchase_inquiry_goods_detail_product_goods_type').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=2600',
 		valueField: 'id',
		textField: 'name',
		editable:false
	});
	//商品状态
	purchase_inquiry_goods_detail_product_goods_status=$('#purchase_inquiry_goods_detail_product_goods_status').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=3700',
 		valueField: 'id',
		textField: 'name',
		editable:false
	});
	
<%--	$('#purchase_inquiry_goods_detail_product_goods_company_search_btn').on('click',function(){--%>
<%--		contract_sales_goods_detail_compay_dialog.dialog('open');--%>
<%--	});--%>
	
	$('#purchase_inquiry_goods_detail_product_ok_btn').on('click',function(){
		var	rows = purchase_inquiry_goods_detail_product_grd.datagrid('getSelections');//获取所有选择的行记录
 		if(rows&&rows.length>1){
 			$.messager.alert('提示','请选择单行商品信息...','warning');
 		}else if(rows&&rows.length==1){
 			//1将数据加载到指定的界面
 			var row=rows[0];
 			resetPurchaseInquiryGoodsDetail(row);//清空商品明细表单
 			//2将显示界面关闭
 			purchase_inquiry_goods_detail_product_dialog.dialog('close');
 		} 
	});
});
function goodsTypeFormatter(value,row,index){
	return com.radius.datagrid.formatter(value,row,index,purchase_inquiry_goods_detail_product_goods_type);
}

function goodsStatusFormatter(value,row,index){
	return com.radius.datagrid.formatter(value,row,index,purchase_inquiry_goods_detail_product_goods_status);
}
//-->
</script>
<div id="purchase_inquiry_goods_detail_product_dialog" style="display: none;width: 99.5">
	<fieldset>
			<legend>筛选条件</legend>
			<table class="table" style="width: 100%;">
				<tr>
					<th>商品名称<br></th>
					<td><input  id="purchase_inquiry_goods_detail_product_goods_name" style="border:1px solid #95B8E7;"/></td>
					<th>真实品名</th>
					<td><input  id="purchase_inquiry_goods_detail_product_goods_real_name" style="border:1px solid #95B8E7;"/></td>
					<th>商品类型</th>
					<td><input  id="purchase_inquiry_goods_detail_product_goods_type" style="border:1px solid #95B8E7;"/></td>
				</tr>
				<tr>
					<th>商品状态</th>
					<td><input  id="purchase_inquiry_goods_detail_product_goods_status" style="border:1px solid #95B8E7;"/></td>
					<th>供应商</th>
					<td>
						<input  id="purchase_inquiry_goods_detail_product_goods_company_name" style="border:1px solid #95B8E7;float:left;"/>
						<input type="hidden"  id="purchase_inquiry_goods_detail_product_goods_company_id"/>
<%--						<a id="purchase_inquiry_goods_detail_product_goods_company_search_btn" href="#" class="easyui-linkbutton" plain="true" from="0"><font style="font-size:3ex">...</font></a>	--%>
					</td>
					<td colspan="2">
						<div style="float: left;">
							<a id="purchase_inquiry_goods_detail_product_search_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
						</div>
						<div class="datagrid-btn-separator"></div>
						<div style="float: left;">
							<a id="purchase_inquiry_goods_detail_product_ok_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-true'" plain="true">确定</a>
						<div>
					</td>
				</tr>
			</table>
	</fieldset>
	<div id="purchase_inquiry_goods_detail_product_grd">
	</div>
</div>
<%--<jsp:include flush="true" page="purchase_inquiry_goods_detail_compay.jsp"></jsp:include>--%>