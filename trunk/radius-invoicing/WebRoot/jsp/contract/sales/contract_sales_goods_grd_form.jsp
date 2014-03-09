<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
var constract_sales_goods_grd_form_dialog=null;
var constract_sales_goods_grd_form_grd=null;
$(function(){
	$('#constract_sales_goods_grd_form_btn').on('click',function(){//商品选择按钮
		constract_sales_goods_grd_form_dialog=$('#constract_sales_goods_grd_form_dialog').show().dialog({
			title:'选择商品',
 			 width:800,
 			 height:400,
 			 collapsible:true,//向上缩小按钮
 			 maximizable:true,
 			 modal:true
		});
	});
	$('#constract_sales_goods_grd_form_search_btn').on('click',function(){//查询商品信息
		constract_sales_goods_grd_form_grd.datagrid('options').url='${path}/goods/split_page.html';
 		constract_sales_goods_grd_form_grd.datagrid('load',{
 			name:$('#constract_sales_goods_grd_form_goods_name').val(),
 			property:$('#constract_sales_goods_grd_form_goods_type').val(),
 			realName:$('#constract_sales_goods_grd_form_goods_real_name').val()
 		});
	});
	
	
	constract_sales_goods_grd_form_grd=$('#constract_sales_goods_grd_form_grd').datagrid({
 				fit:true,
        		autoRowHeight:false,
        		border:false,
        		striped:true,
        		rownumbers:true,
        		collapsible:true,
        		columns:[[
        			{field:'id',title:'商品编号',width:80},
        			{field:'name',title:'商品名称',width:100},
        			{field:'realName',title:'真实品名',width:100},
					{field:'property',title:'商品性质',width:100},
					{field:'categoryName',title:'分类名称',width:100},
					{field:'series',title:'商品系列',width:100},
					{field:'unit',title:'单位',width:100},
					{field:'place',title:'产地',width:100},
					{field:'uses',title:'用途',width:120}
				]]
 	});
 	$('#constract_sales_goods_grd_form_ok_btn').on('click',function(){
 		var	rows = constract_sales_goods_grd_form_grd.datagrid('getSelections');//获取所有选择的行记录
 		if(rows&&rows.length>1){
 			$.messager.alert('提示','请选择单行商品信息...','warning');
 		}else if(rows&&rows.length==1){
 			//1将数据加载到指定的界面
 			var row=rows[0];
 			$('#contract_sales_goods_grd_form_id').attr('value',row.id);//商品编号
 			$('#contract_sales_goods_grd_form_name').attr('value',row.name);
 			$('#contract_sales_goods_grd_form_format').attr('value',row.format);
 			$('#contract_sales_goods_grd_form_price').attr('value',row.price);
 			$('#contract_sales_goods_grd_form_price_convert_unit').attr('value',row.priceConvertUnit);
 			
 			$('#contract_sales_goods_grd_form_amount').val('0.00');//金额置为0
 			$('#contract_sales_goods_grd_form_quantity_unit').val('0');//数量置为0
 			$('#contract_sales_goods_grd_form_quantity_eu').val('0');//折合数量为0
 			constract_sales_goods_grd_form_grd.datagrid('unselectAll');//清空所有现在行
 			//2将显示界面关闭
 			constract_sales_goods_grd_form_dialog.dialog('close');
 		} 
 	});
 	$('#contract_sales_goods_grd_form_quantity_unit').numberspinner({
 		min:0,
 		editable:false,
 		onChange:function(value){
 			var contract_sales_goods_grd_form_price=parseFloat($('#contract_sales_goods_grd_form_price').val());
 			$('#contract_sales_goods_grd_form_amount').val(contract_sales_goods_grd_form_price*parseInt(value));	
 		}
 	});
 	$('#contract_sales_goods_grd_add_btn').on('click',function(){
		//1.当前金额小于0则不将其加入到datagrid中
		//insertRow 	
		var rows=contract_sales_goods_grd.datagrid('getRows');
		if(rows==null||rows.length==0){
			addDataGridRow();
			contract_sales_goods_grd.datagrid('acceptChanges');
			calculateTotalAmount();
		}else if(rows.length>0){
			var isExist=false;
			var row=null;
			var row_index=0;
			for(var i=0;i<rows.length;i++){
				row=rows[i];
				if(row.goodsId==$('#contract_sales_goods_grd_form_id').val()){//说明商品相关
					isExist=true;
					row_index=i;
					break;
				}
			}
			if(isExist){//更新datagrid列
				//1.修改datagrid中的数据
				var quantityUnit=parseInt(row.quantityUnit)+parseInt($('#contract_sales_goods_grd_form_quantity_unit').val());
				var amount=(parseFloat($('#contract_sales_goods_grd_form_amount').val())*100+parseFloat(row.amount)*100)/100;
				var goodsId=contract_sales_goods_grd.datagrid('selectRow',row_index).goodsId;//商品编号
				contract_sales_goods_grd.datagrid('updateRow',{
					index:row_index,
					row:{
						quantityUnit:quantityUnit,//数量
						amount:amount//金额
					}
				});
				//2.更新内存中的数据 
				updateProuctInfoMemcache(amount*100,quantityUnit,goodsId);
				
			}else{//添加一列
				addDataGridRow();
			}
			
			calculateTotalAmount();
		}
 	});
 	$('#contract_sales_goods_grd_delete_btn').on('click',function(){//datagrid delete
 		var rows=contract_sales_goods_grd.datagrid('getSelections');
 		if(rows.length>0){
 			$.messager.confirm('提示','是否确定要删除当前已经选择的行信息',function(r){
 				if(r){
 					var array=[];//带删除的数组
 					for(var i=0;i<rows.length;i++){
		 				//1.删除对应的datagrid
		 				//contract_sales_goods_grd.datagrid('deleteRow',i);
		 				array.push(rows[i].goodsId);
		 			}
		 			//2.删除其他的页签内容(暂时不处理)
		 			console.info(array);
		 			//3.将内存中的缓存数据删除
		 			if(array.length>0){
		 				removeProudctInfoMemcache(array);
		 				calculateTotalAmount();
		 			}
 				}
 			});
 		}else{
 			$.messager.alert('提示','请选择待删除的行...','info');
 		}
 		
 	});
});

