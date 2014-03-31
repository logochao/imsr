<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
<!--
var business_goods_search_origin_place = null;//商品产地
var business_goods_search_product_property = null;//商品属性
var business_goods_search_product_series = null ;//商品类别
var business_goods_search_category_name = null ;//商品分类
var business_goods_search_add_product_dialog = null;//添加商品信息对话框 
 $(function (){
 
 	//----------------------------------初始化--------------------------------------------------------
 	//产地
 	business_goods_search_origin_place=$('#business_goods_search_origin_place').combobox({
 		url:'/stock/common/system/category_code_list.html?parentId=200',
 		valueField: 'id',
		textField: 'name',
		onLoadSuccess:function(){
			var target = $(this);
			var data = target.combobox("getData");
			var options = target.combobox("options");
			if(data && data.length>0){
				var fs = data[0];
				target.combobox("setValue",fs[options.valueField]);
			}
		}
 	});
 	//商品属性
 	business_goods_search_product_property=$('#business_goods_search_product_property').combobox({
 		url:'/stock/common/system/category_code_list.html?parentId=1200',
 		valueField: 'id',
		textField: 'name',
		onLoadSuccess:function(){
			var target = $(this);
			var data = target.combobox("getData");
			var options = target.combobox("options");
			if(data && data.length>0){
				var fs = data[0];
				target.combobox("setValue",fs[options.valueField]);
			}
		}
 	});
 	//商品类别(系列)
 	business_goods_search_product_series=$('#business_goods_search_product_series').combobox({
 		url:'/stock/common/system/category_code_list.html?parentId=2600',
 		valueField: 'id',
		textField: 'name',
		onLoadSuccess:function(){
			var target = $(this);
			var data = target.combobox("getData");
			var options = target.combobox("options");
			if(data && data.length>0){
				var fs = data[0];
				target.combobox("setValue",fs[options.valueField]);
			}
		}
 	});
 	
 	//商品分类
 	business_goods_search_category_name=$('#business_goods_search_category_name').combobox({
 		url:'/stock/common/system/category_code_list.html?parentId=2600',
 		valueField: 'id',
		textField: 'name',
		onLoadSuccess:function(){
			var target = $(this);
			var data = target.combobox("getData");
			var options = target.combobox("options");
			if(data && data.length>0){
				var fs = data[0];
				target.combobox("setValue",fs[options.valueField]);
			}
		}
 	});
 	//商品批次
 	$('#business_goods_search_batch_no').numberspinner({
 		value:0,
 		min:0,
 		max:1000,
 		increment:1,
 		editable:false
 	});
 	
 	//-----------------------------------初始化添加商品信息界面---------------------------------------------------
 	//商品状态
 	$('#business_goods_search_add_product_dialog_form_status').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=1100',
 		valueField: 'id',
		textField: 'name',
		onLoadSuccess:function(){
			var target = $(this);
			var data = target.combobox("getData");
			var options = target.combobox("options");
			if(data && data.length>0){
				var fs = data[0];
				target.combobox("setValue",fs[options.valueField]);
			}
		},
		editable:false
 	});
 	//商品属性
 	$('#business_goods_search_add_product_dialog_form_property').combobox({});
 	//商品分类
 	$('#business_goods_search_add_product_dialog_form_category_name').combobox({});
 	//商品产地
 	$('#business_goods_search_add_product_dialog_form_place').combobox({});
 	//币种
 	$('#business_goods_search_add_product_dialog_form_cash_type').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=800',
 		valueField: 'id',
		textField: 'name',
		onLoadSuccess:function(){
			var target = $(this);
			var data = target.combobox("getData");
			var options = target.combobox("options");
			if(data && data.length>0){
				var fs = data[0];
				target.combobox("setValue",fs[options.valueField]);
			}
		},
		editable:false
 	});
 	//销售方式
 	$('#business_goods_search_add_product_dialog_form_sales_type').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=3600',
 		valueField: 'id',
		textField: 'name',
		onLoadSuccess:function(){
			var target = $(this);
			var data = target.combobox("getData");
			var options = target.combobox("options");
			if(data && data.length>0){
				var fs = data[0];
				target.combobox("setValue",fs[options.valueField]);
			}
		},
		editable:false
 	});
 	//默认销售方式
 	$('#business_goods_search_add_product_dialog_form_defult_sales_institution').combobox({});
 	//商品系列
 	$('#business_goods_search_add_product_dialog_form_series').combobox({});
 	//存放期限
 	$('#business_goods_search_add_product_dialog_form_deposit_deadline').datebox({});
 	//最低库限
 	$('#business_goods_search_add_product_dialog_form_min_store').datebox({});
 	//最高库限
 	$('#business_goods_search_add_product_dialog_form_max_store').datebox({});
 	
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
 	
 	//---------------------------------------业务处理--------------------------------------------------------------
 	//查询按钮
 	$('#business_goods_search_query_btn').on('click',function(){
 		
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
 			url:'${path}',
 			method:'POST',
 			data:goods_data,
 			success:function(r){
 				if(r&&r.success){
 					//1.将数据追加到datagrid中
 					var row_data=getGoodsInfo2ProductGrid(r.child);
 					addBusinessGoodsGrdProductGrid(row_data);
 					//2.将添加商品界面进行清空处理
 					resetBusinessGoodsSearchAddProductDialogForm();
 				}
 			},
 			error:function(r){
 				$.messager.alert('提示','访问服务发生异常....','error');
 			}
 		});
 	}
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
 
 /**
  * 获取添加商品信息格式化后的商品信息(符合后台model对象)
  * @return json
  **/
 function getAddProductInfoFormatter(){
 	var json={
 	
 	};
 	return json;
 }
 
 /**
  * 验证添加商品信息
  * @return boolean 
  **/
 function validateAddProductInfo(){
 	var validate =false;
 	
 	return validate;
 }
 /**
  * 将后台数据转化为商品列表datagrid row_data
  * @params{} _data 后台数据对象
  * @return   json
  **/
 function getGoodsInfo2ProductGrid(_data){
 	var  json ={
 		
 	};
 	return json;
 }
 
 /**
  * 重置添加商品信息表单
  *
  **/
 function resetBusinessGoodsSearchAddProductDialogForm(){
 	
 }
 
