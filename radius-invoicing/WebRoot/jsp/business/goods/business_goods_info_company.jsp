<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
var business_goods_info_company_grd = null;//生产厂商列表
var business_goods_info_company_dialog = null;//生产厂商对话框
$(function(){
	//生产厂商信息列表
	business_goods_info_company_grd=$('#business_goods_info_company_grd').datagrid({
   			fitColumns:false,
	   		autoRowHeight:false,
	   		border:false,
	   		striped:true,
	   		rownumbers:true,
	   		collapsible:true,
	   		frozenColumns:[[
   				 {field:'supplierId',title:'供应商编号',width:100},
   				 {field:'shortName',title:'供应商简称',width:100},
   			 	 {field:'supplierName',title:'供应商名称',width:200},
	   			 {field:'supplierProperty',title:'供应商性质',width:120,formatter:supplierPropertyFormatter}
	   		]],
	   		columns:[[
	   			 {field:'linkman',title:'联系人',width:120},
	   			 {field:'contactInfo',title:'手机号',width:60},
	   			 {field:'tel',title:'电话',width:60},
	   			 {field:'fax',title:'传真',width:60},
	   			 {field:'marketZone',title:'市场区域',width:120},
	   			 {field:'officeAddress',title:'办公地址',width:120},
	   			 {field:'postCode',title:'邮编',width:60},
	   			 {field:'url',title:'网址',width:120},
	   			 {field:'goodsBillsdate',title:'货期',width:80},
				{field:'memo',title:'备注',width:250,align:'center'}
			]]
	});
	//查询生产厂商信息
	$('#business_goods_info_company_query_btn').on('click',function(){
		business_goods_info_company_grd.datagrid('options').url='${path}/supplier/manager/supplier/supplier_info_detail_2_supplier.html';
 		business_goods_info_company_grd.datagrid('load',{
 			shortName					:$('#business_goods_info_company_ab').val(),//简称
 			supplierName				:$('#business_goods_info_company_name').val(),//名称
 			supplierProperty			:business_goods_info_company_property.combobox('getValue'),//性质
 			url							:$('#business_goods_info_company_url').val(),//网址
 			taxNo						:$('#business_goods_info_company_tax_no').val(),//税号
 			linkman						:$('#business_goods_info_company_link_man').val(),//联系人
 			contactInfo					:$('#business_goods_info_company_contact_info').val()//联系方式（存放手机号）
 		});
	});
	
	//公司属性
 	business_goods_info_company_property=$('#business_goods_info_company_property').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=1200',
 		valueField: 'id',
		textField: 'name',
		editable:false
 	});
 	
 	//确定生产厂商信息
 	$('#business_goods_info_company_ok_btn').on('click',function(){
 		//将供应商列表信息添加到供应商表单中
 		var	rows = business_goods_info_company_grd.datagrid('getSelections');//获取所有选择的行记录
 		if(rows.length>1){
 			$.messager.alert('提示','请选择单行生产厂商信息...','warning');
 		}else if(rows.length==1){
 			var row = rows[0];//带处理的销售订单行信息
 			var supplierId = row.supplierId;//供应商编号
 			var shortName  =row.shortName;//供应商名称
 			if(business_goods_company_from=="0"){//表示添加商品信息对话框
	 			$('#business_goods_info_form_made_company_name').val(shortName);
	 			$('#business_goods_info_form_made_company_id').val(supplierId);
 			}else if(business_goods_company_from == "1"){//表示查询商品信息对话框
 				$('#business_goods_search_company_name').val(shortName);
	 			$('#business_goods_search_company_id').val(supplierId);
 			}
			business_goods_info_company_dialog.dialog('close');
 		}else{
 			$.messager.alert('提示','请选择生产厂商信息...','warning');
 		}
 	});
});

/**
 * 格式化供应商属性信息
 *@params{}  value
 *@params{}  row
 *@params{}  index
 *@return   
 **/
function supplierPropertyFormatter(value,row,index){
	var combobox_data = business_goods_info_company_property.combobox('getData');
	for(var i=0,length=combobox_data.length;i<length;i++){
		if(combobox_data[i].id==value){
			value=combobox_data[i].name;
			break;
		}
	}
	return value;
}
</script>
	<fieldset>
			<legend>筛选条件</legend>
		<table  style="width: 100%;">
			<tr>
				<th>供应商简称:</th>
				<td>
					<input id="business_goods_info_company_ab"  style="border:1px solid #95B8E7"/>
				</td>
				<th>供应商名称:</th>
				<td><input id="business_goods_info_company_name" style="border:1px solid #95B8E7"/></td>
				<th>供应商性质:</th>
				<td><input id="business_goods_info_company_property"  style="border:1px solid #95B8E7"/></td>
			</tr>
			<tr>
				<th>网址:</th>
				<td><input id="business_goods_info_company_url" style="border:1px solid #95B8E7"/></td>
				<th>税号:</th>
				<td><input id="business_goods_info_company_tax_no"  style="border:1px solid #95B8E7"/></td>
				<th>默认联系人:</th>
				<td><input id="business_goods_info_company_link_man" style="border:1px solid #95B8E7"/></td>
			</tr>
			<tr>
				<th>默认手机号:</th>
				<td><input id="business_goods_info_company_contact_info" style="border:1px solid #95B8E7"/></td>
				<td colspan="2" style="text-align: center;" >
					<div style="float: left;margin-top: 5px;">
						<a id="business_goods_info_company_query_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
					</div>
					<div style="float: left;margin-left: 10px;margin-top: 5px;">
						<a id="business_goods_info_company_ok_btn"  href="#" class="easyui-linkbutton" data-options="iconCls:'icon-true'" plain="true">确定</a>
					<div>
				</td>
			</tr>
		</table>
	</fieldset>
<div id="business_goods_info_company_grd"><!-- 生产厂商列表 -->
</div>