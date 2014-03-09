<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
<!--
 var sales_order_base_custmer_grd=null; 
 var sales_order_base_status=null;
 var sales_order_base_order_time=null;
 var sales_order_base_order_end_time=null;
 var sales_order_base_custmer_grd=null;
 var sales_order_base_custmer_link_man_grd=null;
 var sales_order_base_custmer_link_man=null;
 var sales_order_base_custmer_dialog=null;
 var sales_order_base_sales_contract_dialog=null;
 var sales_order_base_sales_contract_grd =  null;//销售合同列表
 $(function (){
 	sales_order_base_status=$('#sales_order_base_status').combobox({
 		url:'${path}/contract/manager/sales_status_json.html',
 		valueField: 'id',
		textField: 'name',
		onLoadSuccess:function(){
			var target = $(this);
			target.combobox("setValue",target.val());
			target.combobox('disable');
		}
 	});
 	$('#sales_order_base_order_time').datebox({
 	});
 	$('#sales_order_base_order_end_time').datebox({
 	});
 	$('#sales_order_base_custmer_btn').on('click',function(){
 		sales_order_base_custmer_dialog.dialog('open');
 	});
 	sales_order_base_custmer_dialog=$('#sales_order_base_custmer_dialog').show().dialog({
 			 title:'选择客户',
 			 width:800,
 			 height:400,
 			 collapsible:true,//向上缩小按钮
 			 maximizable:true,
 			 modal:true,
 			 closed:true
 		});
 	sales_order_base_custmer_link_man=$('#sales_order_base_custmer_link_man').show().dialog({
 			 title:'选择客户联系人',
 			 width:800,
 			 height:400,
 			 collapsible:true,//向上缩小按钮
 			 maximizable:true,
 			 modal:true,
 			 closed:true
 		});
 		
 	$('#sales_order_base_custmer_link_man_btn').on('click',function(){
 	   if($('#sales_order_base_customer_id').val().length>0){
 			sales_order_base_custmer_link_man.dialog('open');
 		}else{
 			$.messager.alert('提示','请选择客户信息...','warning');
 		}
 	});
 	sales_order_base_custmer_grd=$('#sales_order_base_custmer_grd').datagrid({
 				fit:true,
 				//fitColumns:true,
        		autoRowHeight:false,
        		border:false,
        		striped:true,
        		rownumbers:true,
        		collapsible:true,
        		columns:[[
        			{field:'id',title:'客户编号',width:100},
        			{field:'ab',title:'客户简称',width:100},
        			{field:'name',title:'客户名称',width:120},
					{field:'linkMan',title:'联系人',width:60},
					{field:'tel1',title:'办公电话',width:60},
					{field:'contactInfo',title:'联系电话',width:60},
					{field:'fax1',title:'传真',width:60}
				]]
 	});
 	
 	sales_order_base_custmer_link_man_grd=$('#sales_order_base_custmer_link_man_grd').datagrid({
 				fit:true,
 				//fitColumns:true,
        		autoRowHeight:false,
        		border:false,
        		striped:true,
        		rownumbers:true,
        		collapsible:true,
        		columns:[[
        			{field:'id',title:'编号',width:40},
        			{field:'name',title:'联系人名称',width:100},
					{field:'tel',title:'办公电话',width:100},
					{field:'mobile',title:'联系电话',width:100},
					{field:'email',title:'邮箱',width:100},
					{field:'address',title:'地址',width:120}
				]]
 	});
 	
 	
 	$('#sales_order_base_customer_search_btn').on('click',function(){
 		sales_order_base_custmer_grd.datagrid('options').url='${path}/customer/split_page.html';
 		sales_order_base_custmer_grd.datagrid('load',{
				name:$('#sales_order_base_customer_name').val(),
				linkMan:$('#sales_order_base_customer_link').val(),
				tel1:$('#sales_order_base_customer_link_tel').val()
		});//params
 	});
 	
 	
 	$('#sales_order_base_customer_ok_btn').on('click',function(){//确定按钮
 		var	rows = sales_order_base_custmer_grd.datagrid('getSelections');//获取所有选择的行记录
 		if(rows.length>1){
 			$.messager.alert('提示','请选择单行客户信息...','warning');
 		}else if(rows.length==1){
 			//1将数据加载到指定的界面
 			var row=rows[0];
 			$('#sales_order_base_customer_id').attr('value',row.id);
 			$('#sales_order_base_customer_name').attr('value',row.name);
 			$('#sales_order_base_link_man').attr('value',row.linkMan);
 			$('#sales_order_base_link_tel').attr('value',row.tel1);
 			$('#sales_order_base_link_mobile').attr('value',row.contactInfo);
 			$('#sales_order_base_link_fax').attr('value',row.fax1);
 			//2将显示界面关闭
 			$('#sales_order_base_custmer_dialog').dialog('close');
 			$('#sales_order_base_custmer_dialog').dialog('options').closed=true;
 		}else{
 			$.messager.alert('提示','请选择客户信息...','warning');
 		}
 	});
 	
 	//联系人信息查询按钮
 	$('#sales_order_base_custmer_link_man_search_btn').on('click',function(){
 		sales_order_base_custmer_link_man_grd.datagrid('options').url='${path}/customer/sales/link_man_split_page.html';
 		sales_order_base_custmer_link_man_grd.datagrid('load',{
				other:$('#sales_order_base_customer_id').val(),
				name:$('#sales_order_base_custmer_link_man_').val(),
				tel:$('#sales_order_base_custmer_link_tel_').val()
		});//params
 	});
 	//联系人信息确定按钮
 	$('#sales_order_base_custmer_link_man_ok_btn').on('click',function(){
 		var	rows = sales_order_base_custmer_link_man_grd.datagrid('getSelections');//获取所有选择的行记录
 		if(rows.length>1){
 			$.messager.alert('提示','请选择单行客户信息...','warning');
 		}else if(rows.length==1){
 			//1将数据加载到指定的界面
 			var row=rows[0];
 			$('#sales_order_base_link_man').attr('value',row.name);
 			$('#sales_order_base_link_tel').attr('value',row.tel);
 			$('#sales_order_base_link_mobile').attr('value',row.mobile);
 			$('#sales_order_base_link_fax').attr('value',row.fax);
 			//2将显示界面关闭
 			sales_order_base_custmer_link_man.dialog('close');
 			sales_order_base_custmer_link_man.dialog('options').closed=true;
 		}else{
 			$.messager.alert('提示','请选择客户信息...','warning');
 		}
 	});
 	
 	sales_order_base_sales_contract_dialog=$('#sales_order_base_sales_contract_dialog').show().dialog({//销售合同查询对话框
		 title:'选择销售合同',
		 width:800,
		 height:400,
		 collapsible:true,//向上缩小按钮
		 maximizable:true,
		 modal:true,
		 closed:true
	});
	
	$('#sales_order_base_sales_contract_btn').on('click',function(){//绑定销售合同对话框按钮
		var customer_id = $('#sales_order_base_customer_id').val();//客户编号
		if (customer_id&&customer_id.length>0) {//不为空并且长度大于0
			sales_order_base_sales_contract_dialog.dialog('open');
		}else{//提示信息
			$.messager.alert('提示','请选择客户信息','error');
		}
	});
	$('#sales_order_base_sales_contract_search_btn').on('click',function(){//选择合同确定按钮
		$.ajax({//获取销售合同信息
			url:'${path}/contract/manager/salescontract/sales_contract_info_by_customer.html',
			method:'POST',
			data:{
				customerId:$('#sales_order_base_customer_id').val(),//客户编号
				id:$('#sales_order_base_sales_contract_id').val()//销售合同编号
			},
			success:function (r){//将数据追加到销售合同列表
				//1.将获取到的合同信息追加到列表中
				sales_order_base_sales_contract_grd.datagrid('loadData',r.rows);
			},
			error:function (r){
				console.info(r);
				console.info('与服务端通信失败...');
				//$.messager.alert('提示','请选择客户信息','error');	
			} 
		});
	});
	
	//确定按钮
	$('#sales_order_base_sales_contract_ok_btn').on('click',function(){//销售合同确定按钮
		var rows=sales_order_base_sales_contract_grd.datagrid('getSelections');
		if (rows.length==1) {
			var contractId=$('#sales_order_base_sales_contract_id').val();
			if(contractId.length>0&&contractId!=rows[0].id){//如果合同编号发生变化则将数据数据表格的数据情况、sales_order_total_amount设置为 0 
				removeDataGrid2Memcached();
				//情况销售合同页签下的datagrid数据
				$('#sales_order_sales_contract_goods_detail_grd').datagrid('loadData', {total: 0,rows:[]});
			}
			$('#sales_order_base_sales_contract_id').val(rows[0].id);
			$('#sales_order_base_total_amount').val((rows[0].totalAmount/100).toFixed(2));
			$('#sales_order_base_sales_contract_dialog').dialog('close');
			//表示存在-->将商品列表中的相关按钮禁用
			$('#sales_order_goods_grd_form_add_btn').linkbutton('disable');
			$('#sales_order_goods_grd_form_import_btn').linkbutton('disable');
			$('#sales_order_goods_grd_form_delete_btn').linkbutton('disable');
			//2.异步请求获取销售合同的详细信息
			getSalesContractDetailInfo();
		}else if(rows.length>1){
			$.messager.alert('提示','请选择单行销售合同信息','warning');
		}else{
			$.messager.alert('提示','请选择销售合同行信息','warning');
		}
	});


	sales_order_base_sales_contract_grd=$('#sales_order_base_sales_contract_grd').datagrid({//销售合同列表
				fit:true,
        		autoRowHeight:false,
        		border:false,
        		striped:true,
        		rownumbers:true,
        		collapsible:true,
        		columns:[[
        			{field:'id',title:'合同编号',width:120},
        			{field:'customerName',title:'客户名称',width:100},
					{field:'effectDate',title:'有效日期',width:80},
					{field:'signTime',title:'签署日期',width:80},
					{field:'totalAmount',title:'总金额',width:80,formatter: function(value,row,index){
						return (value/100).toFixed(2);
					}},
					{field:'upperAmount',title:'大写金额',width:120}
				]]
	});
 });