function addDataGridRow(){
	//1.加入数据到datagrid
	contract_sales_goods_grd.datagrid('insertRow',{
	index:0,
	row:{
			goodsId:$('#contract_sales_goods_grd_form_id').val(),//商品编号
			goodsName:$('#contract_sales_goods_grd_form_name').val(),//商品名称
			price:$('#contract_sales_goods_grd_form_price').val(),//单价
			quantityUnit:$('#contract_sales_goods_grd_form_quantity_unit').val(),//数量
			equivalentUnit:$('#contract_sales_goods_grd_form_equivalent_unit').val(),//折合单位
			quantityEu:$('#contract_sales_goods_grd_form_quantity_eu').val(),//折合数量
			priceEu:$('#contract_sales_goods_grd_form_price_convert_unit').val(),//折合单价
			unit:$('#contract_sales_goods_grd_form_format').val(),//规格
			amount:$('#contract_sales_goods_grd_form_amount').val(),//金额
			mome:$('#contract_sales_goods_grd_form_mome').val()//备注
		}
	});
	//2.将数据保存到内存中
	addProuctInfoMemcache();
}

/**
* 将销售合同商品信息添加到memcache中
*/
function addProuctInfoMemcache(){
	if($('#contract_sales_goods_grd_form_id').val().length>0){
		$.ajax({
			url:'${path}/contract/manager/sales_contract_product_info_memcache.html',//销售合同商品列表
			method:'POST',//请求方式
			data:{
				contractId:$('#constract_sales_sale_base_id').val(),//合同编号
				goodsId:$('#contract_sales_goods_grd_form_id').val(),//商品编号
				goodsName:$('#contract_sales_goods_grd_form_name').val(),//商品名称
				price:$('#contract_sales_goods_grd_form_price').val(),
				unit:parseFloat($('#contract_sales_goods_grd_form_format').val())*100,//包装单位(规格)
				//priceUnit:,//包装单位单价
				equivalentUnit:$('#contract_sales_goods_grd_form_equivalent_unit').val(),//折合单位
				priceEu:200,//折合单位单价
				//quantityEuPerUnit:,//包装单位折合数量
				quantityEu:$('#contract_sales_goods_grd_form_quantity_unit').val(),//数量
				quantityUnit:$('#contract_sales_goods_grd_form_quantity_eu').val(),//折合数量
				amount:parseFloat($('#contract_sales_goods_grd_form_amount').val())*100,//金额
				memo:$('#contract_sales_goods_grd_form_mome').val(),//商品备注
				stats:"0"//状态
			},//参数
			success:function (data){
				console.info(data);
			},
			error:function(data){
				console.info("与后台通讯失败.. ");
			}
		});
	}
}
/**
* 将销售合同商品信息更新到memcache中
* @param amount  金额
* @param quantityUnit 数量
*/
function updateProuctInfoMemcache(amount,quantityUnit,goodsId){
	$.ajax({
		url:'${path}/contract/manager/sales_contract_product_info_memcache.html',//销售合同商品列表
		method:'POST',//请求方式
		data:{
			contractId:$('#constract_sales_sale_base_id').val(),//合同编号
			goodsId:goodsId,//商品编号
			quantityUnit:quantityUnit,
			amount:amount
		},//参数
		success:function (data){
			console.info(data);
		},
		error:function(data){
			console.info("与后台通讯失败.. ");
		}
	});
}
/**
* 将销售合同中的商品信息从memcache中进行删除
**/
function removeProudctInfoMemcache(array){
	$.ajax({
		url:'${path}/contract/manager/sales_contract_product_info_remove_memcache.html',
		method:'POST',
		data:{
			contractId:$('#constract_sales_sale_base_id').val(),//合同编号
			memo:array.join(',')
		},
		success:function (data){//2.将dategrid的行数据进行删除操作
			if(data.success){
				for(var i=0;i<rows.length;i++){
					var index=contract_sales_goods_grd.datagrid('getRowIndex',rows[i]);
					contract_sales_pay_grd.datagrid('deleteRow',index);
					contract_sales_pay_grd.datagrid('acceptChanges');//接受改变
				}
			}
		},
		error: function(data){
			console.info(data);
			$.messager.alert('提示','处理缓存失败...',error);
		}
	});
}

