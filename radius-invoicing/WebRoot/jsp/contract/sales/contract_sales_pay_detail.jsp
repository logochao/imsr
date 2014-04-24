<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
var contract_sales_pay_detail_currency=null;
var contract_sales_pay_receive_type=null;
var contract_sales_pay_grd = null;
var contract_sales_pay_detail_batch_amount = null;
var contract_sales_pay_detail_deadline_time=null;
var contract_sales_pay_detail_pay = null;
$(function (){
	//销售合同支付详情列表
	contract_sales_pay_grd=$('#contract_sales_pay_grd').datagrid({
			fitColumns:true,
       		autoRowHeight:false,
       		border:false,
       		striped:true,
       		rownumbers:true,
       		collapsible:true,
       		columns:[[
       			{field:'batch',title:'款项批次',width:100,align:'center'},
       			{field:'cashType',title:'币种',width:60,formatter:cashTypeFormatter},
				{field:'amount',title:'金额',width:120,align:'center',formatter: function(value,row,index){
					 if(value!=undefined&&value!=null&&(value+"").indexOf(".")<=0){
						value=(parseInt(value)/100).toFixed(2);
					 }
					 return value;
				   }	
				 },
				{field:'validityDate',title:'款项期限',width:80,align:'center'},
				{field:'receiveType',title:'收付款方式',width:120},
				{field:'payType',title:'支付方式',width:80,formatter:payTypeFormatter},
				{field:'upperAmount',title:'人民币大写',width:220,align:'center'},
				{field:'mome',title:'备注',width:250,align:'center'}
			]]
	});

	contract_sales_pay_detail_currency=$('#contract_sales_pay_detail_currency').combobox({
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
	contract_sales_pay_receive_type=$('#contract_sales_pay_receive_type').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=600',
 		valueField: 'id',
		textField: 'name',
		onLoadSuccess:function(){
			var target = $(this);
			target.combobox("setValue",target.val());
			target.combobox('disable');
		}
 	});
 	
 	contract_sales_pay_detail_pay=$('#contract_sales_pay_detail_pay').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=400',
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
 	
 	
 	$('#contract_sales_pay_detail_batch').numberspinner({
 		min:0,
 		required:true
 	});
 	
 	contract_sales_pay_detail_deadline_time=$('#contract_sales_pay_detail_deadline_time').datebox({});
 	contract_sales_pay_detail_batch_amount=$('#contract_sales_pay_detail_batch_amount').on('focusout',function(){//输入框失去焦点
 		if(parseFloat($(this).val())*100>parseFloat($('#contract_sales_pay_detail_surplus_amount').val())*100){
 			document.getElementById('contract_sales_pay_detail_batch_amount').value='0.00';
 			$.messager.alert('提示','请输入小于当前合同总金额数','error');
 		}else{
 			//将对应的小写转为大写
 			toUpper($(this),$('#contract_sales_pay_detail_upper_rmb'));
 		}
 	});
 	$('#contract_sales_pay_detail_add_btn').on('click',function(){//支付合同明细加入按钮
 		if(parseFloat($('#contract_sales_pay_detail_total_amount').val())*100==0){
 			$.messager.alert('提示','请填写商品明细页签...','error');
 			return ;
 		}
 		if(contract_sales_pay_detail_deadline_time.datebox('getValue').length==0){
 			$.messager.alert('提示','请输入款项期限...','error');
 			return ;
 		}
 		var isExist=false;
 		var rows=contract_sales_pay_grd.datagrid('getRows');
		for(var  i=0;i<rows.length;i++){
			if(rows[i].batch==$('#contract_sales_pay_detail_batch').val()){//表示当前主键相同
				isExist=true;
				break;
			}
		}
		if(isExist){
			$.messager.alert('提示','请输入款项批次...','error');
			return ;
		}
 		addContractSalesPayDetailDataGrid();
 		contract_sales_pay_grd.datagrid('acceptChanges');
 		contract_sales_pay_detail_currency.combobox('disable');//禁用
 		contract_sales_pay_detail_pay.combobox('disable');//禁用
 		resetSalesContractPayDetail();
 	});
 	
 	//datagrid 删除按钮
 	$('#contract_sales_pay_detail_delete_btn').on('click',function(){
 		var memcached_url ='${path}/contract/manager/sales_contract_product_info_remove_memcache.html';
 		var rows=contract_sales_pay_grd.datagrid('getSelections');
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
						var memcached_data={
								contractId:$('#constract_sales_base_id').val(),//合同编号
							    memo:array.join(',')
							}
						ajaxDeleteSalesContractPayDetailGrdMemcached(memcached_url,memcached_data);
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
	var row_data =getSalesContractPayDetailGrdFormatter();
	addTargetDataGridRowData(contract_sales_pay_grd,row_data,0);
	//2.将剩余金额进行减少
	var contract_sales_pay_detail_surplus_amount = $('#contract_sales_pay_detail_surplus_amount');
	var surplus_amount = parseFloat(contract_sales_pay_detail_surplus_amount.val());
	contract_sales_pay_detail_surplus_amount.val(surplus_amount-parseFloat($('#contract_sales_pay_detail_batch_amount').val()));
	var memcached_url='${path}/contract/manager/sales_contract_pay_detail_memcache.html';
	var memcached_data =getSalesContractPayDetailFormatter();
	//3.将合同支付明细提交到内存中
	addFormatterData2Memecached(memcached_url,memcached_data);
}

function comboboxLoadSuccess(obj){
	var target = $(obj);
	var data = target.combobox("getData");
	var options = target.combobox("options");
	if(data && data.length>0){
		var fs = data[0];
		target.combobox("setValue",fs[options.valueField]);
	}
}

function resetSalesContractPayDetail(){
	$('#contract_sales_pay_detail_batch_amount').val('0.00');
	$('#contract_sales_pay_detail_upper_rmb').val('');
	//$('#contract_sales_pay_detail_deadline_time').datetime('setValue','');
	$('#contract_sale_pay_detail_memo').val('');
	var contract_sales_pay_detail_total_amount =parseFloat($('#contract_sales_pay_detail_total_amount').val())*100;//合同总金额
	var contract_sales_pay_detail_surplus_amount =parseFloat($('#contract_sales_pay_detail_surplus_amount').val())*100;//合同剩余金额
	if(contract_sales_pay_detail_surplus_amount==contract_sales_pay_detail_total_amount){
		contract_sales_pay_detail_currency.combobox('enable');//启用
		contract_sales_pay_detail_pay.combobox('enable');//启用
	}
}

/**
 *获取销售合同支付详情行数据格式化
 *@return  json
 **/
function getSalesContractPayDetailGrdFormatter(){
	var json={
		batch:$('#contract_sales_pay_detail_batch').val(),//款项批次
		cashType:contract_sales_pay_detail_currency.combobox('getValue'),//币种
		amount:parseFloat($('#contract_sales_pay_detail_batch_amount').val())*100,//金额
		validityDate:$('#contract_sales_pay_detail_deadline_time').datebox('getValue'),//款项期限
		receiveType:contract_sales_pay_receive_type.combobox('getText'),//收付款支付方式
		payType:contract_sales_pay_detail_pay.combobox('getValue'),//付款方式
		upperAmount:$('#contract_sales_pay_detail_upper_rmb').val(),//人民币大写
		mome:$('#contract_sales_pay_detail_memo').val()//备注
	};
	return json;
}
/**
 *获取符合后台的数据格式
 *@return json
 **/
function getSalesContractPayDetailFormatter(){
	var json={
			name:"销售合同支付明细",//款项名称
			contractId:$('#constract_sales_base_id').val(),//合同编号
			batch:$('#contract_sales_pay_detail_batch').val(),//款项批次
			amount:parseFloat($('#contract_sales_pay_detail_batch_amount').val())*100,//金额
			upperAmount:$('#contract_sales_pay_detail_upper_rmb').val(),//大写金额
			validityDate:parseDate($('#contract_sales_pay_detail_deadline_time').datebox('getValue')),//款项期限
			currency:contract_sales_pay_detail_currency.combobox('getValue'),//币种
			receiveType:contract_sales_pay_receive_type.combobox('getValue'),//支付方式(收付款类型)
			memo:$('#contract_sales_pay_detail_memo').val()//备注	
		};//参数
	return json;
}

/**
 * 清楚销售合同支付缓存
 *@params{} memcached_url
 *@params{} memcached_data
 **/
function ajaxDeleteSalesContractPayDetailGrdMemcached(memcached_url,memcached_data){
	$.ajax({
		url:memcached_url,
		method:'POST',
		data:memcached_data,
		success:function (data){//2.将dategrid的行数据进行删除操作
			if(data.success){
				var rows=contract_sales_pay_grd.datagrid('getSelections');
				for(var i=0;i<rows.length;i++){
					//2.将剩余金额进行减少
					var contract_sales_pay_detail_surplus_amount = $('#contract_sales_pay_detail_surplus_amount');
					var surplus_amount = parseFloat($('#contract_sales_pay_detail_surplus_amount').val());
					contract_sales_pay_detail_surplus_amount.val(surplus_amount+parseFloat(rows[i].amount)/100);
					var index=contract_sales_pay_grd.datagrid('getRowIndex',rows[i]);
					contract_sales_pay_grd.datagrid('deleteRow',index);
					contract_sales_pay_grd.datagrid('acceptChanges');//接受改变
				}
				resetSalesContractPayDetail();
			}
		},
		error: function(data){
			$.messager.alert('提示','与服务端通讯失败...','error');
		}
	});
}

/**
 * 重置销售合同支付详情列表
 **/
function resetSalesContractPayDetailForm(){
	/*
	$("input[id^='contract_sales_pay_detail']").each(function(e){
		$(this).val('');
	});*/
	$('#contract_sales_pay_detail_total_amount').val('0.00'); 
	$('#contract_sales_base_total_amount').val('0.00'); 
	$('#contract_sales_base_total_amount').val('0.00'); 
	$('#contract_sales_pay_detail_memo').val(''); 
}
/**
 * 设置销售合同支付明细
 * @params{}  _data
 **/
function setContractSalesPayDetailTab(_data){

	contract_sales_pay_grd.datagrid('loadData',{ total: 0, rows: []});
	var contract_id =_data.id;
	var payment_url='${path}/contract/manager/salescontract/sales_contract_payment_list.html';
	//1.获取销售合同支付
	$.ajax({
		url:payment_url,
		method:'POST',
		data:{contractId:contract_id},
		success:function(r){
			if(r&&r.total>0){
				var obj=r.rows[0];
				$('#contract_sales_pay_detail_currency').combobox('setValue',obj.cashType);//币种
				$('#contract_sales_pay_detail_pay').combobox('setValue',obj.paymentType);//支付方式
			}	
		},error:function(r){
			$.messager.alert('提示','访问服务发生异常....','error');
		}
	});
	//2.将缓存中的数据进行删除
	var memcached_url='${path}/contract/manager/sales_contract_pay_detail_remove_memcache.html';
	var memcached_data={
		contractId:contract_id,
		delete:true
	};
	removeFormatterData2Memecached(memcached_url,memcached_data);
	//2.根据合同编号获取销售合同明细列表
	$.ajax({
		url:'${path}/contract/manager/salescontract/sales_contract_payment_grd_list.html',
		method:'POST',
		data:{contractId:contract_id},
		success:function(r){
			if(r&&r.total>0){
				$.each(r.rows,function(index,d){
					//遍历销售合同支付明细
					//1.获取格式化数据并设置到表格里
					var row_data = salesContractPayDetailGrdFormatter(d);
					if(row_data.name.indexOf('付款')!=-1){
						setInputElementValue($('#contract_sales_contract_guarantee_pay_amount'),row_data.amount);//保函金额
						setDateboxElement($('#contract_sales_contract_guarantee_pay_time'),'setValue',row_data.validityDate);//付款日期
					}else if(row_data.name.indexOf('收款')!=-1){
						setDateboxElement($('#contract_sales_contract_guarantee_receivables_time'),'setValue',row_data.validityDate);//收款日期
					}else{//支付明细
						row_data.amount=parseFloat(row_data.amount)*100;
						addTargetDataGridRowData(contract_sales_pay_grd,row_data,0);
						//2.将数据添加到memcahed中
						var memcached_url = '${path}/contract/manager/sales_contract_pay_detail_memcache.html';//销售合同商品列表
						d.validityDate=parseDate(d.validityDate);
						addFormatterData2Memecached(memcached_url,d);
						$('#contract_sales_goods_detail_grd').datagrid('acceptChanges');
					}
				});
			}
		},error:function(r){
			$.messager.alert('提示','访问服务发生异常....','error');
		}
	});
	
	
}
function salesContractPayDetailGrdFormatter(_data){
	var json={
		name:_data.name,//款项名称
		batch:_data.batch,//款项批次
		cashType:contract_sales_pay_detail_currency.combobox('getValue'),//币种
		amount:parseFloat(_data.amount)/100,//金额
		validityDate:_data.validityDate,//款项期限
		receiveType:'销售付款',//收付款支付方式
		payType:contract_sales_pay_detail_pay.combobox('getValue'),//付款方式
		upperAmount:_data.upperAmount,//人民币大写
		mome:_data.mome//备注
	};
	return json;
}

//支付方式格式化
function payTypeFormatter(value,row,index){
	var combobox_data = contract_sales_pay_detail_pay.combobox('getData');
	for(var i=0,length=combobox_data.length;i<length;i++){
		if(combobox_data[i].id==value){
			value=combobox_data[i].name;
			break;
		}
	}
	return value;
}

//币种方式格式化
function cashTypeFormatter(value,row,index){
	var combobox_data = contract_sales_pay_detail_currency.combobox('getData');
	for(var i=0,length=combobox_data.length;i<length;i++){
		if(combobox_data[i].id==value){
			value=combobox_data[i].name;
			break;
		}
	}
	return value;
}

function clearContractSalesPayDetail(){
	setInputElementValue($('#contract_sales_pay_detail_total_amount'),'0.00');
	setInputElementValue($('#contract_sales_base_total_amount'),'0.00');
	setInputElementValue($('#contract_sales_pay_detail_surplus_amount'),'0.00');
	contract_sales_pay_grd.datagrid('loadData',{ total: 0, rows: []});
}
</script>
<div style="padding:5px 15px 0px 15px;">
<table class="table" style="width: 100%;" >
	<tr>
		<th>合同总额</th>
		<td>
			<input  id="contract_sales_pay_detail_total_amount" style="background:#eee;border:1px solid #95B8E7;" readonly="readonly" value="0.00"/>
			<input type="hidden"  id="contract_sales_base_total_amount" style="background:#eee;border:1px solid #95B8E7;" value="0.00"/>
			<input type="hidden"  id="contract_sales_pay_detail_surplus_amount" value="0.00"/>
		</td>
		<th>人民币大写</th>
		<td colspan="3"><input id="contract_sales_base_upper_rmb" style="background:#eee;width: 400px;border:1px solid #95B8E7;" readonly="readonly"/></td>
		<th>币种</th>
		<td><input id="contract_sales_pay_detail_currency"/></td>
	</tr>
	<tr>
		<th>款项批次</th>
		<td><input id="contract_sales_pay_detail_batch" value="1"/></td>
		<th>款项期限</th>
		<td><input id="contract_sales_pay_detail_deadline_time"/></td>
		<th>收付款方式</th>
		<td>
			<input id="contract_sales_pay_receive_type" value="601"/>
		</td>
		<th>支付方式</th>
		<td><input id="contract_sales_pay_detail_pay"/></td>
	</tr>
	<tr>
		<th>金额</th>
		<td>
		<input style="width: 100px;border:1px solid #95B8E7;" id="contract_sales_pay_detail_batch_amount" type="text"  class="easyui-validatebox"  name="name" data-options="validType:'numberic(\'#contract_sales_pay_detail_total_amount\')',missingMessage:'请输入金额',invalidMessage:'请输入正确的格式'"/>
		<input type="text" name="name" style="width: 20px;background:#eee;" readonly="readonly" value="元"/>
		</td>
		<th>人民币大写</th>
		<td colspan="5"><input  style="width: 400px;background:#eee;border:1px solid #95B8E7;" type="text"  id="contract_sales_pay_detail_upper_rmb" readonly="readonly"/></td>
	</tr>
	<tr>
		<th>备注</th>
		<td colspan="4"><input style="width: 400px;border:1px solid #95B8E7;" id="contract_sales_pay_detail_memo" /></td>
		<th colspan="2" style="text-align: center;"><input type="checkbox"/> 加入后不置空</th>
		<td>
			<a id="contract_sales_pay_detail_add_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" plain="true">加入(A)</a>
			<a id="contract_sales_pay_detail_delete_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-remove'" plain="true">删除(D)</a>
		</td>
	</tr>
</table>
</div>
<div id="contract_sales_pay_grd">
	<%--销售合同支付方式 --%>
</div>