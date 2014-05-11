<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
var business_supplier_search_supplier_property = null;//客户属性
var business_supplier_search_add_supplier_dialog = null;//添加客户信息对对话框
var business_supplier_search_add_supplier_dialog_form_supplier_property = null;//客户属性
var business_supplier_search_add_supplier_dialog_form_delivery_type = null;//送货方式
var business_supplier_search_add_supplier_dialog_form_pay_type = null;
var business_supplier_search_add_supplier_dialog_form_market_zone = null;//市场区域
 $(function (){
 	//----------------------------------初始化--------------------------------------------------------
 	//添加供应商信息对话框
 	business_supplier_search_add_supplier_dialog=$('#business_supplier_search_add_supplier_dialog').show().dialog({
		 title:'添加供应商信息',
		 width:800,
		 height:380,
		 collapsible:true,//向上缩小按钮
		 maximizable:true,
		 modal:true,
		 closed:true,
		 toolbar:['-',{
	 			 id:'business_supplier_search_add_supplier_dialog_save_btn',
	 			 text:'供应商保存',
	 			 iconCls: 'icon-add',
	 			 handler:addsupplierInfoSaveBtn
	 			},'-',{
	 			 id:'business_supplier_search_add_supplier_dialog_close_btn',
	 			 text:'关闭',
	 			 iconCls: 'icon-cancel',
	 			 handler:addsupplierInfoCloseBtn
	 			},
	 	'-']
	});
	//供应商属性
	business_supplier_search_add_supplier_dialog_form_supplier_property = $('#business_supplier_search_add_supplier_dialog_form_supplier_property').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=1200',
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
	//公司属性
 	business_supplier_search_supplier_property=$('#business_supplier_search_supplier_property').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=1200',
 		valueField: 'id',
		textField: 'name',
		/*
		onLoadSuccess:function(){
			var target = $(this);
			var data = target.combobox("getData");
			var options = target.combobox("options");
			if(data && data.length>0){
				var fs = data[0];
				target.combobox("setValue",fs[options.valueField]);
			}
		},
		*/
		editable:false
 	});
 	//送货方式
 	business_supplier_search_add_supplier_dialog_form_delivery_type=$('#business_supplier_search_add_supplier_dialog_form_delivery_type').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=1600',
 		valueField: 'id',
		textField: 'name',
		disabled:true,
		/*
		onLoadSuccess:function(){
			var target = $(this);
			var data = target.combobox("getData");
			var options = target.combobox("options");
			if(data && data.length>0){
				var fs = data[0];
				target.combobox("setValue",fs[options.valueField]);
			}
		},**/
		editable:false
 	});
 	//支付方式
 	business_supplier_search_add_supplier_dialog_form_pay_type=$('#business_supplier_search_add_supplier_dialog_form_pay_type').combobox({
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
 	//市场区域
 	business_supplier_search_add_supplier_dialog_form_market_zone = $('#business_supplier_search_add_supplier_dialog_form_market_zone').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=3800',
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
 	
 	//绑定是否送货中的是radio
 	$('#business_supplier_search_add_supplier_dialog_form_yes').on('click',function(){
 		business_supplier_search_add_supplier_dialog_form_delivery_type.combobox('enable');
 	});
 	//绑定是否送货中的是radio
 	$('#business_supplier_search_add_supplier_dialog_form_no').on('click',function(){
 		business_supplier_search_add_supplier_dialog_form_delivery_type.combobox('setText','');
 		business_supplier_search_add_supplier_dialog_form_delivery_type.combobox('setValue','');
 		business_supplier_search_add_supplier_dialog_form_delivery_type.combobox('disable');
 	});
 	
 	
 	//查询条件
 	$('#business_supplier_search_query_btn').on('click',function(){
 		business_supplier_grd_supplier_grid.datagrid('options').url='${path}/supplier/manager/supplier/supplier_info_detail_2_supplier.html';
 		business_supplier_grd_supplier_grid.datagrid('load',{
 			shortName					:$('#business_supplier_search_supplier_ab').val(),//简称
 			supplierName				:$('#business_supplier_search_supplier_name').val(),//名称
 			supplierProperty			:business_supplier_search_supplier_property.combobox('getValue'),//性质
 			url							:$('#business_supplier_search_supplier_url').val(),//网址
 			taxNo						:$('#business_supplier_search_supplier_tax_no').val(),//税号
 			linkman						:$('#business_supplier_search_supplier_link_man').val(),//联系人
 			contactInfo					:$('#business_supplier_search_supplier_contact_info').val()//联系方式（存放手机号）
 		});
 	});
 	$('#business_supplier_search_clear_btn').on('click',function(){
 		$('#business_supplier_search_supplier_ab').val('');//简称
 		$('#business_supplier_search_supplier_name').val('');//名称
 		business_supplier_search_supplier_property.combobox('setValue','');//性质
 		$('#business_supplier_search_supplier_url').val('');//网址
 		$('#business_supplier_search_supplier_tax_no').val('');//税号
 		$('#business_supplier_search_supplier_link_man').val('');//联系人
 		$('#business_supplier_search_supplier_contact_info').val('');//联系方式（存放手机号）
 	});
 	//-----------------------------------初始化添加商品信息界面---------------------------------------------------
 });
 	
 	
 	
 	//---------------------------------------业务处理--------------------------------------------------------------
 /**
  * 保存商品信息按钮处理事件
  *
  **/
 function addsupplierInfoSaveBtn(){
 	//1.校验数据是否合法
 	var validate = validateAddsupplierInfo();
 	//2.获取格式化话数据
 	var supplier_data = getAddsupplierInfoFormatter();
 	if(!validate){
 		$.messager.alert('提示','待提交的联系人信息不符合要求,请核对...','error');
		return ;
 	}
 	//3.提交信息
 	$.ajax({
		url:'${path}/supplier/manager/supplier/supplier_infos_add.html',
		method:'POST',
		data:supplier_data,
		success:function(r){
			if(r){
				if(!r.success){
					$.messager.alert('提示',r.message,'error');
					return;
				}
				//1.将数据追加到datagrid中
				var row_data=getsupplierInfo2supplierGrid(r.child);
				addBusinesssupplierGrdsupplierGrid(row_data);
				//2.将添加商品界面进行清空处理、关闭对话框
				addsupplierInfoCloseBtn();
				//3.删除联系人的datagrid
				business_supplier_link_man_grd.datagrid('loadData', {total: 0,rows:[]});
				//4.设置新编号(系列号)
				$('#business_supplier_search_supplier_id').val(r.child.deliveryNot);
		    }
		   
		},
		error:function(r){
			$.messager.alert('提示','访问服务发生异常....','error');
		}
	});
 }
 
 function validateAddsupplierInfo(){
 	var validata=true;
 	return validata;
 }
 
 /**
  * 添加商品的关闭按钮事件
  **/
 function addsupplierInfoCloseBtn(){
 	//1.将对话框中的内容清空
 	resetBusinesssupplierSearchAddsupplierDialogForm();
 	//2.关闭对话框
 	business_supplier_search_add_supplier_dialog.dialog('close');
 }
 
 /**
  * 获取待添加的信息
  * @return json
  **/
 function getAddsupplierInfoFormatter(){
 	var _isDelivery='0';
 	var radios = document.getElementsByName("yes_no");
 	for(radio in radios){
 		if(radios[radio].checked) {
 			_isDelivery='1';
 			break;
 		}
 	}
 	var json={
 		//--------信息-------
 		supplierId			:$('#business_supplier_search_supplier_id').val(),//编号(产生的一个系列值)
 		shortName			:$('#business_supplier_search_add_supplier_dialog_form_ab').val(),//简称
 		supplierName		:$('#business_supplier_search_add_supplier_dialog_form_name').val(),//名称
 		linkman				:$('#business_supplier_search_add_supplier_dialog_form_link_man').val(),//联系人
 		contactInfo			:$('#business_supplier_search_add_supplier_dialog_form_contact_info').val(),//联系方式（存放手机号）
 		tel					:$('#business_supplier_search_add_supplier_dialog_form_tel').val(),//电话
 		fax					:$('#business_supplier_search_add_supplier_dialog_form_fax').val(),//传真
 		supplierIllustrate	:$('#business_supplier_search_add_supplier_dialog_form_supplier_illustrate').val(),//说明
 		supplierProperty	:business_supplier_search_add_supplier_dialog_form_supplier_property.combobox('getValue'),//性质
 		officeAddress		:$('#business_supplier_search_add_supplier_dialog_form_office_address').val(),//办公地址
 		postCode			:$('#business_supplier_search_add_supplier_dialog_form_post_code').val(),//邮编
 		url					:$('#business_supplier_search_add_supplier_dialog_form_url').val(),//网址
 		email				:$('#business_supplier_search_add_supplier_dialog_form_email').val(),//Email
 		marketZone			:business_supplier_search_add_supplier_dialog_form_market_zone.combobox('getValue'),//市场区域
 		deliveryNot			:_isDelivery,//是否送货 
 		deliveryType		:business_supplier_search_add_supplier_dialog_form_delivery_type.combobox('getValue'),//送货方式
 		payType				:business_supplier_search_add_supplier_dialog_form_pay_type.combobox('getValue'),//支付类型
 		accountBank			:$('#business_supplier_search_add_supplier_dialog_form_account_bank').val(),//开户行
 		accountName			:$('#business_supplier_search_add_supplier_dialog_form_account_name').val(),//帐户名
 		bankAccno			:$('#business_supplier_search_add_supplier_dialog_form_bank_acc_no').val(),//银行帐号
 		taxNo				:$('#business_supplier_search_add_supplier_dialog_form_tax_no').val(),//税号
 		voucher				:$('#business_supplier_search_add_supplier_dialog_form_voucher').val(),//票据
 		goodsBillsdate		:$('#business_supplier_search_add_supplier_dialog_form_goods_bills_date').val(),//货期
 		minOrderAmount		:parseFloat($('#business_supplier_search_add_supplier_dialog_form_order_amount').val())*100,//起订额
 		purchaser			:$('#business_supplier_search_add_supplier_dialog_form_purchaser').val(),//采购员
 		memo				:$('#business_supplier_search_add_supplier_dialog_form_mome').val()//备注
 	};
 	return json;
 }
 
 /**
  * 重置信息表单域中的数据
  *
  **/
 function resetBusinesssupplierSearchAddsupplierDialogForm(){
 		$('#business_supplier_search_supplier_id').val(''),//编号(产生的一个系列值)
		$('#business_supplier_search_add_supplier_dialog_form_ab').val(''),//简称
		$('#business_supplier_search_add_supplier_dialog_form_name').val(''),//名称
		//$('#business_supplier_search_add_supplier_dialog_form_address').val(''),//地址
		$('#business_supplier_search_add_supplier_dialog_form_link_man').val(''),//联系人
		$('#business_supplier_search_add_supplier_dialog_form_contact_info').val(''),//联系方式（存放手机号）
		$('#business_supplier_search_add_supplier_dialog_form_tel').val(''),//电话
		$('#business_supplier_search_add_supplier_dialog_form_fax').val(''),//传真
		$('#business_supplier_search_add_supplier_dialog_form_supplier_illustrate').val(''),//说明
		business_supplier_search_add_supplier_dialog_form_supplier_property.combobox('setText',''),//性质
		business_supplier_search_add_supplier_dialog_form_supplier_property.combobox('setValue',''),//性质
		$('#business_supplier_search_add_supplier_dialog_form_office_address').val(''),//办公地址
		$('#business_supplier_search_add_supplier_dialog_form_post_code').val(''),//邮编
		$('#business_supplier_search_add_supplier_dialog_form_url').val(''),//网址
		$('#business_supplier_search_add_supplier_dialog_form_email').val(''),//Email
		
		//false,//是否送货 
		business_supplier_search_add_supplier_dialog_form_market_zone.combobox('setText',''),//市场区域
		business_supplier_search_add_supplier_dialog_form_market_zone.combobox('setValue',''),//市场区域
		business_supplier_search_add_supplier_dialog_form_delivery_type.combobox('setText',''),//送货方式
		business_supplier_search_add_supplier_dialog_form_delivery_type.combobox('setValue',''),//送货方式
		business_supplier_search_add_supplier_dialog_form_pay_type.combobox('setText',''),//支付类型
		business_supplier_search_add_supplier_dialog_form_pay_type.combobox('setValue',''),//支付类型
		$('#business_supplier_search_add_supplier_dialog_form_account_bank').val(''),//开户行
		$('#business_supplier_search_add_supplier_dialog_form_account_name').val(''),//帐户名
		$('#business_supplier_search_add_supplier_dialog_form_bank_acc_no').val(''),//银行帐号
		$('#business_supplier_search_add_supplier_dialog_form_tax_no').val(''),//税号
		$('#business_supplier_search_add_supplier_dialog_form_voucher').val(''),//票据
		$('#business_supplier_search_add_supplier_dialog_form_goods_bills_date').val(''),//货期
		$('#business_supplier_search_add_supplier_dialog_form_order_amount').val(''),//起订额
		$('#business_supplier_search_add_supplier_dialog_form_purchaser').val(''),//业务员
		$('#business_supplier_search_add_supplier_dialog_form_mome').val('')//备注
 }
 
 /**
  *将后台数据格式化符合信息列表(datagrid)
  *@params{} _data
  *@return   json
  */
 function getsupplierInfo2supplierGrid(_data){
 	var json={
 		supplierId			:_data.supplierId,				
		shortName			:_data.shortName,
		supplierName		:_data.supplierName,
		linkman				:_data.linkman,
		contactInfo			:_data.contactInfo,
		tel					:_data.tel,
		fax					:_data.fax,
		supplierIllustrate	:_data.supplierIllustrate,
		supplierProperty	:_data.supplierProperty,
		officeAddress		:_data.officeAddress,
		postCode			:_data.postCode,
		url					:_data.url,
		email				:_data.email,
		marketZone			:_data.marketZone,
		deliveryType		:_data.deliveryType,
		payType				:_data.payType,
		accountBank			:_data.accountBank,
		accountName			:_data.accountName,
		bankAccno			:_data.bankAccno,
		taxNo				:_data.taxNo,
		voucher				:_data.voucher,
		goodsBillsdate		:_data.goodsBillsdate,
		minOrderAmount		:_data.minOrderAmount,
		purchaser			:_data.purchaser,
		memo				:_data.memo
 		
 	};
 	return json;
 }
