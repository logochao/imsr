<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
var purchase_contract_pay_detail_currency = null ;//货币下拉列表
var purchase_contract_pay_detail_pay = null;//支付方式下拉列表
var purchase_contract_pay_detail_pay_grd = null;//采购订单列表
$(function (){
	//----------------------------初始化---------------------------------
	purchase_contract_pay_detail_currency=$('#purchase_contract_pay_detail_currency').combobox({
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
	//支付方式
	purchase_contract_pay_detail_pay=$('#purchase_contract_pay_detail_pay').combobox({
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
 	
 	$('#purchase_contract_pay_detail_batch').numberspinner({
 		min:0,
 		required:true
 	});
 	
 	$('#purchase_contract_pay_detail_deadline_time').datebox({
 	});
	//销售合同支付详情列表
	purchase_contract_pay_detail_pay_grd=$('#purchase_contract_pay_detail_pay_grd').datagrid({
       		autoRowHeight:false,
       		border:false,
       		striped:true,
       		rownumbers:true,
       		collapsible:true,
       		columns:[[
       			{field:'batch',title:'款项批次',width:100,align:'center'},
       			{field:'cashType',title:'币种',width:60,align:'center'},
				{field:'amount',title:'金额',width:120,align:'center',formatter: function(value,row,index){
					 if(value!=undefined&&value!=null&&(value+"").indexOf(".")<=0){
						value=(parseInt(value)/100).toFixed(2);
					 }
					 return value;
				  }	
				},
				{field:'validityDate',title:'款项期限',width:80,align:'center'},
				{field:'receiveType',title:'支付方式',width:120,align:'center'},
				{field:'upperAmount',title:'人民币大写',width:220,align:'center'},
				{field:'mome',title:'备注',width:250,align:'center'}
			]]
	});
	
	var purchase_contract_pay_detail_amount=$('#purchase_contract_pay_detail_amount').on('focusout',function(){//输入框失去焦点
 		if(parseFloat($(this).val())*100>parseFloat($('#purchase_contract_pay_detail_total_amount').val())*100){
 			$(this).val('0.00');
 			$.messager.alert('提示','请输入小于当前合同总金额数','error');
 		}else{
 			//将对应的小写转为大写
 			toUpper($(this),$('#purchase_contract_pay_detail_upper_rmb'));
 		}
 	});
 	
 	
 	$('#purchase_contract_pay_detail_add_btn').on('click',function(){
 		if(parseFloat($('#purchase_contract_pay_detail_amount').val())>0){
 			var rows=purchase_contract_pay_detail_pay_grd.datagrid('getRows');
	 		var row =null;//表示需要更改的对象
	 		if(rows==null||rows.length==0){
	 			addPurchaseContractPayDetailDataGrid();
	 			purchase_contract_pay_detail_pay_grd.datagrid('acceptChanges');
	 		}else if(rows.length>0){
	 			//1.判断是否相同的批次
	 			var isExist=false;
	 			for(var  i=0;i<rows.length;i++){
		 			if(rows[i].batch==$('#purchase_contract_pay_detail_batch').val()){//表示当前主键相同
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
	 				addPurchaseContractPayDetailDataGrid();
	 			}
	 		}
 		}else{
 			$.messager.alert('提示','请输入大于0元金额,再进行操作...','error');
 		}
 	});
 	//支付详情删除按钮
 	$('#purchase_contract_pay_detail_delete_btn').on('click',function(){
 		var rows=purchase_contract_pay_detail_pay_grd.datagrid('getSelections');
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
							url:'${path}/contract/manager/purchaseContract/contract_pay_info_remove_memcached.html',
							method:'POST',
							data:{
								contractId:$('#purchase_contract_base_id').val(),//合同编号
								memo:array.join(',')
							},
							success:function (data){//2.将dategrid的行数据进行删除操作
								if(data&&data.success){
									for(var i=0;i<rows.length;i++){
										var index=purchase_contract_pay_detail_pay_grd.datagrid('getRowIndex',rows[i]);
										purchase_contract_pay_detail_pay_grd.datagrid('deleteRow',index);
										purchase_contract_pay_detail_pay_grd.datagrid('acceptChanges');//接受改变
									}
								}
							},
							error: function(data){
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
	//---------------------------------业务处理-----------------------------------------
});




//添加合同支付明细
function addPurchaseContractPayDetailDataGrid(){
	var row_data = getPurchaseContractPayDetailPayGrdRowFormatter();
	//1.添加合同支付明细
	purchase_contract_pay_detail_pay_grd.datagrid('appendRow',row_data);
	//2.将剩余金额进行减少
	var purchase_contract_pay_detail_surplus_amount = $('#purchase_contract_pay_detail_surplus_amount');
	var surplus_amount = parseFloat(purchase_contract_pay_detail_surplus_amount.val());
	purchase_contract_pay_detail_surplus_amount.val(surplus_amount-parseFloat($('#contract_purchase_pay_detail_amount').val()));
	console.info(purchase_contract_pay_detail_surplus_amount.val());
	//3.将合同支付明细提交到内存中
	var memcached_data=getPurchaseContractPayDetailMemcached(row_data);
	var memcached_url ='${path}/contract/manager/purchaseContract/contract_pay_info_memcached.html';
	//将缓存数据添加到缓存对象中
	addFormatterData2Memecached(memcached_url,memcached_data);
}
/**
 * 获取采购合同支付明细格式化行数据
 **/
function getPurchaseContractPayDetailPayGrdRowFormatter(){
	var json = {
		id:'',//款项编号
		name:'采购合同支付明细',//款项名称
		contractId:$('#purchase_contract_base_id').val(),//合同编号
		batch:$('#purchase_contract_pay_detail_batch').val(),//款项批次
		amount:$('#purchase_contract_pay_detail_amount').val(),//金额
		upperAmount:$('#purchase_contract_pay_detail_upper_rmb').val(),//大写金额
		receiveType:purchase_contract_pay_detail_pay.combobox('getText'),//收付款类型
		validityDate:$('#contract_purchase_pay_detail_deadline_time').datebox('getValue'),//款项期限
		stats:'',//状态
		cashType:purchase_contract_pay_detail_currency.combobox('getText'),//币种
		memo:$('#contract_sale_pay_detail_memo').val()//备注
	};
	
	return json;
}
/**
 * 获取采购订单支付详情缓存json对象
 * @params{} row_data 支付详情datagrid row data 
 * @return   json
 **/
function getPurchaseContractPayDetailMemcached(row_data){
	var json = {
		id:row_data.id,//款项编号
		name:row_data.name,//款项名称
		contractId:row_data.contractId,//合同编号
		batch:contractId.batch,//款项批次
		amount:parseFloat(row_data.amount)*100,//金额
		upperAmount:row_data.upperAmount,//大写金额
		receiveType:purchase_contract_pay_detail_pay.combobox('getValue'),//收付款类型
		validityDate:parseDate(row_data.validityDate),//款项期限
		stats:row_data.stats,//状态
		cashType:purchase_contract_pay_detail_currency.combobox('getValue'),//币种
		memo:row_data.memo//备注
	};
	
	return json;
}

</script>
<table class="table" style="width: 100%;">
	<tr>
		<th>合同总额</th>
		<td>
			<input  id="purchase_contract_pay_detail_total_amount" value="2" style="background:#eee;border:1px solid #95B8E7;" readonly="readonly"/>
			<!-- 剩余金额 -->
			<input type="hidden"  id="purchase_contract_pay_detail_surplus_amount"/>
		</td>
		<th>币种</th>
		<td><input id="purchase_contract_pay_detail_currency"/></td>
		<th>付款方式</th>
		<td><input id="purchase_contract_pay_detail_pay"/></td>
		<th>款项批次</th>
		<td><input id="purchase_contract_pay_detail_batch" value="1"/></td>
	</tr>
	<tr>
		<th>金额</th>
		<td>
		<input style="width: 100px;border:1px solid #95B8E7;" id="purchase_contract_pay_detail_amount" value="0.00" type="text"  class="easyui-validatebox"  name="name" data-options="validType:'numberic(\'#purchase_contract_pay_detail_total_amount\')',missingMessage:'请输入金额',invalidMessage:'请输入正确的格式'"/>
		<input type="text" name="name" style="width: 20px;background:#eee;" readonly="readonly" value="元"/>
		</td>
		<th>人民币大写</th>
		<td colspan="3"><input  style="width: 400px;background:#eee;border:1px solid #95B8E7;" type="text"  id="purchase_contract_pay_detail_upper_rmb" /></td>
		<th>款项期限</th>
		<td><input id="purchase_contract_pay_detail_deadline_time"/></td>
	</tr>
	<tr>
		<th>备注</th>
		<td colspan="4"><input style="width: 400px;border:1px solid #95B8E7;" id="contract_sale_pay_detail_memo" /></td>
		<th colspan="2" style="text-align: center;"><input type="checkbox"/> 加入后不置空</th>
		<td>
			<a id="purchase_contract_pay_detail_add_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" plain="true">加入(A)</a>
			<a id="purchase_contract_pay_detail_delete_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-remove'" plain="true">删除(D)</a>
		</td>
	</tr>
</table>
<div id="purchase_contract_pay_detail_pay_grd">
	<%--销售合同支付方式 --%>
</div>