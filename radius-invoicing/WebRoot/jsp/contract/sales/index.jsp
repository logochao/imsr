<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <jsp:include flush="true" page="/common/includ.jsp"></jsp:include>
<title>销售合同管理</title>
<script type="text/javascript">
	var contract_sales_panel=null; 
	var contract_sales_panel_tools=null; 
	var contract_sales_goods_grd=null;
	var contract_sales_pay_grd=null;
	var contract_sales_scan_grd=null;
	var contract_sales_quoted_price_grd=null;
	$(document).ready(function(){
		contract_sales_panel_tools=$("#contract_sales_panel_tools").panel({
			border:false,
			href:'/stock/jsp/contract/sales/toolbar.jsp'
		});
		contract_sales_goods_grd=$('#contract_sales_goods_grd').datagrid({
				//url:'/stock/jsp/contract/sales/datagrid_data2.json',
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
					{field:'priceEu',title:'折合单价',width:60},
					{field:'unit',title:'规格',width:120},
					{field:'amount',title:'金额',width:120},
					{field:'mome',title:'备注',width:250,align:'center'}
				]]
		});
		contract_sales_pay_grd=$('#contract_sales_pay_grd').datagrid({
				fitColumns:true,
        		autoRowHeight:false,
        		border:false,
        		striped:true,
        		rownumbers:true,
        		collapsible:true,
        		columns:[[
        			{field:'productid',title:'款项批次',width:100,align:'center'},
        			{field:'productname',title:'币种',width:60,align:'center'},
					{field:'amount',title:'金额',width:120,align:'center'},
					{field:'unit',title:'款项期限',width:80,align:'center'},
					{field:'zmount',title:'支付方式',width:120,align:'center'},
					{field:'aunit',title:'应收应付',width:120,align:'center'},
					{field:'format',title:'人民币大写',width:220,align:'center'},
					{field:'marker',title:'备注',width:250,align:'center'}
				]]
		});
		contract_sales_scan_grd=$('#contract_sales_scan_grd').datagrid({
				url:'/stock/jsp/contract/sales/datagrid_data_contract_scan.json',
				fitColumns:true,
        		autoRowHeight:false,
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
		contract_sales_quoted_price_grd=$('#contract_sales_quoted_price_grd').datagrid({
				url:'/stock/jsp/contract/sales/datagrid_data2.json',
        		fitColumns:true,
        		autoRowHeight:false,
        		border:false,
        		striped:true,
        		rownumbers:true,
        		collapsible:true,
        		columns:[[
        			{field:'productid',title:'商品编号',width:100},
        			{field:'productname',title:'商品名称',width:120},
					{field:'amount',title:'数量',width:60},
					{field:'unit',title:'单位',width:60},
					{field:'zmount',title:'折合数量',width:60},
					{field:'aunit',title:'折合单位',width:60},
					{field:'format',title:'包装规格',width:120},
					{field:'price',title:'单价',width:60},
					{field:'zprice',title:'折合单价',width:60},
					{field:'sum',title:'金额',width:120},
					{field:'marker',title:'备注',width:250,align:'center'}
				]]
		});
		
		$('#contract_sales_index_pay_time').datebox({
	 		required:true
	 	});
		$('#contract_sales_index_receivables_time').datebox({
	 		required:true
	 	});
	});
</script>
</head>
<div id="contract_sales_layout" class="easyui-layout" style="width:100%;height:100%;" fit="true">
    <div data-options="region:'north',split:true" style="width:100%;height:210px;" border="false">
    	<div id="contract_sales_panel_tools"></div>
    	<div style="width:100%;height:100%;padding:15px;" fit="true" id="contract_sales_panel" class="easyui-panel" border="false">
    		<jsp:include flush="true" page="sale_base.jsp"></jsp:include>
    	</div>
    </div>
    <div data-options="region:'center',split:true" fit="true" border="false">
    	<div class="easyui-tabs" data-options="split:true" fit="true" border="false" fit="true">
    		<div title="合同商品明细" fit="true">
    			<div id="contract_sales_goods_grd_form">
    				<jsp:include flush="true" page="contract_sales_goods_grd_form.jsp"></jsp:include>
    			</div>
    			<div id="contract_sales_goods_grd">
    			</div>
	        </div>
	        <div title="合同条款">
	        <%--合同条款对应界面 --%>
	        	<jsp:include flush="true" page="contract_sales_clause.jsp"></jsp:include>
	        </div>
	        <div title="销售保函" style="text-align: center">
	        	<table class="table" align="center" style="width: 100%;">
	        		<tr>
	        			<th>保函金额*</th>
	        			<td><input/></td>
	        			<th>付款日期*</th>
	        			<td><input id="contract_sales_index_pay_time"/></td>
	        			<th>收款日期*</th>
	        			<td><input id="contract_sales_index_receivables_time"/></td>
	        		</tr>
	        	</table>
	        </div>
	        <div title="支付方式详情">
	        	<jsp:include flush="true" page="contract_sale_pay_detail.jsp"></jsp:include>
	        </div>
	        <div title="合同备注">
	            <table class="table" style="width: 100%;">
	            	<tr>
	            		<th>合同备注</th>
	            		<td>
	            		 <textarea rows="5" cols="170"></textarea>
	            		</td>
	            	</tr>
	            </table>
	        </div>
	        <div title="合同扫描件">
	        	<table class="table" style="width: 100%;">
	        		<tr>
	        			<th>扫描件数量</th>
	        			<td colspan="5" style="text-align: left;"><input/></td>
	        		</tr>
	        		<tr>
	        			<th>扫描件编码</th>
	        			<td><input/></td>
	        			<th>选择文件</th>
	        			<td colspan="2"><input  style="width: 200px;"/></td>
	        			<td>
	        				<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" plain="true">加入(A)</a>
							<a id="btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-remove'" plain="true">删除(D)</a>
	        			</td>
	        		</tr>
	        	</table>
	        	<div id="contract_sales_scan_grd"><%--合同扫描件--%></div>
	        </div>
	        <div title="报价记录">
	        	<div id="contract_sales_quoted_price_grd">
	        	</div>
	        </div>
    	</div>
    </div>
</div>
</html>