<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
var quotation_sales_goods_detail_spec_type = null;//规格信息
var spec_unit_data={};
$(function(){
	//调出销售商品对话按钮
	$('#quotation_sales_goods_detail_btn').on('click',function(){
		quotation_sales_goods_detail_product_dialog.dialog('open');
	});
	$('#quotation_sales_goods_detail_spec_type,#quotation_sales_goods_detail_product_goods_spec_type').combobox({
		url:'${path}/common/system/spec_type_list.html',//规格单位数据集
 		valueField: 'specId',
		textField: 'specName',
		editable:false
	});
});
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
		<td><input style="background:#eee;border:1px solid #95B8E7;width: 40px;" value="桶"/></td>
		<th>折合单位</th>
		<td><input style="background:#eee;border:1px solid #95B8E7;width: 40px;" value="升"/></td>
		<th>单位折合数量</th>
		<td>
			<input id="" style="background:#eee;border:1px solid #95B8E7;width: 60px;" value="0"/>
			<input  id="" style="background:#eee;width: 60px;border:1px solid #95B8E7;" readonly="readonly" value="升/桶"/>
		</td>
		
		<th>折合后供应单位</th>
		<td>
			<input style="width: 100px;border:1px solid #95B8E7;" id="quotation_sales_goods_detail_price_unit_supply"/>
			<input  id="quotation_sales_goods_detail_unit_text" style="background:#eee;width: 60px;border:1px solid #95B8E7;" readonly="readonly" value="美元/升"/>
		</td>
	</tr>
	<tr>
		<th>折算汇率</th>
		<td>
			<input style="width: 100px;border:1px solid #95B8E7;" id="quotation_sales_goods_detail_price_unit_supply"/>
			<input  id="quotation_sales_goods_detail_unit_text" style="background:#eee;width: 60px;border:1px solid #95B8E7;" readonly="readonly" value="元/美元"/>
		</td>
		<th>折算单位</th>
		<td>
			<input style="width: 100px;border:1px solid #95B8E7;" id="quotation_sales_goods_detail_price_unit_supply"/>
			<input  id="quotation_sales_goods_detail_unit_text" style="background:#eee;width: 60px;border:1px solid #95B8E7;" readonly="readonly" value="元/升"/>
		</td>
		<th>报价</th>
		<td>
			<input style="width: 100px;border:1px solid #95B8E7;" id="quotation_sales_goods_detail_price_eu_supply" readonly="readonly"/>
			<input  id="quotation_sales_goods_detail_equivalent_unit_text" style="background:#eee;width: 60px;border:1px solid #95B8E7;" readonly="readonly" value="元/升"/>
		</td>
		<th>综合加价率</th>
		<td>
			<input style="width: 100px;background:#eee;border:1px solid #95B8E7;" id="quotation_sales_goods_detail_price_eu_supply" readonly="readonly"/>
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