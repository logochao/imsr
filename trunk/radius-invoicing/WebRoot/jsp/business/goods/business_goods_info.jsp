<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
var business_goods_info_form_goods_type = null;//商品类型
var business_goods_info_form_goods_status = null;//商品状态
var business_goods_company_from = "0";
var business_goods_info_form_cash_use_status = null;//使用状态
$(function(){
	//商品类型
	business_goods_info_form_goods_type=$('#business_goods_info_form_goods_type').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=2600',
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
	//商品状态
	business_goods_info_form_goods_status=$('#business_goods_info_form_goods_status').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=3700',
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
	
	business_goods_info_form_cash_use_status=$('#business_goods_info_form_cash_use_status').combobox({
 		url:'${path}/common/system/use_status_list.html',
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
	
	//生成厂商查询按钮
	$('#business_goods_info_form_supplier_search_btn').on('click',function(){
		business_goods_info_company_dialog.dialog('open');
		business_goods_company_from=$(this).attr('from');
	});
	
});


 /**
  * 获取添加商品信息格式化后的商品信息(符合后台model对象)
  * @return json
  **/
 function getAddProductInfoFormatter(){
 	var json={
 		id					:$('#business_goods_info_form_id').val(),//商品编号
 		name				:$('#business_goods_info_form_name').val(),//商品名称
 		realName			:$('#business_goods_info_form_real_name').val(),//真实品名
 		goodsType			:business_goods_info_form_goods_type.combobox('getValue'),//商品类型
 		machineSeries		:$('#business_goods_info_form_host_machine_series').val(),//所属设备名称/型号(主机序列号)
 		machinePosition		:$('#business_goods_info_form_machine_position').val(),//设备位号
 		partNo				:$('#business_goods_info_form_part_no').val(),//备件号
 		mapSeries			:$('#business_goods_info_form_map_series').val(),//图号
 		company				:$('#business_goods_info_form_made_company_id').val(),//生产厂商
 		goodStatus			:business_goods_info_form_goods_status.combobox('getValue'),//商品状态 液态/固态
 		weightProp			:$('#business_goods_info_form_weight_prop').val(),//比重
 		vulnerability		:$('#business_goods_info_form_vulnerability').val(),//易损性
 		description			:$('#business_goods_info_form_goods_description').val(),//商品说明
 		useStatus			:business_goods_info_form_cash_use_status.combobox('getValue'),//使用状态
 		memo				:$('#business_goods_info_form_memo').val()//备注
 	};
 	return json;
 }
 
 /**
  * 验证添加商品信息
  * @return boolean 
  **/
 function validateAddProductInfo(){
 	var validate =true;
 	return validate;
 }
  /**
  * 重置添加商品信息表单
  **/
 function resetBusinessGoodsSearchAddProductDialogForm(){
 	$('#business_goods_info_form_name').val('');//商品名称
 	$('#business_goods_info_form_real_name').val('');//真实品名
 	
 	business_goods_info_form_goods_type.combobox('setText','');//商品类型
	business_goods_info_form_goods_type.combobox('setValue','');//商品类型
 	
 	$('#business_goods_info_form_host_machine_series').val('');//所属设备名称/型号(主机序列号)
 	$('#business_goods_info_form_machine_position').val('');//设备位号
 	$('#business_goods_info_form_part_no').val('');//备件号
 	$('#business_goods_info_form_map_series').val('');//图号
 	$('#business_goods_info_form_made_company_id').val('');//生产厂商
 	$('#business_goods_info_form_made_company_name').val('');//生产厂商
 	
 	business_goods_info_form_goods_status.combobox('setText','');//商品状态 液态/固态
	business_goods_info_form_goods_status.combobox('setValue','');//商品状态 液态/固态
 	
 	$('#business_goods_info_form_weight_prop').val('');//比重
 	$('#business_goods_info_form_vulnerability').val('');//易损性
 	$('#business_goods_info_form_goods_description').val('');//商品说明
 	business_goods_info_form_cash_use_status.combobox('setText','');//使用状态
	business_goods_info_form_cash_use_status.combobox('setValue','');//使用状态
 	
 	$('#business_goods_info_form_memo').val('');//备注
 }
</script>
<table  style="width: 100%;margin-left: 10px;height: 100px;">
	<tr>
		<td>商品名称</td>
		<td>
			<input id="business_goods_info_form_name" style="border:1px solid #95B8E7"/> 
			<input id="business_goods_info_form_id" type="hidden" value="${goods.id}"/> 
		</td>
		<td>真实品名</td>
		<td><input id="business_goods_info_form_real_name" style="border:1px solid #95B8E7"/> </td>
		<td>商品类型</td>
		<td><input id="business_goods_info_form_goods_type" style="border:1px solid #95B8E7"/> </td>
	</tr>
	<tr>
		<td>所属设备名称</td>
		<td><input id="business_goods_info_form_host_machine_series" style="border:1px solid #95B8E7"/> </td>
		<td>设备位号</td>
		<td><input id="business_goods_info_form_machine_position" style="border:1px solid #95B8E7"/> </td>
		<td>备件号</td>
		<td><input id="business_goods_info_form_part_no" style="border:1px solid #95B8E7"/> </td>
	</tr>
	<tr>
		<td>图号</td>
		<td><input id="business_goods_info_form_map_series" style="border:1px solid #95B8E7"/> </td>
		<td>生产厂商</td>
		<td>
				<input id="business_goods_info_form_made_company_name" style="border:1px solid #95B8E7"/>
				<input id="business_goods_info_form_made_company_id" type="hidden"/>
				<a id="business_goods_info_form_supplier_search_btn" href="#" class="easyui-linkbutton" plain="true" from="0"><font style="font-size:3ex">...</font></a>
		</td>
		<td>商品状态</td>
		<td><input id="business_goods_info_form_goods_status" style="border:1px solid #95B8E7"/> </td>
	</tr>
	<tr>
		<td>比重</td>
		<td><input id="business_goods_info_form_weight_prop" style="border:1px solid #95B8E7"/> </td>
		<td>易损性</td>
		<td><input id="business_goods_info_form_vulnerability" style="border:1px solid #95B8E7"/> </td>
		<td>使用状态</td>
		<td><input id="business_goods_info_form_cash_use_status" style="border:1px solid #95B8E7"/> </td>
	</tr>
</table>
<div id="tt" class="easyui-tabs" data-options="split:true" fit="true" border="false" style="margin-top: 10px;"> 
	<div title="商品备注">
		<textarea rows="5" cols="120" id="business_goods_info_form_memo" style="border:1px solid #95B8E7"></textarea>
	</div>
	<div title="商品说明">
		<textarea rows="5" cols="120" id="business_goods_info_form_goods_description" style="border:1px solid #95B8E7"></textarea>
	</div>
</div>