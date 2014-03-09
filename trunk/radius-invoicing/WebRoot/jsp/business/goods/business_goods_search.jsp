<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
<!--
var business_goods_search_origin_place = null;
var business_goods_search_goods_property = null;
var business_goods_search_goods_series = null ;
 $(function (){
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
 	business_goods_search_goods_property=$('#business_goods_search_goods_property').combobox({
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
 	business_goods_search_goods_series=$('#business_goods_search_goods_series').combobox({
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
 	
 	//查询按钮
 	$('#business_goods_search_query_btn').on('click',function(){
 	
 	});
 	//确定按钮
 	$('#business_goods_search_ok_btn').on('click',function(){
 	});
 });
//-->
</script>
<div id="business_goods_search_search_goods_info">
	<fieldset>
		<legend>筛选条件</legend>
		<table  style="width: 100%;">
			<tr>
				<td>商品名称:</td>
				<td><input id="business_goods_search_goods_name"  style="border:1px solid #95B8E7"/></td>
				<td>分类:</td>
				<td><input id="business_goods_search_category_name" style="border:1px solid #95B8E7"/></td>
				<td>产地:</td>
				<td><input id="business_goods_search_origin_place"  style="border:1px solid #95B8E7"/></td>
				<td>商品性质:</td>
				<td><input id="business_goods_search_goods_property" style="border:1px solid #95B8E7"/></td>
			</tr>
			<tr>
				<td>商品类型:</td>
				<td><input id="business_goods_search_goods_series"  style="border:1px solid #95B8E7"/></td>
				<td>真实品名:</td>
				<td><input id="business_goods_search_true_goods_name" style="border:1px solid #95B8E7"/></td>
				<td>批次号</td>
				<td><input id="business_goods_search_batch_no" style="border:1px solid #95B8E7"/></td>
				<td colspan="2" style="text-align: center;" >
					<div style="float: left;">
						<a id="business_goods_search_query_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
					</div>
					<div class="datagrid-btn-separator"></div>
					<div style="float: left;">
						<a id="business_goods_search_ok_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-true'" plain="true">确定</a>
					<div>
				</td>
			</tr>
		</table>
	</fieldset>
</div>