//-->
</script>
<div id="business_supplier_search_search_supplier_info">
	<table  style="width: 100%;">
		<tr>
			<th>简称:</th>
			<td>
				<input id="business_supplier_search_supplier_id" type="hidden"  style="border:1px solid #95B8E7" value="${supplier.supplierId}"/>
				<input id="business_supplier_search_supplier_ab"  style="border:1px solid #95B8E7"/>
			</td>
			<th>名称:</th>
			<td><input id="business_supplier_search_supplier_name" style="border:1px solid #95B8E7"/></td>
			<th>性质:</th>
			<td><input id="business_supplier_search_supplier_property"  style="border:1px solid #95B8E7"/></td>
			<th>网址:</th>
			<td><input id="business_supplier_search_supplier_url" style="border:1px solid #95B8E7"/></td>
		</tr>
		<tr>
			<th>税号:</th>
			<td><input id="business_supplier_search_tax_no"  style="border:1px solid #95B8E7"/></td>
			<th>默认联系人:</th>
			<td><input id="business_supplier_search_link_man" style="border:1px solid #95B8E7"/></td>
			<th>默认手机号:</th>
			<td><input id="business_supplier_search_contact_info" style="border:1px solid #95B8E7"/></td>
			<td colspan="2" style="text-align: center;" >
				<div style="float: left;margin-top: 5px;">
					<a id="business_supplier_search_query_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
				</div>
				<div style="float: left;margin-left: 10px;margin-top: 5px;">
					<a id="business_supplier_search_clear_btn"  href="#" class="easyui-linkbutton" data-options="iconCls:'icon-undo'" plain="true">重置</a>
				<div>
			</td>
		</tr>
	</table>
