<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
var constract_sales_goods_grd_form_dialog=null;
var constract_sales_goods_grd_form_grd=null;
$(function(){
	$('#constract_sales_goods_grd_form_btn').on('click',function(){//商品选择按钮
		constract_sales_goods_grd_form_dialog=$('#constract_sales_goods_grd_form_dialog').show().dialog({
			title:'选择商品',
 			 width:800,
 			 height:400,
 			 collapsible:true,//向上缩小按钮
 			 maximizable:true,
 			 modal:true
		});
	});
	$('#constract_sales_goods_grd_form_search_btn').on('click',function(){//查询商品信息
		constract_sales_goods_grd_form_grd.datagrid('options').url='/stock/goods/split_page.html';
 		constract_sales_goods_grd_form_grd.datagrid('load',{
 			name:$('#constract_sales_goods_grd_form_goods_name').val(),
 			property:$('#constract_sales_goods_grd_form_goods_type').val(),
 			realName:$('#constract_sales_goods_grd_form_goods_real_name').val()
 		});
	});
	
	
	constract_sales_goods_grd_form_grd=$('#constract_sales_goods_grd_form_grd').datagrid({
 				fit:true,
        		autoRowHeight:false,
        		border:false,
        		striped:true,
        		rownumbers:true,
        		collapsible:true,
        		columns:[[
        			{field:'id',title:'商品编号',width:80},
        			{field:'name',title:'商品名称',width:100},
        			{field:'realName',title:'真实品名',width:100},
					{field:'property',title:'商品性质',width:100},
					{field:'categoryName',title:'分类名称',width:100},
					{field:'series',title:'商品系列',width:100},
					{field:'unit',title:'单位',width:100},
					{field:'place',title:'产地',width:100},
					{field:'uses',title:'用途',width:120}
				]]
 	});
 	$('#constract_sales_goods_grd_form_ok_btn').on('click',function(){
 		var	rows = constract_sales_goods_grd_form_grd.datagrid('getSelections');//获取所有选择的行记录
 		if(rows&&rows.length>1){
 			$.messager.alert('提示','请选择单行商品信息...','warning');
 		}else if(rows&&rows.length==1){
 			//1将数据加载到指定的界面
 			var row=rows[0];
 			$('#contract_sales_goods_grd_form_id').attr('value',row.id);//商品编号
 			$('#contract_sales_goods_grd_form_name').attr('value',row.name);
 			$('#contract_sales_goods_grd_form_format').attr('value',row.format);
 			$('#contract_sales_goods_grd_form_price').attr('value',row.price);
 			$('#contract_sales_goods_grd_form_price_convert_unit').attr('value',row.priceConvertUnit);
 			//$('#contract_sales_goods_grd_form_quantity_unit').attr('value',row.fax1);
 			//$('#contract_sales_goods_grd_form_quantity_eu').attr('value',row.fax1);
 			//2将显示界面关闭
 			constract_sales_goods_grd_form_dialog.dialog('close');
 		} 
 	});
 	$('#contract_sales_goods_grd_form_quantity_unit').numberspinner({
 		min:0,
 		editable:false,
 		onChange:function(value){
 			var contract_sales_goods_grd_form_price=parseInt($('#contract_sales_goods_grd_form_price').val());
 			$('#contract_sales_goods_grd_form_amount').attr('value',contract_sales_goods_grd_form_price*parseInt(value));	
 		}
 	});
 	$('#contract_sales_goods_grd_add_btn').on('click',function(){
		//1.当前金额小于0则不将其加入到datagrid中
		//insertRow 	
		$('#contract_sales_goods_grd').datagrid('insertRow',{
			index:0,
			row:{
				goodsId:$('#contract_sales_goods_grd_form_id').val(),//商品编号
				goodsName:$('#contract_sales_goods_grd_form_name').val(),//商品名称
				price:$('#contract_sales_goods_grd_form_price').val(),//单价
				quantityUnit:$('#contract_sales_goods_grd_form_quantity_unit').val(),//数量
				equivalentUnit:$('#contract_sales_goods_grd_form_equivalent_unit').val(),//折合单位
				quantityEu:$('#contract_sales_goods_grd_form_quantity_eu').val(),//折合数量
				priceEu:$('#contract_sales_goods_grd_form_price_convert_unit').val(),//折合单价
				unit:$('#contract_sales_goods_grd_form_format').val(),//规格
				amount:$('#contract_sales_goods_grd_form_amount').val(),//金额
				mome:$('#contract_sales_goods_grd_form_mome').val()//备注
			}
		});
 	});
});
</script>
<table class="table" style="width: 100%;">
	<tr>
		<th>商品</th>
		<td colspan="3">
			<input class="easyui-validatebox" type="text" style="width: 300px;" id="contract_sales_goods_grd_form_name" name="contract_sales_goods_grd_name" data-options="required:true"/>
			<input type="hidden" id="contract_sales_goods_grd_form_id"/>
			<a id="constract_sales_goods_grd_form_btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>规格</th>
		<td colspan="3">
			<input class="easyui-validatebox" type="text" style="width: 200px;" id="contract_sales_goods_grd_form_format" data-options="required:true"/>
		</td>
		<th>单价</th>
		<td>
			<input class="easyui-validatebox" type="text" id="contract_sales_goods_grd_form_price" data-options="required:true"/>
			<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-font'"  plain="true"></a>
		</td>
	</tr>
	<tr>
		<th>折合单价</th>
		<td>
			<input class="easyui-validatebox" type="text" id="contract_sales_goods_grd_form_price_convert_unit" data-options="required:true"/>
		</td>
		<th>数量</th>
		<td>
			<input style="width: 100px;" type="text" class="easyui-numberspinner" id="contract_sales_goods_grd_form_quantity_unit"/>
			<input type="text"  style="width: 20px;" readonly="readonly" value="桶"/>
		</td>
		<th>折合数量</th>
		<td colspan="3">
			<input style="width: 100px;" type="text" class="easyui-numberspinner" id="contract_sales_goods_grd_form_quantity_eu" data-options="min:0,editable:false"/>
			<input type="text" id="contract_sales_goods_grd_form_equivalent_unit" style="width: 20px;" readonly="readonly" value="吨"/>
		</td>
		<th>金额</th>
		<td>
			<input class="easyui-validatebox" type="text" id="contract_sales_goods_grd_form_amount" data-options="required:true" value="0" readonly="readonly"/>
		</td>
	</tr>
	<tr>
		<th>备注</th>
		<td colspan="6">
			<input class="easyui-validatebox" style="width: 500px;" type="text" id="contract_sales_goods_grd_form_mome" data-options="required:true"/>
		</td>
		<th colspan="2" style="text-align: center;"><input type="checkbox"/> 加入后不置空</th>
		<td>
			<a id="contract_sales_goods_grd_add_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" plain="true">加入(A)</a>
			<a id="btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-remove'" plain="true">删除(D)</a>
		</td>
	</tr>
</table>


<div id="constract_sales_goods_grd_form_dialog" style="display: none;">
	<fieldset>
			<legend>筛选条件</legend>
			<table class="table" style="width: 100%;">
				<tr>
					<th>商品名称<br></th>
					<td><input name="constract_sales_goods_grd_form_goods_name" id="constract_sales_goods_grd_form_goods_name"/><br></td>
					<th>商品类型</th>
					<td><input name="constract_sales_goods_grd_form_goods_type" id="constract_sales_goods_grd_form_goods_type"/><br></td>
				</tr>
				<tr>
					<th>真实品名<br></th>
					<td><input name="constract_sales_goods_grd_form_goods_real_name" id="constract_sales_goods_grd_form_goods_real_name"/><br></td>
					<td colspan="2">
						<div style="float: left;">
						<a id="constract_sales_goods_grd_form_search_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
						</div>
						<div class="datagrid-btn-separator"></div>
						<div style="float: left;">
						<a id="constract_sales_goods_grd_form_ok_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-true'" plain="true">确定</a>
						<div>
					</td>
				</tr>
			</table>
	</fieldset>
	<div id="constract_sales_goods_grd_form_grd">
	</div>
</div>