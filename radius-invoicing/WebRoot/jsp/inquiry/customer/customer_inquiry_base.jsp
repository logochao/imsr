<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
var customer_inquiry_base_status = null;
var customer_inquiry_base_cash_type = null;//货币单位
$(function(){
	//合同状态
	customer_inquiry_base_status=$('#customer_inquiry_base_status').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=6000',
 		valueField: 'id',
		textField: 'name',
		onLoadSuccess:function(){
			var target = $(this);
			target.combobox("setValue",target.val());
			target.combobox('disable');
		}
 	});
 	
 	customer_inquiry_base_cash_type=$('#customer_inquiry_base_cash_type').combobox({
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
 	$('#customer_inquiry_base_custmer_btn').on('click',function(){
 		if(validataCustomerInquiryBaseId()){
 			customer_inquiry_base_customer_dialog.dialog('open');
 		}
 	});
 	//联系人查询对话框按钮
 	$('#customer_inquiry_base_custmer_link_man_btn').on('click',function(){
 		if(validataCustomerInquiryBaseId()){
	 		if($('#customer_inquiry_base_customer_id').val().length==0){
				$.messager.alert('提示','请请选择客户信息...','error');
				return;
			}
			customer_inquiry_base_custmer_link_man_dialog.dialog('open');
 		}
 	});
});

/**
 *清空基本信息
 **/
function clearCustomerInquiryBaseInfo(){
	$("input[id^='customer_inquiry_base_']").each(function(e){
		$(this).val('');
	})
	customer_inquiry_base_status.combobox('setValue','2401');
	var data = customer_inquiry_base_cash_type.combobox("getData");
	var options = customer_inquiry_base_cash_type.combobox("options");
	if(data && data.length>0){
		var fs = data[0];
		customer_inquiry_base_cash_type.combobox("setValue",fs[options.valueField]);
	}
}

/**
 *设置客户询价基本信息
 *@params{} row_data
 **/
function setCustomerInquiryBaseInfo(row_data){
	console.info(row_data.salesman);
		$('#customer_inquiry_base_id').val(row_data.salesInquiryId);//销售询价单编号
		$('#customer_inquiry_base_customer_id').val(row_data.customerId);//客户编号
		$('#customer_inquiry_base_customer_name').val(row_data.customerAb);//客户简称
		customer_inquiry_base_cash_type.combobox("setValue",row_data.cashType);//币种
		$('#customer_inquiry_base_delivery_point').val(row_data.address);//送货地址
		$('#customer_inquiry_base_link_man').val(row_data.man);//联系人
		$('#customer_inquiry_base_link_mobile').val(row_data.mobile);//联系人手机
		$('#customer_inquiry_base_link_tel').val(row_data.tel);//联系电话
		$('#customer_inquiry_base_link_fax').val(row_data.fax);//联系fax
		$('#customer_inquiry_base_order_time').val(row_data.inquiryDate);//询价日期
		$('#customer_inquiry_base_order_end_time').val(row_data.latestQuotateDate);//最迟报价日期
		$('#customer_inquiry_base_sales_man').val(row_data.salesman);//业务员
		customer_inquiry_base_status.combobox('setValue',row_data.status);//状态
}
/**
 *检查客户询价单号
 **/
function validataCustomerInquiryBaseId(){
	if($('#customer_inquiry_base_id').val().length==0){
		$.messager.alert('提示','请点击新建按钮,构建新的客户询价单...','error');
		return false;
	}
	return true;
}
//-->
</script>

<table class="table" style="width: 100%;">
	<tr>
		<th>客户询价号</th>
		<td><input class="easyui-validatebox" style="background:#eee;width: 150px;border:1px solid #95B8E7;" id="customer_inquiry_base_id" readonly="readonly"/></td>
		<th>状态</th>
		<td colspan="3"><input id="customer_inquiry_base_status" style="border:1px solid #95B8E7;"  class="easyui-validatebox" class="easyui-combobox" value="6001"/></td>
		<th>询价日期</th>
		<td><input class="easyui-validatebox Wdate"  onClick="WdatePicker()" style="border:1px solid #95B8E7;" id="customer_inquiry_base_order_time"/></td>
	</tr>
	<tr>
		<th>客户</th>
		<td colspan="3">
			<input  id="customer_inquiry_base_customer_name" style="width: 300px;border:1px solid #95B8E7;float: left;" readonly="readonly"/> 
			<input  type="hidden" id="customer_inquiry_base_customer_id" readonly="readonly"/> 
			<a id="customer_inquiry_base_custmer_btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>货币单位</th>
		<td>
			<input id="customer_inquiry_base_cash_type" >
		</td>
		<th>最迟报价日期</th>
		<td><input class="easyui-validatebox Wdate"  onClick="WdatePicker()" style="border:1px solid #95B8E7;" id="customer_inquiry_base_order_end_time" data-options=""/></td>
	</tr>
	<tr>
		<th>联系人</th>
		<td>
			<input id="customer_inquiry_base_link_man" class="easyui-validatebox" style="border:1px solid #95B8E7;float: left;"/>
			<a id="customer_inquiry_base_custmer_link_man_btn"  href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>办公电话</th>
		<td><input class="easyui-validatebox" style="border:1px solid #95B8E7;" id="customer_inquiry_base_link_tel" /></td>
		<th>手机号码</th>
		<td><input class="easyui-validatebox" style="border:1px solid #95B8E7;" id="customer_inquiry_base_link_mobile" /></td>
		<th>传真</th>
		<td><input class="easyui-validatebox" style="border:1px solid #95B8E7;" id="customer_inquiry_base_link_fax"/></td>
	</tr>
	<tr>
		<th>送货地址</th>
		<td colspan="3"><input class="easyui-validatebox" style="width: 350px;border:1px solid #95B8E7;" id="customer_inquiry_base_delivery_point"/></td>
		<th>业务员</th>
		<td colspan="3">
			<input class="easyui-validatebox" id="customer_inquiry_base_sales_man"  style="border:1px solid #95B8E7;float: left;"/>
			<a id="btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
	</tr>
</table>
<jsp:include flush="true" page="customer_inquiry_base_customer.jsp"></jsp:include>
<jsp:include flush="true" page="customer_inquiry_base_customer_link_man.jsp"></jsp:include>