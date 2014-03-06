<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
<!--
//-->
</script>

<table class="table" style="width: 100%;">
	<tr>
		<th>商品</th>
		<td colspan="3">
			<input class="easyui-validatebox" type="text" style="width: 300px;" id="contract_sales_goods_grd_form_name" name="contract_sales_goods_grd_name" data-options="" readonly="readonly"/>
			<input type="hidden" id="contract_sales_goods_grd_form_id"/>
			<a id="constract_sales_goods_grd_form_btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>规格</th>
		<td colspan="3">
			<input class="easyui-validatebox" type="text" style="width: 200px;" id="contract_sales_goods_grd_form_format" validType="length[0,2]"missingMessage="请输入规格" invalidMessage="不能超过2个字符!"  data-options=""/>
		</td>
		<th>单价</th>
		<td>
			<input class="easyui-validatebox" type="text" id="contract_sales_goods_grd_form_price" data-options=""/>
			<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-font'"  plain="true"></a>
		</td>
	</tr>
	<tr>
		<th>折合单价</th>
		<td>
			<input class="easyui-validatebox" type="text" id="contract_sales_goods_grd_form_price_convert_unit" data-options="validType:'numberic',missingMessage:'请输入折合单价',invalidMessage:'请输入正确的格式'"/>
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
			<input class="easyui-validatebox" type="text" id="contract_sales_goods_grd_form_amount" data-options="" value="0" readonly="readonly"/>
		</td>
	</tr>
	<tr>
		<th>备注</th>
		<td colspan="6">
			<input class="easyui-validatebox" style="width: 500px;" type="text" id="contract_sales_goods_grd_form_mome" data-options=""/>
		</td>
		<th colspan="2" style="text-align: center;"><input type="checkbox"/> 加入后不置空</th>
		<td>
			<a id="contract_sales_goods_grd_add_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" plain="true">加入(A)</a>
			<a id="contract_sales_goods_grd_delete_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-remove'" plain="true">删除(D)</a>
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