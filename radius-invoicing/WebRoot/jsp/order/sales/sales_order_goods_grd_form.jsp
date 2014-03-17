<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
<!--
var sales_order_goods_grd_form_dialog=null;
var sales_order_goods_grd_form_grd=null;
var sales_order_goods_grd_form_exist_contract_goods_grd=null;//销售合同商品列表
var sales_order_goods_grd_form_exist_contract_order_goods_grd=null;//销售订单商品列表
var sales_order_goods_grd_form_sales_order_goods_grd=null;//销售合同商品列表
var sales_order_goods_grd_form_add_btn= null;//添加按钮
var sales_order_goods_grd_form_import_btn= null;//导入按钮
var sales_order_goods_grd_form_delete_btn= null;//删除按钮
$(function(){
	$('#sales_order_goods_grd_form_btn').on('click',function(){//商品选择按钮
		sales_order_goods_grd_form_dialog=$('#sales_order_goods_grd_form_dialog').show().dialog({
			title:'选择商品',
 			 width:800,
 			 height:400,
 			 collapsible:true,//向上缩小按钮
 			 maximizable:true,
 			 modal:true
		});
	});
	$('#sales_order_goods_grd_form_search_btn').on('click',function(){//查询商品信息
		sales_order_goods_grd_form_grd.datagrid('options').url='${path}/goods/manager/goods/goods_list.html';
 		sales_order_goods_grd_form_grd.datagrid('load',{
 			name:$('#constract_sales_goods_grd_form_goods_name').val(),
 			property:$('#sales_order_goods_grd_form_goods_type').val(),
 			realName:$('#sales_order_goods_grd_form_goods_real_name').val()
 		});
	});
	
	   //销售合同商品列表
		sales_order_goods_grd_form_sales_order_goods_grd=$('#sales_order_goods_grd_form_sales_order_goods_grd').datagrid({
        		fitColumns:true,
        		autoRowHeight:false,
        		border:false,
        		striped:true,
        		rownumbers:true,
        		collapsible:true,
        		frozenColumns:[[
        			{field:'goodsId',title:'商品编号',width:100},
        			{field:'goodsName',title:'商品名称',width:120}
        		]],
        		columns:[[
					{field:'quantityUnit',title:'数量',width:60},
					{field:'equivalentUnit',title:'折合单位',width:60},
					{field:'quantityEu',title:'折合数量',width:60},
					{field:'priceEu',title:'折合单价',width:60,formatter: function(value,row,index){
							if(value!=undefined&&value!=null&&(value+"").indexOf(".")<=0){
								value=parseInt(value).toFixed(2);
							}
							return value;
						}	
					},
					{field:'unit',title:'规格',width:120},
					{field:'amount',title:'金额',width:120,formatter: function(value,row,index){
							if(value!=undefined&&value!=null&&(value+"").indexOf(".")<=0){
								value=value.toFixed(2);
							}
							return value;
						}	
					 },
					{field:'mome',title:'备注',width:250,align:'center'}
				]]
		});
		
	sales_order_goods_grd_form_grd=$('#sales_order_goods_grd_form_grd').datagrid({
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
 	$('#sales_order_goods_grd_form_ok_btn').on('click',function(){
 		var	rows = sales_order_goods_grd_form_grd.datagrid('getSelections');//获取所有选择的行记录
 		if(rows.length>1){
 			$.messager.alert('提示','请选择单行商品信息...','warning');
 		}else if(rows.length==1){
 			//1将数据加载到指定的界面
 			var row=rows[0];
 			$('#sales_order_goods_grd_form_id').attr('value',row.id);//商品编号
 			$('#sales_order_goods_grd_form_name').attr('value',row.name);
 			$('#sales_order_goods_grd_form_format').attr('value',row.format);
 			$('#sales_order_goods_grd_form_price').attr('value',(row.price).toFixed(2));
 			$('#sales_order_goods_grd_form_price_convert_unit').attr('value',row.priceConvertUnit);
 			
 			$('#sales_order_goods_grd_form_amount').val('0.00');//金额置为0
 			$('#sales_order_goods_grd_form_quantity_unit').val('0');//数量置为0
 			$('#sales_order_goods_grd_form_quantity_eu').val('0');//折合数量为0
 			sales_order_goods_grd_form_grd.datagrid('unselectAll');//清空所有现在行
 			//2将显示界面关闭
 			sales_order_goods_grd_form_dialog.dialog('close');
 		}else{
 			$.messager.alert('提示','请选择商品信息...','warning');
 		} 
 	});
 	$('#sales_order_goods_grd_form_quantity_unit').numberspinner({
 		min:0,
 		editable:false,
 		onChange:function(value){
 			var sales_order_goods_grd_form_price=parseFloat($('#sales_order_goods_grd_form_price').val());
 			$('#sales_order_goods_grd_form_amount').val((sales_order_goods_grd_form_price*parseInt(value)).toFixed(2));	
 		}
 	});
 	sales_order_goods_grd_form_add_btn=$('#sales_order_goods_grd_form_add_btn').on('click',function(){
		if(!$(this).linkbutton('options').disabled){//表示按钮没有禁用的时候
			//1.当前商品为则不将其加入到datagrid中
			var sales_order_goods_grd_form_id = $('#sales_order_goods_grd_form_id').val();
			if(sales_order_goods_grd_form_id.length>0){
				var row_data=getSalesOrderGoodsGrdFormatter()//当前需要处理的数据
				setSalesOrderGoodsGrd(row_data);//该方法是判断是否是添加还是更新
				sales_order_goods_grd_form_sales_order_goods_grd.datagrid('acceptChanges');//接受改变
				calculateTotalAmount();
			}else{//提示信息
				$.messager.alert('提示','请选择商品...','warning');
			}	
		}
 	});
 	sales_order_goods_grd_form_delete_btn=$('#sales_order_goods_grd_form_delete_btn').on('click',function(){//datagrid delete
	 	if(!$(this).linkbutton('options').disabled){//表示按钮没有禁用的时候	
	 		var rows=sales_order_goods_grd.datagrid('getSelections');
	 		if(rows.length>0){
	 			$.messager.confirm('提示','是否确定要删除当前已经选择的行信息',function(r){
	 				if(r){
	 					var array=[];//带删除的数组
	 					for(var i=0;i<rows.length;i++){
			 				//1.删除对应的datagrid
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
 		}
 	});
	
	sales_order_goods_grd_form_import_btn=$('#sales_order_goods_grd_form_import_btn').on('click',function(){
		if($(this).linkbutton('options').disabled){//表示按钮已经被禁用 有时设置disable无效
			console.info("导入按钮已经被禁用");
		}
	});
	
});

/**
 * 获取销售订单商品列表需要的数据格式
 * @return json 
 **/
function getSalesOrderGoodsGrdFormatter(){
	var json={
		goodsId:$("#sales_order_goods_grd_form_id").val(),//商品编号
		goodsName:$("#sales_order_goods_grd_form_name").val(),//商品名称
		price:$("#sales_order_goods_grd_form_price").val(),//单价
		quantityUnit:$('#sales_order_goods_grd_form_quantity_unit').val(),//数量
		quantity:$('#sales_order_goods_grd_form_quantity_unit').val(),//数量
		equivalentUnit:$('#sales_order_goods_grd_form_equivalent_unit').val(),//折合单位
		quantityEu:$('#sales_order_goods_grd_form_quantity_eu').val(),//折合数量
		priceEu:$('#sales_order_goods_grd_form_price_convert_unit').val(),//折合单价
		unit:$('#sales_order_goods_grd_form_format').val(),//规格
		amount:$('#sales_order_goods_grd_form_amount').val(),//金额
		//stats:_data.stats, 状态
		mome:$('#sales_order_goods_grd_form_mome').val()//备注
	};
	return json;
}

/**
* 将销售合同中的商品信息从memcache中进行删除
**/
function removeProudctInfoMemcache(array){
	$.ajax({
		url:'${path}/order/manager/salesorder/order_product_info_remove_memcached.html',
		method:'POST',
		data:{
			contractId:$('#sales_order_sale_base_id').val(),//合同编号
			memo:array.join(',')
		},
		success:function (data){//2.将dategrid的行数据进行删除操作
			if(data.success){
				for(var i=0;i<rows.length;i++){
					var index=sales_order_goods_grd_form_sales_order_goods_grd.datagrid('getRowIndex',rows[i]);
					sales_order_goods_grd_form_sales_order_goods_grd.datagrid('deleteRow',index);
					sales_order_goods_grd_form_sales_order_goods_grd.datagrid('acceptChanges');//接受改变
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
	var rows=sales_order_goods_grd_form_sales_order_goods_grd.datagrid('getRows');
	sales_order_total_amount=0;
	for(var i=0;i<rows.length;i++){
		sales_order_total_amount+=parseFloat(rows[i].amount)*100;
		$('#sales_order_base_total_amount').val(numbericCurrentyFormatter(sales_order_total_amount/100));
		//转换为大写
		//toUpper($('#sales_order_base_total_amount'),$('#sales_order_base_upper_rmb'));
	}
}
/**
 * 数据数字格式化
 * @param numberic 带格式化得数字或是字符
 * @return 
 **/
function numbericCurrentyFormatter(numberic){
	//1.利用js交易是否为数字
	if(numberic==null||numberic==undefined){
		return '0.00';
	}else{
		numberic=numberic+"";
		if(numberic.indexOf('.')>0){
			return numberic;
		}else{
			return parseInt(numberic).toFixed(2);
		}
	}
}
//-->
</script>
	<table class="table" style="width: 100%;">
		<tr>
			<th>商品</th>
			<td colspan="3"> 
				<input class="easyui-validatebox" type="text" style="width: 300px;border:1px solid #95B8E7;" id="sales_order_goods_grd_form_name" name="sales_order_goods_grd_name" readonly="readonly"/>
				<input type="hidden" id="sales_order_goods_grd_form_id"/>
				<a id="sales_order_goods_grd_form_btn"  href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
			</td>
			<th>规格</th>
			<td colspan="3">
				<input class="easyui-validatebox" type="text" style="width: 200px;border:1px solid #95B8E7" id="sales_order_goods_grd_form_format" validType="length[0,2]"missingMessage="请输入规格" invalidMessage="不能超过2个字符!" />
			</td>
			<th>单价</th>
			<td>
				<input class="easyui-validatebox" type="text" id="sales_order_goods_grd_form_price" style="border:1px solid #95B8E7"/>
				<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-font'"  plain="true"></a>
			</td>
		</tr>
		<tr>
			<th>折合单价</th>
			<td>
				<input class="easyui-validatebox" type="text" id="sales_order_goods_grd_form_price_convert_unit" style="border:1px solid #95B8E7" data-options="validType:'numberic',missingMessage:'请输入折合单价',invalidMessage:'请输入正确的格式'"/>
			</td>
			<th>数量</th>
			<td>
				<input style="width: 100px;" type="text" class="easyui-numberspinner" id="sales_order_goods_grd_form_quantity_unit"/>
				<input type="text"  style="width: 20px;" readonly="readonly" value="桶"/>
			</td>
			<th>折合数量</th>
			<td colspan="3">
				<input style="width: 100px;" type="text" class="easyui-numberspinner" id="sales_order_goods_grd_form_quantity_eu" data-options="min:0,editable:false"/>
				<input type="text" id="sales_order_goods_grd_form_equivalent_unit" style="width: 20px;" readonly="readonly" value="吨"/>
			</td>
			<th>金额</th>
			<td>
				<input class="easyui-validatebox" type="text" id="sales_order_goods_grd_form_amount"  value="0.00" readonly="readonly" style="border:1px solid #95B8E7"/>
			</td>
		</tr>
		<tr>
			<th>备注</th>
			<td colspan="6">
				<input class="easyui-validatebox" style="width: 500px;border:1px solid #95B8E7" type="text" id="sales_order_goods_grd_form_mome" />
			</td>
			<th colspan="2" style="text-align: center;"><input type="checkbox"/> 加入后不置空</th>
			<td>
				<div style="float: left;">
					<a id="sales_order_goods_grd_form_add_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" plain="true">加入(A)</a>
				</div>
				<div class="datagrid-btn-separator"></div>
				<div style="float: left;">
					<a id="sales_order_goods_grd_form_import_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-excel_import'" plain="true">导入</a>
				</div>
				<div class="datagrid-btn-separator"></div>
				<div style="float: left;">
					<a id="sales_order_goods_grd_form_delete_btn" href="#" class="easyui-linkbutton"  data-options="iconCls:'icon-remove'" plain="true">删除(D)</a>
				</div>
			</td>
		</tr>
	</table>


	<div id="sales_order_goods_grd_form_dialog" style="display: none;">
		<fieldset>
				<legend>筛选条件</legend>
				<table class="table" style="width: 100%;">
					<tr>
						<th>商品名称<br></th>
						<td><input name="sales_order_goods_grd_form_goods_name" id="sales_order_goods_grd_form_goods_name" style="border:1px solid #95B8E7;"/><br></td>
						<th>商品类型</th>
						<td><input name="sales_order_goods_grd_form_goods_type" id="sales_order_goods_grd_form_goods_type" style="border:1px solid #95B8E7;"/><br></td>
					</tr>
					<tr>
						<th>真实品名<br></th>
						<td><input name="sales_order_goods_grd_form_goods_real_name" id="sales_order_goods_grd_form_goods_real_name" style="border:1px solid #95B8E7;"/><br></td>
						<td colspan="2">
							<div style="float: left;">
							<a id="sales_order_goods_grd_form_search_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
							</div>
							<div class="datagrid-btn-separator"></div>
							<div style="float: left;">
							<a id="sales_order_goods_grd_form_ok_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-true'" plain="true">确定</a>
							<div>
						</td>
					</tr>
				</table>
		</fieldset>
		<div id="sales_order_goods_grd_form_grd">
		</div>
	</div>
	<div id="sales_order_goods_grd_form_sales_order_goods_grd">
    </div>