//根据合同编号获取合同详细信息
function getSalesContractDetailInfo(){
	$.ajax({//获取销售合同详细信息 1.合同基本信息 2.合同附件信息 3.合同的中金额 3.合同的销售商品明细
		url:'${path}/contract/manager/salescontract/sales_contract_goods_grd_by_contract_id.html',
		method:'POST',
		data:{
			contractId:$('#sales_order_base_sales_contract_id').val()
		},
		success:function(r){//将获取的详细信息添加到tabs中
			console.info(r.rows);
			//1.通过遍历,将销售订单商品列表组个添加到销售订单商品列表中
			$.each(r.rows,function(index,d){
				//1.1 将数据格式化
				var row_data=getSalesOrderGoodsGrdRowFormatter(d);//将数据格式化
				//1.2 在数据列表中添加、在缓存中添加
				setSalesOrderGoodsGrd(row_data);
				$('#sales_order_goods_grd_form_sales_order_goods_grd').datagrid('acceptChanges');//接受改变
				//1.3 将数据添加到销售合同页签中
				setSalesOrderSalesContractGoodsDetailGrd(d);
			});
		},
		error:function (r){
			console.info(r);
			console.info('与服务端通信失败...');
			//$.messager.alert('提示','请选择客户信息','error');
		}
	});
}
/**
 *得到格式化后的销售订单行数据
 * @param _data 来自后台的数据json格式
 * @return json 符合 销售订单商品信息列表规则的json
 **/
