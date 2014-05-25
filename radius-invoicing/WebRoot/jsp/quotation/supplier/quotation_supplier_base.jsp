<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
var quotation_supplier_base_status = null;
var quotation_supplier_base_cash_type = null;//货币单位
$(function(){
	//供应商报价表单状态
	quotation_supplier_base_status=$('#quotation_supplier_base_status').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=2400',
 		valueField: 'id',
		textField: 'name',
		onLoadSuccess:function(){
			var target = $(this);
			target.combobox("setValue",target.val());
			target.combobox('disable');
		}
 	});
 	
 	quotation_supplier_base_cash_type=$('#quotation_supplier_base_cash_type').combobox({
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
 	$('#quotation_supplier_base_supplier_btn').on('click',function(){
 		//if(validataSupplierInquiryBaseId()){
 			quotation_supplier_base_supplier_dialog.dialog('open');
 		//}
 	});
 	//联系人查询对话框按钮
 	$('#quotation_supplier_base_supplier_link_man_btn').on('click',function(){
 		if(validataSupplierInquiryBaseId()){
	 		if($('#quotation_supplier_base_supplier_id').val().length==0){
				$.messager.alert('提示','请请选择客户信息...','error');
				return;
			}
			quotation_supplier_base_link_man_dialog.dialog('open');
 		}
 	});
 	//采购询价对话框
 	$('#quotation_supplier_base_purchase_inquiry_btn').on('click',function(){
 		var success=validataSupplierInquiryBaseId();
 		if(success){//供应商报价单检查
 			success = validataSupplierId();
 		}
		if(success){//供应商信息检查
			quotation_supplier_base_purchase_inquiry_dialog.dialog('open');
		}
 	});
});

/**
 *清空基本信息
 **/
function clearPurchaseInquiryBaseInfo(){
	$("input[id^='quotation_supplier_base_']").each(function(e){
		$(this).val('');
	})
	quotation_supplier_base_status.combobox('setValue','2401');
	var data = quotation_supplier_base_cash_type.combobox("getData");
	var options = quotation_supplier_base_cash_type.combobox("options");
	if(data && data.length>0){
		var fs = data[0];
		quotation_supplier_base_cash_type.combobox("setValue",fs[options.valueField]);
	}
}

/**
 *设置客户询价基本信息
 *@params{} row_data
 **/
function setSupplierInquiryBaseInfo(row_data){
		$('#quotation_supplier_base_id').val(row_data.supplierQuotationId);//销售询价单编号
		$('#quotation_supplier_base_supplier_id').val(row_data.supplierId);//客户编号
		$('#quotation_supplier_base_supplier_name').val(row_data.supplierName);//客户简称
		quotation_supplier_base_cash_type.combobox("setValue",row_data.cashType);//币种
		$('#quotation_supplier_base_delivery_point').val(row_data.address);//送货地址
		$('#quotation_supplier_base_link_man').val(row_data.man);//联系人
		$('#quotation_supplier_base_link_mobile').val(row_data.mobile);//联系人手机
		$('#quotation_supplier_base_link_tel').val(row_data.tel);//联系电话
		$('#quotation_supplier_base_link_fax').val(row_data.fax);//联系fax
		$('#quotation_supplier_base_order_time').val(row_data.inquiryDate);//询价日期
		$('#quotation_supplier_base_order_end_time').val(row_data.latestQuotateDate);//最迟报价日期
		$('#quotation_supplier_base_sales_man').val(row_data.salesman);//业务员
		quotation_supplier_base_status.combobox('setValue',row_data.status);//状态
		$('#quotation_supplier_base_purchase_inquiry_id').val(row_data.purchaseInquiryId);//
		
}
/**
 *检查客户询价单号
 **/
function validataSupplierInquiryBaseId(){
	if($('#quotation_supplier_base_id').val().length==0){
		$.messager.alert('提示','请点击新建按钮,构建新的采购询价单...','error');
		return false;
	}
	return true;
}
/**
 *检查供应商编号
 **/
function validataSupplierId(){
	if($('#quotation_supplier_base_supplier_id').val().length==0){
		$.messager.alert('提示','请供应商信息...','error');
		return false;
	}
	return true;
}
/**
 *检查采购询价单号
 **/
function validataPurchaseInquiryId(){
  if($('#quotation_supplier_base_purchase_inquiry_id').val().length==0){
		$.messager.alert('提示','请选择采购询价单号...','error');
		return false;
	}
	return true;
}
//-->
</script>

<table class="table" style="width: 100%;">
	<tr>
		<th>采购报价单号</th>
		<td><input class="easyui-validatebox" style="background:#eee;width: 150px;border:1px solid #95B8E7;" id="quotation_supplier_base_id" readonly="readonly"/></td>
		<th>状态</th>
		<td colspan="3"><input id="quotation_supplier_base_status" style="border:1px solid #95B8E7;"  class="easyui-validatebox" class="easyui-combobox" value="2401"/></td>
		<th>报价日期</th>
		<td><input class="easyui-validatebox Wdate"  onClick="WdatePicker()" style="border:1px solid #95B8E7;" id="quotation_supplier_base_order_time"/></td>
	</tr>
	<tr>
		<th>供应商</th>
		<td colspan="3">
			<input  id="quotation_supplier_base_supplier_name" style="width: 300px;border:1px solid #95B8E7;float: left;" readonly="readonly"/> 
			<input  type="hidden" id="quotation_supplier_base_supplier_id" readonly="readonly"/> 
			<a id="quotation_supplier_base_supplier_btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>货币单位</th>
		<td>
			<input id="quotation_supplier_base_cash_type" >
		</td>
		<th>最迟报价日期</th>
		<td><input class="easyui-validatebox Wdate"  onClick="WdatePicker()" style="border:1px solid #95B8E7;" id="quotation_supplier_base_order_end_time" data-options=""/></td>
	</tr>
	<tr>
		<th>联系人</th>
		<td>
			<input id="quotation_supplier_base_link_man" class="easyui-validatebox" style="border:1px solid #95B8E7;float: left;"/>
			<a id="quotation_supplier_base_supplier_link_man_btn"  href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>办公电话</th>
		<td><input class="easyui-validatebox" style="border:1px solid #95B8E7;" id="quotation_supplier_base_link_tel" /></td>
		<th>手机号码</th>
		<td><input class="easyui-validatebox" style="border:1px solid #95B8E7;" id="quotation_supplier_base_link_mobile" /></td>
		<th>传真</th>
		<td><input class="easyui-validatebox" style="border:1px solid #95B8E7;" id="quotation_supplier_base_link_fax"/></td>
	</tr>
	<tr>
		<th>送货地址</th>
		<td colspan="3"><input class="easyui-validatebox" style="width: 350px;border:1px solid #95B8E7;" id="quotation_supplier_base_delivery_point"/></td>
		<th>采购询价单</th>
		<td>
			<input id="quotation_supplier_base_purchase_inquiry_id" class="easyui-validatebox" style="border:1px solid #95B8E7;float: left;"/>
			<a id="quotation_supplier_base_purchase_inquiry_btn"  href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>业务员</th>
		<td>
			<input class="easyui-validatebox" id="quotation_supplier_base_sales_man"  style="border:1px solid #95B8E7;float: left;"/>
			<a id="btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
	</tr>
</table>
<jsp:include flush="true" page="quotation_supplier_base_supplier.jsp"></jsp:include>
<jsp:include flush="true" page="quotation_supplier_base_supplier_link_man.jsp"></jsp:include>
<jsp:include flush="true" page="quotation_supplier_base_purchse_inquiry.jsp"></jsp:include>
