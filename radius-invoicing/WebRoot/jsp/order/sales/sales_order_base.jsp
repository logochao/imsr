<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
 var sales_order_base_status=null;
 $(function (){
 	//合同状态
	sales_order_base_status=$('#sales_order_base_status').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=2400',
 		valueField: 'id',
		textField: 'name',
		onLoadSuccess:function(){
			var target = $(this);
			target.combobox("setValue",target.val());
			target.combobox('disable');
		}
 	});
 	
 	$('#sales_order_base_custmer_btn').on('click',function(){
 		sales_order_base_customer_dialog.dialog('open');
 	});
 		
 	$('#sales_order_base_custmer_link_man_btn').on('click',function(){
 	   if($('#sales_order_base_customer_id').val().length>0){
 			sales_order_base_link_man_dialog.dialog('open');
 		}else{
 			$.messager.alert('提示','请选择客户信息...','warning');
 		}
 	});
	
	$('#sales_order_base_sales_contract_btn').on('click',function(){//绑定销售合同对话框按钮
		var customer_id = $('#sales_order_base_customer_id').val();//客户编号
		if(!(customer_id&&customer_id.length>0)){
			$.messager.alert('提示','请选择客户信息','error');
			return ;		
		}
		sales_order_base_sales_contract_dialog.dialog('open');
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
			$.messager.alert('提示','与服务端通信失败...','error');
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
		specId:_data.specId,//规格
		unit:_data.unit,//包装单位
		priceUnit:parseFloat(_data.priceUnit)/100,//包装单位单价
		equivalentUnit:_data.equivalentUnit,//折合单位
		priceEu:parseFloat(_data.priceEu)/100,//折合单位单价
		quantityEuPerUnit:_data.quantityEuPerUnit,//包装单位折合数量
		quantityEu:_data.quantityEu,//折合数量
		quantityUnit:_data.quantityUnit,//数量
		amount:parseFloat(_data.amount)/100,//金额
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
	var rows = sales_order_goods_detail_grd.datagrid('getRows');//获取当前页所有数据行
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
	sales_order_goods_detail_grd.datagrid('updateRow',{
		index:row_index,
		row:row_data
	});
	//2.更新memcached
	var memcached_data={
		contractId:$('#sales_order_base_id').val(),//销售订单编号
		goodsId:goodsId,//商品编号
		quantityUnit:quantityUnit,
		amount:parseFloat(amount)*100  //*100-->转化为整数
	};
	salesOrderGoodsMemcached(memcached_url,memcached_data);
}




/**
 * 销售订单列表添加数据行
 * @param memcached_url 缓存地址
 * @param row_data 已经组装好的行数据
 **/
function addSalesOrderGoodsGrdRow(memcached_url,row_data){
	//1.添加行数据
	sales_order_goods_detail_grd.datagrid('insertRow',{
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
	    orderId				:$('#sales_order_base_id').val(),//销售订货单编号
	   /*
		goodsId				:row_data.goodsId,//商品编号
   		goodsName			:row_data.goodsName,//商品名称
		specId				:sales_order_goods_detail_spec_type.combobox('getValue'),//规格
		unit				:sales_order_goods_detail_spec_unit.combobox('getValue'),//包装单位
		priceUnit			:parseFloat(row_data.priceUnit)*100,//包装单位单价
		equivalentUnit		:sales_order_goods_detail_equivalent_unit.combobox('getValue'),//折合单位
		priceEu				:parseFloat(row_data.priceEu)*100,//折合单位单价
		quantityEuPerUnit	:row_data.quantityEuPerUnit,//包装单位折合数量
		quantityEu			:row_data.quantityEu,//折合数量
		quantityUnit		:row_data.quantityUnit,//数量
		amount				:parseFloat(row_data.amount)*100,//金额
		mome				:row_data.mome,//备注
		**/
		goodsId				:row_data.goodsId,//商品编号
		goodsName			:row_data.goodsName,//商品名称
		specId				:row_data.specId,//规格编码
		unit				:row_data.unit,//包装单位(规格)
		priceUnit			:parseFloat(row_data.priceUnit)*100,//包装单位单价
		equivalentUnit		:row_data.equivalentUnit,//折合单位
		priceEu				:parseFloat(row_data.priceEu)*100,//折合单位单价
		quantityEuPerUnit	:row_data.quantityEuPerUnit,//包装单位折合数量
		quantityUnit		:row_data.quantityUnit,//数量
		quantityEu			:row_data.quantityEu,//折合数量
		amount				:parseFloat(row_data.amount)*100,//金额
		//upperAmount			:"",//大写金额
		//status				:"",//状态
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
			if(data.success){
				//2.将datagrid的数据进行删除
				//3.将合同总金额归 0
				$('#sales_order_goods_detail_grd').datagrid('loadData', {total: 0,rows:[]});
				sales_order_total_amount=0;
			}
		},
		error:function(data){
			console.info('与后台访问通讯失败');
		}
	});
}

/**
 *清空销售订单信息
 **/
