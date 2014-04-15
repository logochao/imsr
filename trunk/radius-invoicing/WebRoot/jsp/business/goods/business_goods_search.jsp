<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
<!--
var business_goods_search_goods_status = null;//商品属性
var business_goods_search_product_series = null ;//商品类别
var business_goods_search_goods_type = null ;//商品分类
var business_goods_search_add_product_dialog = null;//添加商品信息对话框 
var business_goods_info_company_dialog = null;
 $(function (){
 
 	//----------------------------------初始化--------------------------------------------------------
 	business_goods_search_add_product_dialog=$('#business_goods_search_add_product_dialog').show().dialog({
		 title:'添加商品信息',
		 width:800,
		 height:400,
		 collapsible:true,//向上缩小按钮
		 maximizable:true,
		 modal:true,
		 closed:true,
		 toolbar:['-',{
	 			 id:'business_goods_search_add_goods_dialog_save_btn',
	 			 text:'商品保存',
	 			 iconCls: 'icon-add',
	 			 handler:addProductInfoSaveBtn
	 			},'-',{
	 			 id:'business_goods_search_add_goods_dialog_close_btn',
	 			 text:'关闭',
	 			 iconCls: 'icon-cancel',
	 			 handler:addProductInfoCloseBtn
	 			},
	 		'-']
	});
 	
 	//商品状态
 	business_goods_search_goods_status=$('#business_goods_search_goods_status').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=3700',
 		valueField: 'id',
		textField: 'name',
		editable:false
 	});
 	
 	//商品分类
 	business_goods_search_goods_type=$('#business_goods_search_goods_type').combobox({
 		url:'/stock/common/system/category_code_list.html?parentId=2600',
 		valueField: 'id',
		textField: 'name',
		editable:false
 	});
 	
 	//查询供应商(生产厂商)信息对话框
 	business_goods_info_company_dialog=$('#business_goods_info_company_dialog').show().dialog({
		 title:'查询生产厂商信息',
		 width:800,
		 height:380,
		 collapsible:true,//向上缩小按钮
		 maximizable:true,
		 modal:true,
		 closed:true
	});
 	
 	//打开供应商查询界面
 	$('#business_goods_search_product_supplier_search_btn').on('click',function(){
 		business_goods_info_company_dialog.dialog('open');
 		business_goods_company_from=$(this).attr('from');
 	});
 	
 	
 	
 	//---------------------------------------业务处理--------------------------------------------------------------
 	//查询按钮
 	$('#business_goods_search_query_btn').on('click',function(){
 		business_goods_grd_product_grid.datagrid('options').url='${path}/goods/manager/goods/product_info_2_goods.html';
 		business_goods_grd_product_grid.datagrid('load',{
 			name			:$('#business_goods_search_name').val(),
 			realName		:$('#business_goods_search_real_name').val(),
 			goodsType		:business_goods_search_goods_type.combobox('getValue'),
 			machineSeries	:$('#business_goods_search_machine_series').val(),
 			machinePosition	:$('#business_goods_search_machine_position').val(),
 			partNo			:$('#business_goods_search_part_no').val(),
 			mapSeries		:$('#business_goods_search_map_series').val(),
 			company			:$('#business_goods_search_company_id').val(),
 			goodStatus		:business_goods_search_goods_status.combobox('getValue')
 		});
 	});
 	//确定按钮
 	$('#business_goods_search_ok_btn').on('click',function(){
 		
 	});
 });
 
 /**
  * 保存商品信息按钮处理事件
  *
  **/
 function addProductInfoSaveBtn(){
 	var goods_data = getAddProductInfoFormatter();
 	var validate = validateAddProductInfo();
 	if(validate){
 		$.ajax({
 			url:'${path}/goods/manager/goods/product_infos_add.html',
 			method:'POST',
 			data:goods_data,
 			success:function(r){
 				if(r&&r.success){
 					//1.将数据追加到datagrid中
 					var row_data=getGoodsInfo2ProductGrid(r.child);
 					addBusinessGoodsGrdProductGrid(row_data);
 					//2.将添加商品界面进行清空处理
 					resetBusinessGoodsSearchAddProductDialogForm();
 					//3.商品编号
 					$('#business_goods_info_form_id').val(r.child.backup);
 					//4.关闭对话框
 					addProductInfoCloseBtn();
 				}
 			},
 			error:function(r){
 				$.messager.alert('提示','访问服务发生异常....','error');
 			}
 		});
 	}
 }
 
 /**
  * 将后台数据转化为商品列表datagrid row_data
  * @params{} _data 后台数据对象
  * @return   json
  **/
 function getGoodsInfo2ProductGrid(_data){
 	var  json ={
 		id					:_data.id,//商品编号
 		name				:_data.name,//商品名称
 		realName			:_data.realName,//真实品名
 		goodsType			:_data.realName,//商品类型
 		machineSeries		:_data.machineSeries,//所属设备名称/型号(主机序列号)
 		machinePosition		:_data.machinePosition,//设备位号
 		partNo				:_data.partNo,//备件号
 		mapSeries			:_data.mapSeries,//图号
 		company				:_data.company,//生产厂商
 		goodStatus			:_data.goodStatus,//商品状态 液态/固态
 		weightProp			:_data.weightProp,//比重
 		vulnerability		:_data.vulnerability,//易损性
 		description			:_data.description,//商品说明
 		useStatus			:_data.useStatus,//使用状态
 		memo				:_data.memo//备注
 	};
 	return json;
 }
 
 /**
  * 添加商品的关闭按钮事件
  **/
 function addProductInfoCloseBtn(){
 	//1.将对话框中的内容清空
 	resetBusinessGoodsSearchAddProductDialogForm();
 	//2.关闭对话框
 	business_goods_search_add_product_dialog.dialog('close');
 }
