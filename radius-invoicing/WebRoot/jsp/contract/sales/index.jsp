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
	$(document).ready(function(){
		contract_sales_panel_tools=$("#contract_sales_panel_tools").panel({
			border:false,
			href:'/stock/jsp/contract/sales/toolbar.jsp'
		});
		contract_sales_goods_grd=$('#contract_sales_goods_grd').datagrid({
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
	});
</script>
</head>
<div id="contract_sales_layout" class="easyui-layout" style="width:100%;height:100%;" fit="true">
    <div data-options="region:'north',split:true" style="width:100%;height:200px;" border="false">
    	<div id="contract_sales_panel_tools"></div>
    	<div style="width:100%;height:100%;;padding:15px;" fit="true" id="contract_sales_panel" class="easyui-panel" border="false">
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
	        	<table class="table" align="center">
	        		<tr>
	        			<th>保函金额*</th>
	        			<td><input/></td>
	        			<th>付款日期*</th>
	        			<td><input/></td>
	        			<th>收款日期*</th>
	        			<td><input/></td>
	        		</tr>
	        	</table>
	        </div>
	        <div title="支付方式详情">
	            <table class="table" style="width: 100%;">
					<tr>
						<th>合同总额</th>
						<td><input/></td>
						<th>币种</th>
						<td><input/></td>
						<th>付款方式</th>
						<td><input/></td>
						<th>款项批次</th>
						<td><input/></td>
					</tr>
					<tr>
						<th>金额</th>
						<td>
						<input style="width: 100px;" type="text"  name="name" data-options="required:true"/>
						<input type="text" name="name" style="width: 20px;" readonly="readonly" value="元"/>
						</td>
						<th>人民币大写</th>
						<td colspan="3"><input  style="width: 400px;" type="text"  name="name"/></td>
						<th>款项期限</th>
						<td><input/></td>
					</tr>
					<tr>
						<th>备注</th>
						<td colspan="4"><input style="width: 400px;"/></td>
						<th colspan="2" style="text-align: center;"><input type="checkbox"/> 加入后不置空</th>
						<td>
							<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" plain="true">加入(A)</a>
							<a id="btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-remove'" plain="true">删除(D)</a>
						</td>
					</tr>
				</table>
				<div id="contract_sales_pay_grd">
					<%--销售合同支付方式 --%>
				</div>
	        </div>
	        <div title="合同备注">
	            <p>References Content.</p>
	        </div>
	        <div title="合同扫描件">
	            <p>Contact Content.</p>
	        </div>
	        <div title="报价记录">
	            <p>Contact Content.</p>
	        </div>
    	</div>
    </div>
</div>
</html>