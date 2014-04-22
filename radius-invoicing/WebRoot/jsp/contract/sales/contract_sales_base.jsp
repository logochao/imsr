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
 	//订货日期
 	$('#contract_sales_base_order_time').datebox({});
 	//送货日期
 	$('#contract_sales_base_delivery_date').datebox({});
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
});
//-->
</script>
<table class="table" style="width: 100%;">
	<tr>
		<th>合同编号</th>
		<td><input class="easyui-validatebox" style="background:#eee;width: 150px;border:1px solid #95B8E7;" id="constract_sales_base_id" type="text" readonly="readonly"  data-options="" value="123456789"/></td>
		<th>状态</th>
		<td colspan="3"><input id="contract_sales_base_status"  class="easyui-validatebox" class="easyui-combobox"  data-options="" value="2401"/></td>
		<th>订货日期</th>
		<td><input class="easyui-validatebox" type="text" id="contract_sales_base_order_time"/></td>
	</tr>
	<tr>
		<th>客户</th>
		<td colspan="5">
			<input  type="text"  id="contract_sales_base_customer_name" style="width: 300px;border:1px solid #95B8E7;" readonly="readonly" data-options=""/> 
			<input  type="hidden" id="contract_sales_base_customer_id" readonly="readonly" data-options=""/> 
			<a id="contract_sales_base_custmer_search_btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
			<a id="contract_sales_base_custmer_add_btn" href="#" class="easyui-linkbutton" plain="true" data-options="iconCls:'icon-mini_add'"></a>
		</td>
		<th>送货日期</th>
		<td><input class="easyui-validatebox" type="text" id="contract_sales_base_delivery_date" data-options=""/></td>
	</tr>
	<tr>
		<th>联系人</th>
		<td>
			<input id="contract_sales_base_link_man" style="border:1px solid #95B8E7;" class="easyui-validatebox" type="text" data-options=""/>
			<a id="contract_sales_base_link_man_search_btn"  href="#" class="easyui-linkbutton" plain="true" data-options="disabled:true"><font style="font-size:3ex">...</font></a>
			<a id="contract_sales_base_link_man_add_btn" href="#" class="easyui-linkbutton" plain="true" data-options="iconCls:'icon-mini_add'"></a>
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
			<input class="easyui-validatebox" type="text" name="contract_sales_base_sales_man" style="border:1px solid #95B8E7;" data-options=""/>
			<a id="btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th colspan="2" style="text-align: center;"><input type="checkbox" id="contract_sales_base_checkbox" onclick=""/>转保函付款申请</th>
	</tr>
	<tr>
		<th>合同类型</th>
		<td><input class="easyui-validatebox" id="contract_sales_base_contract_type" type="text" data-options="" value="2"/></td>
		<th>合同总金额</th>
		<td><input id="contract_sales_base_total_amount" style="background:#eee;border:1px solid #95B8E7;" readonly="readonly"/></td>
		<th>人民币大写</th>
		<td colspan="3"><input id="contract_sales_base_upper_rmb" style="background:#eee;width: 400px;border:1px solid #95B8E7;" readonly="readonly"/></td>
	</tr>
</table>
<jsp:include flush="true" page="contract_sales_base_customer.jsp"></jsp:include>
<jsp:include flush="true" page="contract_sales_base_link_man.jsp"></jsp:include>