function clearSalesOrderBase(){
	com.radius.combobox.setelement(sales_order_base_status,'setValue','2401');//设置合同默认状态
	$('#sales_order_base_order_time').val('');//清空订货日期
	$('#sales_order_base_customer_name').val('');
	$('#sales_order_base_customer_id').val('');
	$('#sales_order_base_order_end_time').val('');
	$('#sales_order_base_link_man').val('');
	$('#sales_order_base_link_tel').val('');
	$('#sales_order_base_link_mobile').val('');
	$('#sales_order_base_link_fax').val('');
	$('#sales_order_base_delivery_point').val('');
	$('#sales_order_base_trade_assistant').val('');
	$('#sales_order_base_sales_contract_id').val('');
	$('#sales_order_base_total_amount').val('');
}

/**
 *设置订单基本信息
 *@params{} row_data
 **/
function setSalesOrderBaseInfo(row_data){
	setInputElementValue($('#sales_order_base_id'),row_data.salesOrderId);//销售合同编号
	sales_order_base_status.combobox('setValue',row_data.status);//状态
	setInputElementValue($('#sales_order_base_customer_name'),row_data.customerName);//客户名称
	setInputElementValue($('#sales_order_base_customer_id'),row_data.customerId);//客户编号
	$('#sales_order_base_order_time').val(row_data.orderedDate);//订货日期
	$('#sales_order_base_order_end_time').val(row_data.deliveryDate);//交货时间
	setInputElementValue($('#sales_order_base_link_man'),row_data.linkMan);//联系人
	setInputElementValue($('#sales_order_base_link_tel'),row_data.tel);//联系电话
	setInputElementValue($('#sales_order_base_link_mobile'),row_data.mobile);//联系人手机
	setInputElementValue($('#sales_order_base_link_fax'),row_data.fax);//传真
	setInputElementValue($('#sales_order_base_delivery_point'),row_data.deliveryPoint);//送货地点
	setInputElementValue($('#sales_order_base_trade_assistant'),row_data.salesManId);//业务员
	setInputElementValue($('#sales_order_base_sales_contract_id'),row_data.contractId);//销售合同编号
	setInputElementValue($('#sales_order_base_total_amount'),parseFloat(row_data.totalAmount)/100);//合同总金额
}
//-->
</script>
<table class="table" style="width: 100%;">
	<tr>
		<th>销售订单号<font color="red">*</font></th> 
		<td><input class="easyui-validatebox" style="background:#eee;width: 150px;border:1px solid #95B8E7" id="sales_order_base_id" type="text" readonly="readonly"  data-options=""/></td>
		<th>状态</th>
		<td colspan="3"><input id="sales_order_base_status"  class="easyui-validatebox" class="easyui-combobox"  data-options="" value="2401"/></td>
		<th>订货日期</th>
		<td><input class="easyui-validatebox Wdate" type="text" id="sales_order_base_order_time"  onClick="WdatePicker()" style="border:1px solid #95B8E7"/></td>
	</tr>
	<tr>
		<th>客户<font color="red">*</font></th>
		<td colspan="5">
			<input  type="text" id="sales_order_base_customer_name" style="width: 300px;border:1px solid #95B8E7;float: left;" readonly="readonly" data-options="" style="border:1px solid #95B8E7"/> 
			<input  type="hidden" id="sales_order_base_customer_id" readonly="readonly" data-options="" style="border:1px solid #95B8E7"/> 
			<a id="sales_order_base_custmer_btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>交货日期</th>
		<td><input class="easyui-validatebox Wdate" type="text" id="sales_order_base_order_end_time" onClick="WdatePicker()"/></td>
	</tr>
	<tr>
		<th>联系人</th>
		<td>
			<input id="sales_order_base_link_man" class="easyui-validatebox" type="text" name="man"style="border:1px solid #95B8E7;float: left;" />
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
			<input class="easyui-validatebox" id="sales_order_base_trade_assistant" style="border:1px solid #95B8E7;float: left;"/>
			<a id="btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th colspan="2" style="text-align: center;"></th>
	</tr>
	<tr>
		<th>合同编号<font color="red">*</font></th>
		<td>
			<input class="easyui-validatebox" id="sales_order_base_sales_contract_id" type="text" readonly="readonly" style="border:1px solid #95B8E7;float: left;"/>
			<a id="sales_order_base_sales_contract_btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>合同总金额</th>
		<td>
			<input id="sales_order_base_total_amount"  readonly="readonly" style="background:#eee;width: 150px;border:1px solid #95B8E7;"/>
			<input id="sales_order_base_upper_total_amount"  type="hidden"/>
		</td>
		<th colspan="4"></th>
	</tr>
</table>
<jsp:include flush="true" page="sales_order_base_customer.jsp"></jsp:include>
<jsp:include flush="true" page="sales_order_base_link_man.jsp"></jsp:include>
<jsp:include flush="true" page="sales_order_base_sales_contract.jsp"></jsp:include>
