<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
var purchase_contract_scan_contract_accessory_grd = null;
$(function(){
//合同扫描件列表
	purchase_contract_scan_contract_accessory_grd=$('#purchase_contract_scan_contract_accessory_grd').datagrid({
			fitColumns:true,
       		autoRowHeight:true,
       		border:false,
       		striped:true,
       		rownumbers:true,
       		collapsible:true,
       		columns:[[
       			{field:'code',title:'编号',width:50,align:'center'},
       			{field:'scanFileName',title:'文件名称',width:220,align:'center'},
				{field:'fileOrder',title:'文件顺序',width:60,align:'center'},
				{field:'open',title:'操作',width:250,align:'center',formatter:purchaseContractScanGrdOpenFormatter}
			]]
	});
});

/**
 * 合同扫描件列表格式化
 **/	
function purchaseContractScanGrdOpenFormatter(value,row,index){
	var fileName=row.scanFileName;
	var stop=fileName.indexOf('.');
	return '<a id="'+fileName.substring(0,stop)+'" herf="" rel="'+value+'" plain="true" class="easyui-linkbutton">预览</a>';
}
//-->
</script>
<div id="purchase_contract_scan_contract_accessory_grd"></div>