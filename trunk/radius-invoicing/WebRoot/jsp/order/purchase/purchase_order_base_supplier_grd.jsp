<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
var purchase_order_base_supplier_grd = null;//供应商信息列表
$(function(){
	//供应商信息列表
 	purchase_order_base_supplier_grd=$('#purchase_order_base_supplier_grd').datagrid({
   		autoRowHeight:false,
   		border:false,
   		striped:true,
   		rownumbers:true,
   		collapsible:true,
   		frozenColumns:[[
   			 {field:'supplierId',title:'供应商编号',width:80},
   			 {field:'shortName',title:'供应商简称',width:100},
   			 {field:'supplierName',title:'供应商名称',width:200}
   		]],
   		columns:[[
   			 {field:'supplierProperty',title:'供应商性质',width:120,formatter:supplierPropetyFormatter},
   			 {field:'linkman',title:'联系人',width:120},
   			 {field:'contactInfo',title:'手机号',width:60},
   			 {field:'tel',title:'电话',width:60},
   			 {field:'fax',title:'传真',width:60},
   			 {field:'supplierIllustrate',title:'供应商说明',width:320},
   			 {field:'officeAddress',title:'办公地址',width:120},
   			 {field:'postCode',title:'邮编',width:60},
   			 {field:'url',title:'网址',width:120},
   			 {field:'email',title:'Email',width:120},
			<%--
   			 {field:'deliveryType',title:'送货方式',width:120},
   			 {field:'marketZone',title:'市场区域',width:120},
   			 
   			 {field:'accountBank',title:'开户行',width:120},
   			 {field:'accountName',title:'帐户名',width:120},
   			 {field:'bankAccno',title:'银行帐号',width:120},
   			 {field:'payType',title:'支付类型',width:120},
   			 {field:'taxNo',title:'税号',width:120},
   			 {field:'voucher',title:'票据',width:120},
   			 --%>
   			 {field:'goodsBillsdate',title:'货期',width:80},
   			 {field:'minOrderAmount',title:'起订额',width:80,formatter: function(value,row,index){
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
 *格式化供应商属性
 *
 */
function supplierPropetyFormatter(value,row,index){
	return com.radius.datagrid.formatter(value,row,index,purchase_order_base_supplier_dialog_supplier_property);
}
</script>
<div id="purchase_order_base_supplier_grd">
</div>