//-->
</script>
<div id="business_goods_search_search_product_info">
	<table  style="width: 100%;">
		<tr>
			<td>商品名称:</td>
			<td><input id="business_goods_search_product_name"  style="border:1px solid #95B8E7"/></td>
			<td>分类:</td>
			<td><input id="business_goods_search_category_name" style="border:1px solid #95B8E7"/></td>
			<td>产地:</td>
			<td><input id="business_goods_search_origin_place"  style="border:1px solid #95B8E7"/></td>
			<td>商品性质:</td>
			<td><input id="business_goods_search_product_property" style="border:1px solid #95B8E7"/></td>
		</tr>
		<tr>
			<td>商品类型:</td>
			<td><input id="business_goods_search_product_series"  style="border:1px solid #95B8E7"/></td>
			<td>真实品名:</td>
			<td><input id="business_goods_search_true_product_name" style="border:1px solid #95B8E7"/></td>
			<td>批次号</td>
			<td><input id="business_goods_search_batch_no"/></td>
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
		<table  style="width: 100%;margin-left: 10px;height: 100px;">
			<tr>
				<td>商品名称</td>
				<td><input id="business_goods_search_add_product_dialog_form_name" style="border:1px solid #95B8E7"/> </td>
				<td>真实品名</td>
				<td><input id="business_goods_search_add_product_dialog_form_real_name" style="border:1px solid #95B8E7"/> </td>
				<td>商品条码</td>
				<td><input id="business_goods_search_add_product_dialog_form_bar_code" style="border:1px solid #95B8E7"/> </td>
			</tr>
			<tr>
				<td>商品状态</td>
				<td><input id="business_goods_search_add_product_dialog_form_status" style="border:1px solid #95B8E7"/> </td>
				<td>商品性质</td>
				<td><input id="business_goods_search_add_product_dialog_form_property" style="border:1px solid #95B8E7"/> </td>
				<td>分类名称</td>
				<td><input id="business_goods_search_add_product_dialog_form_category_name" style="border:1px solid #95B8E7"/> </td>
			</tr>
			<tr>
				<td>产地</td>
				<td><input id="business_goods_search_add_product_dialog_form_place" style="border:1px solid #95B8E7"/> </td>
				<td>用途</td>
				<td><input id="business_goods_search_add_product_dialog_form_uses" style="border:1px solid #95B8E7"/> </td>
				<td>比重</td>
				<td><input id="business_goods_search_add_product_dialog_form_weight_prop" style="border:1px solid #95B8E7"/> </td>
			</tr>
			<tr>
				<td>单价</td>
				<td><input id="business_goods_search_add_product_dialog_form_price" style="border:1px solid #95B8E7"/> </td>
				<td>成本</td>
				<td><input id="business_goods_search_add_product_dialog_form_cost" style="border:1px solid #95B8E7"/> </td>
				<td>币种</td>
				<td><input id="business_goods_search_add_product_dialog_form_cash_type" style="border:1px solid #95B8E7"/> </td>
			</tr>
			<tr>
				<td>销售方式</td>
				<td><input   id="business_goods_search_add_product_dialog_form_sales_type" style="border:1px solid #95B8E7"/> </td>
				<td>默认销售单位</td>
				<td><input   id="business_goods_search_add_product_dialog_form_defult_sales_institution" style="border:1px solid #95B8E7"/> </td>
				<td>税号</td>
				<td><input   id="business_goods_search_add_product_dialog_form_tax_no" style="border:1px solid #95B8E7"/> </td>
			</tr>
			<tr>
				<td>商品系列</td>
				<td><input   id="business_goods_search_add_product_dialog_form_series" style="border:1px solid #95B8E7"/> </td>
				<td>易损性</td>
				<td><input   id="business_goods_search_add_product_dialog_form_vulnerability" style="border:1px solid #95B8E7"/> </td>
				<td>折扣</td>
				<td><input   id="business_goods_search_add_product_dialog_form_off_sales" style="border:1px solid #95B8E7"/> </td>
			</tr>
			<tr>
				<td>存放期限</td>
				<td><input   id="business_goods_search_add_product_dialog_form_deposit_deadline" style="border:1px solid #95B8E7"/> </td>
				<td>最低库限</td>
				<td><input   id="business_goods_search_add_product_dialog_form_min_store" style="border:1px solid #95B8E7"/> </td>
				<td>最高库限</td>
				<td><input   id="business_goods_search_add_product_dialog_form_max_store" style="border:1px solid #95B8E7"/> </td>
			</tr>
		</table>
		
		<div id="tt" class="easyui-tabs" data-options="split:true" fit="true" border="false" style="margin-top: 10px;"> 
			<div title="商品批次信息">
				<jsp:include flush="true" page="business_goods_search_batch.jsp"></jsp:include>
			</div>  
			<div title="商品规格信息">
				<jsp:include flush="true" page="business_goods_search_format.jsp"></jsp:include>
			</div>  
			<div title="商品描述信息">
			</div>  
			<div title="商品说明">
			</div>
			<div title="采购说明">
			</div>
		</div>
	</form>
</div>