function getSalesOrderGoodsGrdRowFormatter(_data){
	var json={
		goodsId:_data.goodsId,//商品编号
		goodsName:_data.goodsName,//商品名称
		price:_data.price/100,//单价
		quantityUnit:_data.quantityUnit,//数量
		equivalentUnit:_data.equivalentUnit,//折合单位
		quantityEu:_data.quantityEu,//折合数量
		priceEu:_data.priceEu/100,//折合单价
		unit:_data.unit,//规格
		amount:_data.amount/100,//金额
		stats:_data.stats,
		mome:_data.memo//备注
	};
	return json;
}


/**
 * 设置销售订单商品列表
 * @param row_data 已设置好的datagrid row数据
 * 
 **/
function setSalesOrderGoodsGrd(row_data){
	var rows = sales_order_goods_grd_form_sales_order_goods_grd.datagrid('getRows');//获取当前页所有数据行
	var url='${path}/order/manager/salesorder/order_product_info_memcached.html';//缓存地址
	if(rows.length>0){//
		//1.存在对应的数据则将其更新
		var goodsId=row_data.goodsId;
		var row=null,isExist=false,row_index=0;//初始化

		for(var i=0;i<rows.length;i++){
			row=rows[i];
			if(row.goodsId==goodsId){
				isExist=true;
				row_index=i;
				break;
			}
		}
		if(isExist){
			var total_amount=parseFloat($('#sales_order_base_total_amount').val())*100;//获取总金额
			 total_amount+=parseFloat(row_data.amount)*100;//获取当前商品的金额
			var quantity_unit=parseInt(row_data.quantityUnit)+parseInt(row.quantityUnit);
			//更新datagrid row 更新缓存
			var row_data_update={
				quantityUnit:quantity_unit,//数量
				amount:total_amount/100//金额
			};
			updateSalesOrderGoodsGrdRow(url,row_data_update,goodsId,row_index);
			$('#sales_order_base_total_amount').val(total_amount/100);//将显示总金额进行修改
			return ;
		}
	}
	addSalesOrderGoodsGrdRow(url,row_data);
}
/**
 * 更新销售订单商品列表
 * @param  memcached_url 请求缓存的地址
 * @param  row_data      
 * @param  goodsId
 * @param  row_index     
 **/
