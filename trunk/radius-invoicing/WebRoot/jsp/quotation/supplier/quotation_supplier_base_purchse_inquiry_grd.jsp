<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
var quotation_supplier_base_purchase_inquiry_grd= null;
$(function(){
	quotation_supplier_base_purchase_inquiry_grd=$('#quotation_supplier_base_purchase_inquiry_grd').datagrid({
   		autoRowHeight:false,
   		border:false,
   		striped:true,
   		rownumbers:true,
   		collapsible:true,
   		frozenColumns:[[
   			{field:'purchaseInquiryId',title:'采购询价单号',width:80},
			{field:'supplierId',title:'供应商编号',width:80},
			{field:'supplierName',title:'供应商名称',width:80},
			{field:'cashType',title:'币种',width:80}
   		]],
   		columns:[[
			{field:'man',title:'联系人',width:80},
			{field:'mobile',title:'联系人手机',width:80},
			{field:'tel',title:'联系电话',width:80},
			{field:'fax',title:'传真',width:80},
			{field:'address',title:'送货地址',width:180},
			{field:'inquiryDate',title:'询价日期',width:80},
			{field:'latestQuotateDate',title:'最迟报价日期',width:80},
			//{field:'salesman',title:'业务员',width:80},
			//{field:'status',title:'状态',width:80},
			//{field:'printTimes',title:'打印次数',width:80},
			//{field:'printTime',title:'最新打印时间',width:80},
			//{field:'printRecord',title:'最新打印记录',width:80},
			{field:'memo',title:'备注',width:250,align:'center'}
		]]
	});
});
</script>
<div id="quotation_supplier_base_purchase_inquiry_grd"></div>