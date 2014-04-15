<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
var business_customer_grd_customer_grid=null;
$(function(){
	business_customer_grd_customer_grid=$('#business_customer_grd_customer_grid').datagrid({
		fitColumns:false,
   		autoRowHeight:false,
   		border:false,
   		striped:true,
   		rownumbers:true,
   		collapsible:true,
   		frozenColumns:[[
   			 {field:'id',title:'客户编号',width:100},
   			 {field:'ab',title:'客户简称',width:100},
   			 {field:'name',title:'客户名称',width:200},
   			 {field:'customerProperty',title:'客户性质',width:120,formatter:customerPropertyFormatter}
   		]],
   		columns:[[
   			 {field:'linkMan',title:'联系人',width:120},
   			 {field:'contactInfo',title:'手机号',width:60},
   			 {field:'tel',title:'电话',width:60},
   			 {field:'fax',title:'传真',width:60},
   			 {field:'customerIllustrate',title:'客户说明',width:320},
   			 {field:'officeAddress',title:'办公地址',width:120},
   			 {field:'postCode',title:'邮编',width:60},
   			 {field:'url',title:'网址',width:120},
   			 {field:'email',title:'Email',width:120},
   			 {field:'deliveryType',title:'送货方式',width:120,formatter:deliveryTypeFormatter},
   			 
   			 {field:'accountBank',title:'开户行',width:120},
   			 {field:'accountName',title:'帐户名',width:120},
   			 {field:'bankAccNo',title:'银行帐号',width:120},
   			 {field:'payType',title:'支付类型',width:120,formatter:payTypeFormatter},
   			 {field:'taxNo',title:'税号',width:120},
   			 {field:'voucher',title:'票据',width:120},
   			 {field:'goodsBillsDate',title:'货期',width:80},
   			 {field:'orderAmount',title:'起订额',width:80,formatter: function(value,row,index){
					 if(value!=undefined&&value!=null&&(value+"").indexOf(".")<=0){
						value=(parseInt(value)/100).toFixed(2);
					 }
					 return value;
				  }	
			},
			{field:'memo',title:'备注',width:250,align:'center'}
		]]
	});
});

/**
 * 将数据添加到商品列表中
 *@params{} row_data
 *
 **/
function addBusinessCustomerGrdCustomerGrid(row_data){
	//1.将数据添加到datagrid中
	addTargetDataGridRowData(business_customer_grd_customer_grid,row_data,0);//target_grid,row_data,row_index
	business_customer_grd_customer_grid.datagrid('acceptChanges');//接受改变
}

/**
 * 格式化客户属性信息
 *@params{}  value
 *@params{}  row
 *@params{}  index
 *@return   
 **/
function customerPropertyFormatter(value,row,index){
	var combobox_data = business_customer_search_add_customer_dialog_form_customer_property.combobox('getData');
	for(var i=0,length=combobox_data.length;i<length;i++){
		if(combobox_data[i].id==value){
			value=combobox_data[i].name;
			break;
		}
	}
	return value;
}

/**
 * 格式化送货方式信息
 *@params{}  value
 *@params{}  row
 *@params{}  index
 *@return   
 **/
function deliveryTypeFormatter(value,row,index){
	var combobox_data = business_customer_search_add_customer_dialog_form_delivery_type.combobox('getData');
	for(var i=0,length=combobox_data.length;i<length;i++){
		if(combobox_data[i].id==value){
			value=combobox_data[i].name;
			break;
		}
	}
	return value;
}
/**
 * 格式化支付类型信息
 *@params{}  value
 *@params{}  row
 *@params{}  index
 *@return   
 **/
function payTypeFormatter(value,row,index){
	var combobox_data = business_customer_search_add_customer_dialog_form_pay_type.combobox('getData');
	for(var i=0,length=combobox_data.length;i<length;i++){
		if(combobox_data[i].id==value){
			value=combobox_data[i].name;
			break;
		}
	}
	return value;
}
</script>
<div id="business_customer_grd_customer_grid"><%--客户列表--%></div>