function updateSalesOrderGoodsGrdRow(memcached_url,row_data,goodsId,row_index){
	//1.更新datagrid
	sales_order_goods_grd_form_sales_order_goods_grd.datagrid('updateRow',{
		index:row_index,
		row:row_data
	});
	//2.更新memcached
	var memcached_data={
		contractId:$('#sales_order_base_id').val(),//销售订单编号
		goodsId:goodsId,//商品编号
		quantityUnit:quantityUnit,
		amount:amount
	};
	//salesOrderGoodsMemcached(memcached_url,memcached_data);
}




/**
 * 销售订单列表添加数据行
 * @param memcached_url 缓存地址
 * @param row_data 已经组装好的行数据
 **/
function addSalesOrderGoodsGrdRow(memcached_url,row_data){
	//1.添加行数据
	sales_order_goods_grd_form_sales_order_goods_grd.datagrid('insertRow',{
		index:0,
		row:row_data
	});
	//2.添加缓存数据
	var data=getAddSalesOrderGoodsDataMemcachedFormatter(row_data);//将数据格式化为memcached中需要的数据
	salesOrderGoodsMemcached(memcached_url,data);
}
/**
 * 将数据格式化为memcached中需要的
 * @param row_data  待处理的数据
 * @return json     格式化之后的数据
 **/
