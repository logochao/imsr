<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
var purchase_inquiry_base_status = null;
var purchase_inquiry_base_cash_type = null;//货币单位
$(function(){
	//合同状态
	purchase_inquiry_base_status=$('#purchase_inquiry_base_status').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=2400',
 		valueField: 'id',
		textField: 'name',
		onLoadSuccess:function(){
			var target = $(this);
			target.combobox("setValue",target.val());
			target.combobox('disable');
		}
 	});
 	
 	purchase_inquiry_base_cash_type=$('#purchase_inquiry_base_cash_type').combobox({
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
 	
 	//客户查询对话框按钮
 	$('#purchase_inquiry_base_supplier_btn').on('click',function(){
 		if(validataSupplierInquiryBaseId()){
 			purchase_inquiry_base_supplier_dialog.dialog('open');
 		}
 	});
 	//联系人查询对话框按钮
 	$('#purchase_inquiry_base_supplier_link_man_btn').on('click',function(){
 		if(validataSupplierInquiryBaseId()){
	 		if($('#purchase_inquiry_base_supplier_id').val().length==0){
				$.messager.alert('提示','请请选择客户信息...','error');
				return;
			}
			purchase_inquiry_base_link_man_dialog.dialog('open');
 		}
 	});
});

/**
 *清空基本信息
 **/
function clearPurchaseInquiryBaseInfo(){
	$("input[id^='purchase_inquiry_base_']").each(function(e){
		$(this).val('');
	})
	purchase_inquiry_base_status.combobox('setValue','2401');
	var data = purchase_inquiry_base_cash_type.combobox("getData");
	var options = purchase_inquiry_base_cash_type.combobox("options");
	if(data && data.length>0){
		var fs = data[0];
		purchase_inquiry_base_cash_type.combobox("setValue",fs[options.valueField]);
	}
}

/**
 *设置客户询价基本信息
 *@params{} row_data
 **/
function setPurchaseInquiryBaseInfo(row_data){
		$('#purchase_inquiry_base_id').val(row_data.purchaseInquiryId);//销售询价单编号
		$('#purchase_inquiry_base_supplier_id').val(row_data.supplierId);//客户编号
		$('#purchase_inquiry_base_supplier_name').val(row_data.supplierName);//客户简称
		purchase_inquiry_base_cash_type.combobox("setValue",row_data.cashType);//币种
		$('#purchase_inquiry_base_delivery_point').val(row_data.address);//送货地址
		$('#purchase_inquiry_base_link_man').val(row_data.man);//联系人
		$('#purchase_inquiry_base_link_mobile').val(row_data.mobile);//联系人手机
		$('#purchase_inquiry_base_link_tel').val(row_data.tel);//联系电话
		$('#purchase_inquiry_base_link_fax').val(row_data.fax);//联系fax
		$('#purchase_inquiry_base_order_time').val(row_data.inquiryDate);//询价日期
		$('#purchase_inquiry_base_order_end_time').val(row_data.latestQuotateDate);//最迟报价日期
		$('#purchase_inquiry_base_sales_man').val(row_data.salesman);//业务员
		purchase_inquiry_base_status.combobox('setValue',row_data.status);//状态
}
/**
 *检查客户询价单号
 **/
function validataSupplierInquiryBaseId(){
	if($('#purchase_inquiry_base_id').val().length==0){
		$.messager.alert('提示','请点击新建按钮,构建新的采购询价单...','error');
		return false;
	}
	return true;
}
//-->
</script>

<table class="table" style="width: 100%;">
	<tr>
		<th>采购询价号</th>
		<td><input class="easyui-validatebox" style="background:#eee;width: 150px;border:1px solid #95B8E7;" id="purchase_inquiry_base_id" readonly="readonly"/></td>
		<th>状态</th>
		<td colspan="3"><input id="purchase_inquiry_base_status" style="border:1px solid #95B8E7;"  class="easyui-validatebox" class="easyui-combobox" value="2401"/></td>
		<th>询价日期</th>
		<td><input class="easyui-validatebox Wdate"  onClick="WdatePicker()" style="border:1px solid #95B8E7;" id="purchase_inquiry_base_order_time"/></td>
	</tr>
	<tr>
		<th>供应商</th>
		<td colspan="3">
			<input  id="purchase_inquiry_base_supplier_name" style="width: 300px;border:1px solid #95B8E7;float: left;" readonly="readonly"/> 
			<input  type="hidden" id="purchase_inquiry_base_supplier_id" readonly="readonly"/> 
			<a id="purchase_inquiry_base_supplier_btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>货币单位</th>
		<td>
			<input id="purchase_inquiry_base_cash_type" >
		</td>
		<th>最迟报价日期</th>
		<td><input class="easyui-validatebox Wdate"  onClick="WdatePicker()" style="border:1px solid #95B8E7;" id="purchase_inquiry_base_order_end_time" data-options=""/></td>
	</tr>
	<tr>
		<th>联系人</th>
		<td>
			<input id="purchase_inquiry_base_link_man" class="easyui-validatebox" style="border:1px solid #95B8E7;float: left;"/>
			<a id="purchase_inquiry_base_supplier_link_man_btn"  href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>办公电话</th>
		<td><input class="easyui-validatebox" style="border:1px solid #95B8E7;" id="purchase_inquiry_base_link_tel" /></td>
		<th>手机号码</th>
		<td><input class="easyui-validatebox" style="border:1px solid #95B8E7;" id="purchase_inquiry_base_link_mobile" /></td>
		<th>传真</th>
		<td><input class="easyui-validatebox" style="border:1px solid #95B8E7;" id="purchase_inquiry_base_link_fax"/></td>
	</tr>
	<tr>
		<th>送货地址</th>
		<td colspan="3"><input class="easyui-validatebox" style="width: 350px;border:1px solid #95B8E7;" id="purchase_inquiry_base_delivery_point"/></td>
		<th>业务员</th>
		<td colspan="3">
			<input class="easyui-validatebox" id="purchase_inquiry_base_sales_man"  style="border:1px solid #95B8E7;float: left;"/>
			<a id="btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
	</tr>
</table>
<jsp:include flush="true" page="purchase_inquiry_base_supplier.jsp"></jsp:include>
<jsp:include flush="true" page="purchase_inquiry_base_supplier_link_man.jsp"></jsp:include>