</div>
<div id="business_supplier_search_add_supplier_dialog">
	<form id="business_supplier_search_add_supplier_dialog_form">
		<table  style="width: 100%;margin-left: 10px;height: 100px;">
			<tr>
				<td>简称</td>
				<td><input id="business_supplier_search_add_supplier_dialog_form_ab" style="border:1px solid #95B8E7"/> </td>
				<td>名称</td>
				<td><input id="business_supplier_search_add_supplier_dialog_form_name" style="border:1px solid #95B8E7"/> </td>
				<td>联系人</td>
				<td>
					<input id="business_supplier_search_add_supplier_dialog_form_link_man" style="border:1px solid #95B8E7"/>
				 </td>
			</tr>
			<tr>
				<td>手机号</td>
				<td><input id="business_supplier_search_add_supplier_dialog_form_contact_info"  class="easyui-validatebox"   data-options="validType:'phone',missingMessage:'请输入手机号',invalidMessage:'请输入正确的格式'" style="border:1px solid #95B8E7"/> </td>
				<td>电话</td>
				<td><input id="business_supplier_search_add_supplier_dialog_form_tel" class="easyui-validatebox"   data-options="validType:'tel',missingMessage:'请输入电话',invalidMessage:'请输入正确的格式'" style="border:1px solid #95B8E7"/> </td>
				<td>传真</td>
				<td><input id="business_supplier_search_add_supplier_dialog_form_fax" class="easyui-validatebox"   data-options="validType:'tel',missingMessage:'请输入传真',invalidMessage:'请输入正确的格式'" style="border:1px solid #95B8E7"/> </td>
			</tr>
			<tr>
				<td>说明</td>
				<td><input id="business_supplier_search_add_supplier_dialog_form_uses" style="border:1px solid #95B8E7"/> </td>
				<td>性质</td>
				<td><input id="business_supplier_search_add_supplier_dialog_form_supplier_property" style="border:1px solid #95B8E7"/> </td>
				<td>办公地址</td>
				<td><input id="business_supplier_search_add_supplier_dialog_form_office_address" style="border:1px solid #95B8E7"/> </td>
			</tr>
			<tr>
				<td>邮编</td>
				<td><input id="business_supplier_search_add_supplier_dialog_form_post_code" style="border:1px solid #95B8E7"/> </td>
				<td>网址</td>
				<td><input id="business_supplier_search_add_supplier_dialog_form_url" class="easyui-validatebox"   data-options="validType:'webUrl',missingMessage:'请输入网址',invalidMessage:'请输入正确的格式'" style="border:1px solid #95B8E7"/> </td>
				<td>email</td>
				<td><input   id="business_supplier_search_add_supplier_dialog_form_email" class="easyui-validatebox"   data-options="validType:'email',missingMessage:'请输入email',invalidMessage:'请输入正确的格式'" style="border:1px solid #95B8E7"/> </td>
			</tr>
			<tr>
				<td>是否送货</td>
				<td>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input id="business_supplier_search_add_supplier_dialog_form_yes" name="yes_no" value="1" type="radio" />是&nbsp;&nbsp;
					<input id="business_supplier_search_add_supplier_dialog_form_no" name="yes_no"  value="0" type="radio" checked="checked"/>否
				</td>
				<td>送货方式</td>
				<td><input   id="business_supplier_search_add_supplier_dialog_form_delivery_type" style="border:1px solid #95B8E7"/> </td>
				<td>支付类型</td>
				<td><input   id="business_supplier_search_add_supplier_dialog_form_pay_type" style="border:1px solid #95B8E7"/> </td>
			</tr>
			<tr>
				<td>开户行</td>
				<td><input   id="business_supplier_search_add_supplier_dialog_form_account_bank" style="border:1px solid #95B8E7"/> </td>
				<td>帐户名</td>
				<td><input   id="business_supplier_search_add_supplier_dialog_form_account_name" style="border:1px solid #95B8E7"/> </td>
				<td>银行帐号</td>
				<td><input   id="business_supplier_search_add_supplier_dialog_form_bank_acc_no" style="border:1px solid #95B8E7"/> </td>
			</tr>
			<tr>
				<td>税号</td>
				<td><input   id="business_supplier_search_add_supplier_dialog_form_tax_no" style="border:1px solid #95B8E7"/> </td>
				<td>票据</td>
				<td><input   id="business_supplier_search_add_supplier_dialog_form_voucher" class="easyui-validatebox" validType="length[0,4]"missingMessage="请输入票据" invalidMessage="不能超过4个字符!"  style="border:1px solid #95B8E7"/> </td>
				<td>货期</td>
				<td><input   id="business_supplier_search_add_supplier_dialog_form_goods_bills_date" class="easyui-validatebox"   data-options="validType:'numberic',missingMessage:'请输入货期',invalidMessage:'请输入正确的格式'"  style="border:1px solid #95B8E7"/> </td>
			</tr>
			<tr>
				<td>起订额</td>
				<td><input   id="business_supplier_search_add_supplier_dialog_form_order_amount" class="easyui-validatebox"  data-options="validType:'numberic',missingMessage:'请输入起订额',invalidMessage:'请输入正确的格式'" style="border:1px solid #95B8E7"/> </td>
				<td>市场区域</td>
				<td><input   id="business_supplier_search_add_supplier_dialog_form_market_zone" style="border:1px solid #95B8E7"/> </td>
				<td>采购员</td>
				<td><input   id="business_supplier_search_add_supplier_dialog_form_purchaser" style="border:1px solid #95B8E7"/> </td>
			</tr>
		</table>
		<div id="tt" class="easyui-tabs" data-options="split:true" fit="true" border="false" style="margin-top: 10px;"> 
			<div title="描述信息">
				<textarea rows="5" cols="120" id="business_supplier_search_add_supplier_dialog_form_mome" style="border:1px solid #95B8E7"></textarea>
			</div>
			<div title="说明">
				<textarea rows="5" cols="120" id="business_supplier_search_add_supplier_dialog_form_supplier_illustrate" style="border:1px solid #95B8E7"></textarea>
			</div>
			<div data-options="iconCls:'icon-user_add'" title="多联系人">
				<jsp:include flush="true" page="business_supplier_link_man.jsp"></jsp:include>
			</div>
		</div>
	</form>
</div>
