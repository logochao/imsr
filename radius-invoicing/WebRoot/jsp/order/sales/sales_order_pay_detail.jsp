<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
var sales_order_pay_detail_currency=null;
var sales_order_pay_detail_pay=null;
$(function (){
	sales_order_pay_detail_currency=$('#sales_order_pay_detail_currency').combobox({
 		url:'/stock/common/system/category_code_list.html?parentId=800',
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
	sales_order_pay_detail_pay=$('#sales_order_pay_detail_pay').combobox({
 		url:'/stock/common/system/category_code_list.html?parentId=400',
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
 	
 	$('#sales_order_pay_detail_batch').numberspinner({
 		min:0,
 		required:true
 	});
 	
 	$('#sales_order_pay_detail_deadline_time').datebox({
 		//required:true
 	});
 	var sales_order_pay_detail_amount=$('#sales_order_pay_detail_amount').on('focusout',function(){//输入框失去焦点
 		if(parseFloat($(this).val())*100>parseFloat($('#sales_order_pay_detail_surplus_amount').val())*100){
 			//$('#sales_order_pay_detail_amount').attr('value','0');
 			document.getElementById('sales_order_pay_detail_amount').value='0.00';
 			$.messager.alert('提示','请输入小于当前合同总金额数','error');
 		}else{
 			//将对应的小写转为大写
 			toUpper($(this),$('#sales_order_pay_detail_upper_rmb'));
 		}
 	});
 	$('#sales_order_pay_detail_add_btn').on('click',function(){//支付合同明细加入按钮
 		var rows=sales_order_pay_grd.datagrid('getRows');
 		var row =null;//表示需要更改的对象
 		if(rows==null||rows.length==0){
 			addContractSalesPayDetailDataGrid();
 			sales_order_pay_grd.datagrid('acceptChanges');
 		}else if(rows.length>0){
 			//1.判断是否相同的批次
 			var isExist=false;
 			for(var  i=0;i<rows.length;i++){
	 			if(rows[i].batch==$('#sales_order_pay_detail_batch').val()){//表示当前主键相同
	 				isExist=true;
	 				break;
	 			}
 			}
 			if(isExist){//2.如果相同时，还选择需要保存,则更新对应的row
 				//弹出对话框
 				$.messager.confirm('提示','是否确定要修改当前已经存在的信息',function(r){
 					if(r){//再更改相关信息
 						$.messager.alert('提示','暂时不做任何处理...',warning);
 					}
 				});
 			}else{//3.如果不相同时,则直接添加
 				addContractSalesPayDetailDataGrid();
 			}
 		}
 	});
 	
 	//datagrid 删除按钮
 	$('#sales_order_pay_detail_delete_btn').on('click',function(){
 		var rows=sales_order_pay_grd.datagrid('getSelections');
 		if(rows.length>0){
 			//弹出对话框
			$.messager.confirm('提示','是否确定要删除当前已经选择的行信息',function(r){
				if(r){
					//1.删除数据
					var array=[];
					for(var i=0;i<rows.length;i++){
						array.push(rows[i].batch);
					}
					if(array.length>0){
						$.ajax({
							url:'/stock/contract/manager/sales_contract_product_info_remove_memcache.html',
							method:'POST',
							data:{
								contractId:$('#sales_order_purchase_base_id').val(),//合同编号
								memo:array.join(',')
							},
							success:function (data){//2.将dategrid的行数据进行删除操作
								console.info(data);
								if(data.success){
									for(var i=0;i<rows.length;i++){
										var index=sales_order_pay_grd.datagrid('getRowIndex',rows[i]);
										sales_order_pay_grd.datagrid('deleteRow',index);
										sales_order_pay_grd.datagrid('acceptChanges');//接受改变
									}
								}
							},
							error: function(data){
								console.info(data);
								$.messager.alert('提示','处理缓存失败...',error);
							}
						});
					}						
				}
			});
 		}else{
 			$.messager.alert('提示','请选择待删除的行信息','error');
 		}
 	});
});
//添加合同支付明细
function addContractSalesPayDetailDataGrid(){
	//1.添加合同支付明细
	sales_order_pay_grd.datagrid('appendRow',{
			batch:$('#sales_order_pay_detail_batch').val(),//款项批次
			cashType:sales_order_pay_detail_currency.combobox('getText'),//币种
			amount:$('#sales_order_pay_detail_amount').val(),//金额
			validityDate:$('#sales_order_pay_detail_deadline_time').datebox('getValue'),//款项期限
			receiveType:sales_order_pay_detail_pay.combobox('getText'),//支付方式
			upperAmount:$('#sales_order_pay_detail_upper_rmb').val(),//人民币大写
			mome:$('#sales_order_pay_detail_memo').val()//备注
	});
	//2.将剩余金额进行减少
	var sales_order_pay_detail_surplus_amount = $('#sales_order_pay_detail_surplus_amount');
	var surplus_amount = parseFloat(sales_order_pay_detail_surplus_amount.val());
	sales_order_pay_detail_surplus_amount.val(surplus_amount-parseFloat($('#sales_order_pay_detail_amount').val()));
	console.info(sales_order_pay_detail_surplus_amount.val());
	//3.将合同支付明细提交到内存中
	$.ajax({
		url:'/stock/contract/manager/sales_contract_pay_detail_memcache.html',//请求地址
		method:'POST',//请求方式
		data:{
				name:"销售合同支付明细",//款项名称
				contractId:$('#sales_order_purchase_base_id').val(),//合同编号
				batch:$('#sales_order_pay_detail_batch').val(),//款项批次
				amount:parseFloat($('#sales_order_pay_detail_amount').val())*100,//金额
				upperAmount:$('#sales_order_pay_detail_upper_rmb').val(),//大写金额
				receiveType:"",//收付款类型
				validityDate:parseDate($('#sales_order_pay_detail_deadline_time').datebox('getValue')),//款项期限
				stats:'0',//状态
				currency:sales_order_pay_detail_currency.combobox('getValue'),//币种
				receiveType:sales_order_pay_detail_pay.combobox('getValue'),//支付方式
				memo:$('#sales_order_pay_detail_memo').val()//备注	
		},//参数
		success:function (data){
			console.info(data);
		},
		error:function(data){
			console.info("与后台通讯失败.. ");
		}
	});
}

function comboboxLoadSuccess(obj){
	console.info(obj);
	var target = $(obj);
	var data = target.combobox("getData");
	var options = target.combobox("options");
	if(data && data.length>0){
		var fs = data[0];
		target.combobox("setValue",fs[options.valueField]);
	}
}
</script>
<table class="table" style="width: 100%;">
	<tr>
		<th>合同总额</th>
		<td>
			<input  id="sales_order_pay_detail_total_amount" style="background:#eee;" readonly="readonly"/>
			<!-- 剩余金额 -->
			<input type="hidden"  id="sales_order_pay_detail_surplus_amount"/>
		</td>
		<th>币种</th>
		<td><input id="sales_order_pay_detail_currency"/></td>
		<th>付款方式</th>
		<td><input id="sales_order_pay_detail_pay"/></td>
		<th>款项批次</th>
		<td><input id="sales_order_pay_detail_batch" value="1"/></td>
	</tr>
	<tr>
		<th>金额</th>
		<td>
		<input style="width: 100px;" id="sales_order_pay_detail_amount" type="text" class="easyui-validatebox"  name="name" data-options="validType:'numberic(\'#sales_order_pay_detail_total_amount\')',missingMessage:'请输入金额',invalidMessage:'请输入正确的格式'"/>
		<input type="text" name="name" style="width: 20px;background:#eee;" readonly="readonly" value="元"/>
		</td>
		<th>人民币大写</th>
		<td colspan="3"><input  style="width: 400px;background:#eee;" type="text"  id="sales_order_pay_detail_upper_rmb" /></td>
		<th>款项期限</th>
		<td><input id="sales_order_pay_detail_deadline_time"/></td>
	</tr>
	<tr>
		<th>备注</th>
		<td colspan="4"><input style="width: 400px;" id="sales_order_pay_detail_memo"/></td>
		<th colspan="2" style="text-align: center;"><input type="checkbox"/> 加入后不置空</th>
		<td>
			<a id="sales_order_pay_detail_add_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" plain="true">加入(A)</a>
			<a id="sales_order_pay_detail_delete_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-remove'" plain="true">删除(D)</a>
		</td>
	</tr>
</table>
<div id="sales_order_pay_grd">
	<%--销售合同支付方式 --%>
</div>