function getAddSalesOrderGoodsDataMemcachedFormatter(row_data){
	var json={
	    orderId:$('#sales_order_base_id').val(),//销售订货单编号
	    goodsId:row_data.goodsId,//商品编号
	    goodsName:row_data.goodsName,//商品名称
	    quantity:row_data.quantity,//数量
	    unit:row_data.unit,//单位
	    //barCode:row_data.barCode,//条形码
	    model:row_data.model,//型号
	    property:row_data.property,//属性
	    price :row_data.price,//单价
	    amount:row_data.amount,//金额
	    stats:row_data.stats,//状态
	    other:row_data.other,//其他
	    formate:row_data.formate,//规格编号
	    priceKg :row_data.priceKg,//单价/kg
	    totalWeight :row_data.totalWeight,//总重量
	    tax :row_data.tax,//税率
	    taxAmount:row_data.taxAmount,//税额
	    weigthUnit:row_data.weigthUnit,//单位重量
	    priceWeigthUnit :row_data.priceWeigthUnit,//单位重量单价
	   //operator:,//
	    weightUnit:row_data.weightUnit,//每单位重量
	    batchNo:row_data.batchNo,//batch_no
	    madeDate:row_data.madeDate,//生产日期
	    validityDate:row_data.validityDate,//有效期至
	    //ledgerId:,//
	    memo :row_data.mome//
	};
	return json;
}

/**
 * 异常处理缓存数据
 * @param memcached_url 缓存的请求地址
 * @param memcahed_data 缓存的数据
 **/
function salesOrderGoodsMemcached(memcached_url,memcahed_data){
	$.ajax({
		url:memcached_url,//销售订单商品列表缓存地址
		method:'POST',//请求方式
		data:memcahed_data,
		success:function (data){
			
			console.info(data);
		},
		error:function(data){
			console.info("与后台通讯失败.. ");
		}
	});
} 
/**
 * 将datagrid中对应的缓存数据进行清空并将datagrid对象进行清空
 *
 */
function removeDataGrid2Memcached(){
	var url='${path}/order/manager/salesorder/order_product_info_remove_memcached.html';
	//1.将缓存中的数据进行删除
	$.ajax({
		url:url,
		method:'POST',
		data:{
			orderId:$('#sales_order_base_id').val(),
			delete:true
		},
		success:function(data){
			console.info(data.message);
			if(data.success){
				//2.将datagrid的数据进行删除
				//3.将合同总金额归 0
				$('#sales_order_goods_grd_form_sales_order_goods_grd').datagrid('loadData', {total: 0,rows:[]});
				sales_order_total_amount=0;
			}
		},
		error:function(data){
			console.info('与后台访问通讯失败');
		}
	});
}
//-->
</script>
<table class="table" style="width: 100%;">
	<tr>
		<th>销售订单号<font color="red">*</font></th> 
		<td><input class="easyui-validatebox" style="background:#eee;width: 150px;border:1px solid #95B8E7" id="sales_order_base_id" type="text" readonly="readonly"  data-options="" value="${salesOrder.salesOrderId}"/></td>
		<th>状态</th>
		<td colspan="3"><input id="sales_order_base_status"  class="easyui-validatebox" class="easyui-combobox"  data-options="" value="0"/></td>
		<th>订货日期</th>
		<td><input class="easyui-validatebox" type="text" id="sales_order_base_order_time" style="border:1px solid #95B8E7"/></td>
	</tr>
	<tr>
		<th>客户<font color="red">*</font></th>
		<td colspan="5">
			<input  type="text" id="sales_order_base_customer_name" style="width: 300px;border:1px solid #95B8E7" readonly="readonly" data-options="" style="border:1px solid #95B8E7"/> 
			<input  type="hidden" id="sales_order_base_customer_id" readonly="readonly" data-options="" style="border:1px solid #95B8E7"/> 
			<a id="sales_order_base_custmer_btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>交货日期</th>
		<td><input class="easyui-validatebox" type="text" id="sales_order_base_order_end_time" data-options=""/></td>
	</tr>
	<tr>
		<th>联系人</th>
		<td>
			<input id="sales_order_base_link_man" class="easyui-validatebox" type="text" name="man"style="border:1px solid #95B8E7" />
			<a id="sales_order_base_custmer_link_man_btn"  href="#" class="easyui-linkbutton" plain="true" data-options="disabled:true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>办公电话</th>
		<td><input class="easyui-validatebox" type="text" id="sales_order_base_link_tel" style="border:1px solid #95B8E7"/></td>
		<th>手机号码</th>
		<td><input class="easyui-validatebox" type="text" id="sales_order_base_link_mobile" style="border:1px solid #95B8E7"/></td>
		<th>传真</th>
		<td><input class="easyui-validatebox" type="text" id="sales_order_base_link_fax" style="border:1px solid #95B8E7"/></td>
	</tr>
	<tr>
		<th>送货地址</th>
		<td colspan="3"><input class="easyui-validatebox" type="text" style="width: 350px;border:1px solid #95B8E7;" id="sales_order_base_delivery_point"/></td>
		<th>业务员</th>
		<td>
			<input class="easyui-validatebox" type="text" style="border:1px solid #95B8E7"/>
			<a id="btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th colspan="2" style="text-align: center;"></th>
	</tr>
	<tr>
		<th>合同编号<font color="red">*</font></th>
		<td>
			<input class="easyui-validatebox" id="sales_order_base_sales_contract_id" type="text" readonly="readonly" style="border:1px solid #95B8E7"/>
			<a id="sales_order_base_sales_contract_btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>合同总金额</th>
		<td><input id="sales_order_base_total_amount"  readonly="readonly" style="background:#eee;width: 150px;border:1px solid #95B8E7;"/></td>
		<th colspan="4"></th>
	</tr>
