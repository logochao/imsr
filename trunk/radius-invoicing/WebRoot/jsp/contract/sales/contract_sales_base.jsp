<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
<!--
var contract_sales_base_status = null;//合同状态
var contract_sales_base_contract_type = null;//合同类型
$(function(){
	//合同状态
	contract_sales_base_status=$('#contract_sales_base_status').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=2400',
 		valueField: 'id',
		textField: 'name',
		onLoadSuccess:function(){
			var target = $(this);
			target.combobox("setValue",target.val());
			target.combobox('disable');
		}
 	});
 	//合同类型
 	contract_sales_base_contract_type=$('#contract_sales_base_contract_type').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=1',
 		valueField: 'id',
		textField: 'name',
		onLoadSuccess:function(){
			var target = $(this);
			var data = target.combobox("getData");
			var options = target.combobox("options");
			if(data && data.length>0){
				for(var i=0;i<data.length;i++){
					var fs = data[i];
					if(fs[options.valueField]==target.val()){//如果设置的值等于默认值，将将对应的显示内容显示
						target.combobox("setValue",fs[options.textField]);
					}
				}
			}
			target.combobox('disable');//设置当前下拉列表不可用
		}
 	});
 	//客户查询对话框按钮
 	$('#contract_sales_base_custmer_search_btn').on('click',function(){
 		contract_sales_base_customer_dialog.dialog('open');
 	});
 	//联系人查询对话框按钮
 	$('#contract_sales_base_link_man_search_btn').on('click',function(){
		if(!$('#contract_sales_base_customer_id').val().length>0){
			$.messager.alert('提示','请选择客户信息...','error');
			return ;
 		}
 		contract_sales_base_custmer_link_man_dialog.dialog('open');
 	});
 	contract_sales_pay_receive_type=$('#contract_sales_pay_receive_type').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=600',
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
});

/**
 *设置销售合同基本信息
 *@params{} row_data 销售合同列表
 **/
function setContractSalesBaseInfo(row_data){
	setInputElementValue($('#constract_sales_base_id'),row_data.id);//销售合同编号
	contract_sales_base_status.combobox('setValue',row_data.status);//状态
	setInputElementValue($('#contract_sales_base_customer_name'),row_data.customerName);//客户名称
	setInputElementValue($('#contract_sales_base_customer_id'),row_data.customerId);//客户编号
	setDateboxElement($('#contract_sales_base_order_time'),'setValue',row_data.orderedDate);//订货日期
	setDateboxElement($('#contract_sales_base_delivery_date'),'setValue',row_data.deliveryDate);//送货日期
	setInputElementValue($('#contract_sales_base_link_man'),row_data.man);//联系人
	setInputElementValue($('#contract_sales_base_link_tel'),row_data.tel);//联系电话
	setInputElementValue($('#contract_sales_base_link_mobile'),row_data.mobile);//联系人手机
	setInputElementValue($('#contract_sales_base_link_fax'),row_data.fax);//传真
	setInputElementValue($('#contract_sales_base_delivery_point'),row_data.deliveryPoint);//送货地点
	setInputElementValue($('#contract_sales_base_sales_man'),row_data.salesMan);//业务员
	setInputElementValue($('#contract_sales_contract_mome'),row_data.memo);//备注
}
/**
 * 清空销售合同基本信息
 **/
function clearContractSalesBase(){
	$("input[id^='contract_sales_base_']").each(function(e){
			$(this).val('');
	})
	$('#contract_sales_base_order_time').datebox('setValue','');
	$('#contract_sales_base_delivery_date').datebox('setValue','');
	$('#contract_sales_contract_mome').val();
}
//-->


</script>
<table class="table" style="width: 99.5%;">
	<tr>
		<th>合同编号</th>
		<td><input class="easyui-validatebox" style="background:#eee;width: 150px;border:1px solid #95B8E7;" id="constract_sales_base_id" type="text" readonly="readonly"  data-options=""/></td>
		<th>状态</th>
		<td colspan="3"><input id="contract_sales_base_status"  class="easyui-validatebox" class="easyui-combobox"  data-options="" value="2401"/></td>
		<th>订货日期</th>
		<td><input class="easyui-validatebox Wdate" type="text" onClick="WdatePicker()" id="contract_sales_base_order_time"/></td>
	</tr>
	<tr>
		<th>客户</th>
		<td colspan="5">
			<input  type="text"  id="contract_sales_base_customer_name" style="width: 300px;border:1px solid #95B8E7;float: left;" readonly="readonly" data-options=""/> 
			<input  type="hidden" id="contract_sales_base_customer_id" readonly="readonly" data-options=""/> 
			<a id="contract_sales_base_custmer_search_btn" href="#" style="float: left;"  class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
			<a id="contract_sales_base_custmer_add_btn" href="#" style="float: left;" class="easyui-linkbutton" plain="true" data-options="iconCls:'icon-mini_add'"></a>
		</td>
		<th>送货日期</th>
		<td><input class="easyui-validatebox Wdate" onClick="WdatePicker()" type="text" id="contract_sales_base_delivery_date" data-options=""/></td>
	</tr>
	<tr>
		<th>联系人</th>
		<td>
			<input id="contract_sales_base_link_man" style="border:1px solid #95B8E7;float: left;" class="easyui-validatebox" type="text" data-options=""/>
			<a id="contract_sales_base_link_man_search_btn" style="float: left;" href="#" class="easyui-linkbutton" plain="true" data-options="disabled:true"><font style="font-size:3ex">...</font></a>
			<a id="contract_sales_base_link_man_add_btn" style="float: left;" href="#" class="easyui-linkbutton" plain="true" data-options="iconCls:'icon-mini_add'"></a>
		</td>
		<th>办公电话</th>
		<td><input class="easyui-validatebox" type="text" id="contract_sales_base_link_tel" style="border:1px solid #95B8E7;" data-options=""/></td>
		<th>手机号码</th>
		<td><input class="easyui-validatebox" type="text" id="contract_sales_base_link_mobile" style="border:1px solid #95B8E7;" data-options=""/></td>
		<th>传真</th>
		<td><input class="easyui-validatebox" type="text" id="contract_sales_base_link_fax" style="border:1px solid #95B8E7;" data-options=""/></td>
	</tr>
	<tr>
		<th>送货地址</th>
		<td colspan="3"><input class="easyui-validatebox" type="text" style="width: 350px;border:1px solid #95B8E7;" id="contract_sales_base_delivery_point" data-options=""/></td>
		<th>业务员</th>
		<td>
			<input class="easyui-validatebox" type="text" name="contract_sales_base_sales_man" style="border:1px solid #95B8E7;float:left;" data-options=""/>
			<a id="btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<td colspan="2"></td>
	</tr>
	<tr>
		<th>合同类型</th>
		<td><input class="easyui-validatebox" id="contract_sales_base_contract_type" type="text" data-options="" value="2"/></td>
		<td colspan="4"></td>
		<th colspan="2" style="text-align: center;"><input type="checkbox" id="contract_sales_base_checkbox" onclick=""/>转保函付款申请</th>
	</tr>
</table>
<jsp:include flush="true" page="contract_sales_base_customer.jsp"></jsp:include>
<jsp:include flush="true" page="contract_sales_base_link_man.jsp"></jsp:include>