function calculateTotalAmount(){
	//计算总金额
	var rows=contract_sales_goods_grd.datagrid('getRows');
	contract_sales_total_amount=0;
	for(var i=0;i<rows.length;i++){
		contract_sales_total_amount+=parseFloat(rows[i].amount)*100;
		$('#contract_sales_base_total_amount').val(contract_sales_total_amount/100);
		//转换为大写
		toUpper($('#contract_sales_base_total_amount'),$('#contract_sales_base_upper_rmb'));
	}
}
</script>
<table class="table" style="width: 100%;">
	<tr>
		<th>商品</th>
		<td colspan="3">
			<input class="easyui-validatebox" type="text" style="width: 300px;border:1px solid #95B8E7;" id="contract_sales_goods_grd_form_name" name="contract_sales_goods_grd_name" data-options="" readonly="readonly"/>
			<input type="hidden" id="contract_sales_goods_grd_form_id"/>
			<a id="constract_sales_goods_grd_form_btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>规格</th>
		<td colspan="3">
			<input class="easyui-validatebox" type="text" style="width: 200px;border:1px solid #95B8E7;" id="contract_sales_goods_grd_form_format" validType="length[0,2]"missingMessage="请输入规格" invalidMessage="不能超过2个字符!"  data-options=""/>
		</td>
		<th>单价</th>
		<td>
			<input class="easyui-validatebox" type="text" id="contract_sales_goods_grd_form_price" style="border:1px solid #95B8E7;" data-options=""/>
			<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-font'"  plain="true"></a>
		</td>
	</tr>
	<tr>
		<th>折合单价</th>
		<td>
			<input class="easyui-validatebox" type="text" id="contract_sales_goods_grd_form_price_convert_unit" style="border:1px solid #95B8E7;" data-options="validType:'numberic',missingMessage:'请输入折合单价',invalidMessage:'请输入正确的格式'"/>
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
			<input class="easyui-validatebox" type="text" id="contract_sales_goods_grd_form_amount" style="border:1px solid #95B8E7;" data-options="" value="0" readonly="readonly"/>
		</td>
	</tr>
	<tr>
		<th>备注</th>
		<td colspan="6">
			<input class="easyui-validatebox" style="width: 500px;border:1px solid #95B8E7;" type="text" id="contract_sales_goods_grd_form_mome" data-options=""/>
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
					<td><input name="constract_sales_goods_grd_form_goods_name" id="constract_sales_goods_grd_form_goods_name" style="border:1px solid #95B8E7;"/><br></td>
					<th>商品类型</th>
					<td><input name="constract_sales_goods_grd_form_goods_type" id="constract_sales_goods_grd_form_goods_type" style="border:1px solid #95B8E7;"/><br></td>
				</tr>
				<tr>
					<th>真实品名<br></th>
					<td><input name="constract_sales_goods_grd_form_goods_real_name" id="constract_sales_goods_grd_form_goods_real_name" style="border:1px solid #95B8E7;"/><br></td>
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