</table>

<div id="sales_order_base_custmer_dialog" style="display: none;">
	<%--弹出客户选择框--%>
	<fieldset>
			<legend>筛选条件</legend>
			<table class="table" style="width: 100%;">
				<tr>
					<th>客户名称(关键字)</th>
					<td><input  id="sales_order_base_customer_name" style="border:1px solid #95B8E7"/></td>
					<th>联系人</th>
					<td><input id="sales_order_base_customer_link" style="border:1px solid #95B8E7"/></td>
				</tr>
				<tr>
					<th>联系电话</th>
					<td><input id="sales_order_base_customer_link_tel" style="border:1px solid #95B8E7"/></td>
					<td colspan="2">
						<div style="float: left;">
						<a id="sales_order_base_customer_search_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
						</div>
						<div class="datagrid-btn-separator"></div>
						<div style="float: left;">
						<a id="sales_order_base_customer_ok_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-true'" plain="true">确定</a>
						<div>
					</td>
				</tr>
			</table>
	</fieldset>
	<div id="sales_order_base_custmer_grd">
	</div>
</div>
<div id="sales_order_base_custmer_link_man" style="display: none;">
	<%--弹出客户联系人选择框--%>
	<fieldset>
			<legend>筛选条件</legend>
			<table class="table" style="width: 100%;">
				<tr>
					<th>联系人</th>
					<td><input id="sales_order_base_custmer_link_man_" style="border:1px solid #95B8E7"/></td>
					<th>联系电话</th>
					<td><input id="sales_order_base_custmer_link_tel_" style="border:1px solid #95B8E7"/></td>
					<td>
						<div style="float: left;">
						<a id="sales_order_base_custmer_link_man_search_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
						</div>
						<div class="datagrid-btn-separator"></div>
						<div style="float: left;">
						<a id="sales_order_base_custmer_link_man_ok_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-true'" plain="true">确定</a>
						<div>
					</td>
				</tr>
			</table>
	</fieldset>
	<div id="sales_order_base_custmer_link_man_grd">
	</div>
</div>
<%-- 合同查询对话框--%>
<div id="sales_order_base_sales_contract_dialog">
	<fieldset>	
		<legend>查询销售合同</legend>
		<table class="table" style="width: 100%;"><%--商家信息 --%>
			<tr>
				<th>合同编号</th>
				<td><input id="sales_order_base_sales_contract_id" style="border:1px solid #95B8E7"/></td>
				<td>
					<div style="float: left;">
					<a id="sales_order_base_sales_contract_search_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
					</div>
					<div class="datagrid-btn-separator"></div>
					<div style="float: left;">
					<a id="sales_order_base_sales_contract_ok_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-true'" plain="true">确定</a>
					<div>
				</td>
			</tr>
		</table>
	</fieldset>
	<div id="sales_order_base_sales_contract_grd"></div><%--销售合同列表--%>
</div>