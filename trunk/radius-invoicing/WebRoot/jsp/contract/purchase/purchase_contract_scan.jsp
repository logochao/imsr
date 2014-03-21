<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String path = request.getContextPath();%>
<script type="text/javascript" src="<%=path%>/jslib/plupload/zh_CN.js"></script>
<script type="text/javascript">
<!--
function Uploader(chunk,callBack){
	var addWin = $('<div style="overflow: hidden;"/>');
	var upladoer = $('<iframe/>');
	upladoer.attr({'src':'<%=path%>/upload_common.jsp?chunk='+chunk,width:'100%',height:'100%',frameborder:'0',scrolling:'no'});
	addWin.window({
		title:"上传文件",
		height:350,
		width:550,
		minimizable:false,
		modal:true,
		collapsible:false,
		maximizable:false,
		resizable:false,
		content:upladoer,
		onClose:function(){
			var fw = GetFrameWindow(upladoer[0]);
			var files = fw.files;
			$(this).window('destroy');
			callBack.call(this,files);
		},
		onOpen:function(){
			var target = $(this);
			setTimeout(function(){
				var fw = GetFrameWindow(upladoer[0]);
				fw.target = target;
			},100);
		}
	});
}

/**
 * 根据iframe对象获取iframe的window对象
 * @param frame
 * @returns {Boolean}
 */
function GetFrameWindow(frame){
	return frame && typeof(frame)=='object' && frame.tagName == 'IFRAME' && frame.contentWindow;
}
 
function makerUpload(chunk){
 Uploader(chunk,function(files){
	 if(files && files.length>0){
		 $("#contract_sales_scan_res").text(files.join(","));
	 }
 });
}

var purchase_contract_scan_contract_accessory_grd = null;//合同扫描件列表
var purchase_contract_scan_quantity = null;//合同扫描件数量
$(function(){
 //-------------------------------------------采购合同扫描件列表-----------------------------------------
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
				{field:'open',title:'操作',width:250,align:'center'}
			]]
	});
	
	//合同扫描件数量
	purchase_contract_scan_quantity=$('#purchase_contract_scan_quantity').numberspinner({
		min: 0,
		max: 10,
		editable: false
	});
	purchase_contract_scan_quantity.numberspinner('setValue',0);//设置初始数量为0
	
	//---------------------------------业务处理------------------------------------------------
	//添加合同扫描件按钮
	$('purchase_contract_scan_grd_add_btn').on('click',function(){
	
	});
	
	//删除合同扫描件按钮
	$('#purchase_contract_scan_grd_delete_btn').on('click',function(){
	
	});
});

//-->
</script>
<table class="table" style="width: 100%;margin-top: 10px;">
	<tr>
		<th>扫描件数量</th>
		<td colspan="5" style="text-align: left;border:1px solid #95B8E7;">
			<input id="purchase_contract_scan_quantity"/>
		</td>
	</tr>
	<tr>
		<th>扫描件编码</th>
		<td><input id="purchase_contract_scan_code" style="border:1px solid #95B8E7;"/></td>
		<th>选择文件</th>
		<td colspan="2">
			<a class="easyui-linkbutton" plain="true" href="javascript:makerUpload(false)">上传文件</a> 
		    <div id="purchase_contract_scan_res"></div>
		</td>
		<td>
			<a id="purchase_contract_scan_grd_add_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" plain="true">加入(A)</a>
			<a id="purchase_contract_scan_grd_delete_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-remove'" plain="true">删除(D)</a>
		</td>
	</tr>
</table>
<div id="purchase_contract_scan_contract_accessory_grd"><%--合同扫描件--%></div>