//-->
</script>
<div id="business_goods_search_search_product_info">
	<table  style="width: 100%;">
		<tr>
			<th>商品名称:</th>
			<td><input id="business_goods_search_name"  style="border:1px solid #95B8E7"/></td>
			<th>真实品名称:</th>
			<td><input id="business_goods_search_real_name" style="border:1px solid #95B8E7"/></td>
			<th>商品类型:</th>
			<td><input id="business_goods_search_goods_type"  style="border:1px solid #95B8E7"/></td>
			<th>商品状态:</th>
			<td><input id="business_goods_search_goods_status"  style="border:1px solid #95B8E7"/></td>
		</tr>
		<tr>
			<th>设备名称:</th>
			<td><input id="business_goods_search_machine_series" style="border:1px solid #95B8E7"/></td>
			<th>设备位号:</th>
			<td><input id="business_goods_search_machine_position" style="border:1px solid #95B8E7"/></td>
			<th>备件号:</th>
			<td><input id="business_goods_search_part_no" style="border:1px solid #95B8E7"/></td>
			<th>图号:</th>
			<td><input id="business_goods_search_map_series" style="border:1px solid #95B8E7"/></td>
		</tr>
		<tr>
			<th>生产厂商:</th>
			<td>
				<input id="business_goods_search_company_name" style="border:1px solid #95B8E7"/>
				<input id="business_goods_search_company_id" type="hidden"/>
				<a id="business_goods_search_product_supplier_search_btn" href="#" class="easyui-linkbutton" plain="true" from="1"><font style="font-size:3ex">...</font></a>
			</td>
			<td colspan="2" style="text-align: center;" >
				<div style="float: left;margin-top: 5px;">
					<a id="business_goods_search_query_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
				</div>
				<div style="float: left;margin-left: 10px;margin-top: 5px;">
					<a id="business_goods_search_ok_btn"  href="#" class="easyui-linkbutton" data-options="iconCls:'icon-true'" plain="true">确定</a>
				<div>
			</td>
		</tr>
	</table>
</div>

<div id="business_goods_search_add_product_dialog">
	<form id="business_goods_search_add_product_dialog_form">
		<jsp:include flush="true" page="business_goods_info.jsp"></jsp:include>
	</form>
</div>
<div id="business_goods_info_company_dialog" style="margin-top: 5px;">
	<jsp:include flush="true" page="business_goods_info_company.jsp"></jsp:include>
</div>
