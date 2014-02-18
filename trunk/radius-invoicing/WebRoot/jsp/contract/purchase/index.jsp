<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <jsp:include flush="true" page="/common/includ.jsp"></jsp:include>
<title>采购合同管理</title>
<style >
#imgPreviewWithStyles {
    background: #222;
    -moz-border-radius: 10px;
    -webkit-border-radius: 10px;
    padding: 15px;
    z-index: 999;
    border: none;
}

/* Text below image */
#imgPreviewWithStyles span {
    color: white;
    text-align: center;
    display: block;
    padding: 10px 0 3px 0;
}
</style>
<script type="text/javascript">
	var contract_purchase_panel=null; 
	var contract_purchase_panel_tools=null; 
	var contract_purchase_goods_grd=null;
	var contract_purchase_pay_grd=null;
	var contract_purchase_scan_grd=null;
	var contract_purchase_quoted_price_grd=null;
	var contract_purchase_total_amount=null;
	var contract_purchase_index_pay_amount=null;//保函条款
	var contract_purchase_base_contract_type=null;//合同类型
	$(document).ready(function(){
		//工具栏列界面
		contract_purchase_panel_tools=$("#contract_purchase_panel_tools").panel({
			border:false,
			href:'/stock/jsp/contract/purchase/contract_purchase_toolbar.jsp'
		});
		//销售合同商品列表
		contract_purchase_goods_grd=$('#contract_purchase_goods_grd').datagrid({
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
				]],
			onAfterEdit:function(rowIndex, rowData, changes){
				console.info(rowIndex);
			}
		});
		
		//支付金额
		contract_purchase_index_pay_amount=$('#contract_purchase_index_pay_amount').validatebox({
			validType:'numberic',
			missingMessage:'请输入金额',
			invalidMessage:'请输入正确的格式'
		});
		
		contract_purchase_index_pay_amount.on('focusout',function(){//保函金额失去焦点事件
			if($(this).val()*100>contract_purchase_total_amount){//总金额
				$.messager.alert('提示','保函金额不能大于当前总金额','error');
				$(this).val('0.00');
			}
		});
		//销售合同支付详情列表
		contract_purchase_pay_grd=$('#contract_purchase_pay_grd').datagrid({
				fitColumns:true,
        		autoRowHeight:false,
        		border:false,
        		striped:true,
        		rownumbers:true,
        		collapsible:true,
        		columns:[[
        			{field:'batch',title:'款项批次',width:100,align:'center'},
        			{field:'cashType',title:'币种',width:60,align:'center'},
					{field:'amount',title:'金额',width:120,align:'center'},
					{field:'validityDate',title:'款项期限',width:80,align:'center'},
					{field:'receiveType',title:'支付方式',width:120,align:'center'},
					{field:'upperAmount',title:'人民币大写',width:220,align:'center'},
					{field:'mome',title:'备注',width:250,align:'center'}
				]]
		});
		//合同扫描件列表
		contract_purchase_scan_grd=$('#contract_purchase_scan_grd').datagrid({
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
					{field:'open',title:'操作',width:250,align:'center',formatter:contractSalesScanGrdOpenFormatter}
				]]
		});	
		//销售合同报价列表
		contract_purchase_quoted_price_grd=$('#contract_purchase_quoted_price_grd').datagrid({
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
		
		$('#contract_purchase_index_pay_time').datebox({
	 		//required:true
	 	});
		$('#contract_purchase_index_receivables_time').datebox({
	 		//required:true
	 	});
	 	$('#contract_purchase_index_tabs').tabs({//页签
	 		onSelect:function(title,index){
	 			if('合同条款'==title){
	 				//$('#contract_purchase_clause_contract_id').attr('value','H_X2014012401');//将合同编号copy的合同条件tabs
	 			}else if('支付方式详情'==title){
	 				//显示合同总金额
	 				$('#contract_purchase_pay_detail_total_amount').attr('value',parseFloat(contract_purchase_total_amount/100));
	 				//生成批次之后剩余的金额数
	 				$('#contract_purchase_pay_detail_surplus_amount').attr('value',parseFloat(contract_purchase_total_amount/100));
	 			}else if('销售保函'==title){
	 			}
	 		}
	 	});
	 	//默认将保函页签禁用
	 	$('#contract_purchase_index_tabs').tabs('disableTab',2);//将其禁用第三个tabs
	});
	
/**
 * 合同扫描件列表格式化
 **/	
function contractSalesScanGrdOpenFormatter(value,row,index){
	var fileName=row.scanFileName;
	var stop=fileName.indexOf('.');
	return '<a id="'+fileName.substring(0,stop)+'" herf="" rel="'+value+'" plain="true" class="easyui-linkbutton">预览</a>';
}
</script>
</head>
<div id="contract_purchase_layout" class="easyui-layout" style="width:100%;height:100%;" fit="true">
    <div data-options="region:'north',split:true,title:' '" style="width:100%;height:250%;" border="false">
    	<div id="contract_purchase_panel_tools" style="margin-top: 5px;"></div>
    	<div style="width:100%;height:100%;padding:15px;" fit="true" id="contract_purchase_panel" class="easyui-panel" border="false">
    		<jsp:include flush="true" page="contract_purchase_base.jsp"></jsp:include>
    	</div>
    </div>
    <div data-options="region:'center',split:true" fit="true" border="false">
    	<div id="contract_purchase_index_tabs" class="easyui-tabs" data-options="split:true" fit="true" border="false">
    		<div title="合同商品明细" fit="true">
    			<div id="contract_purchase_goods_grd_form">
    				<jsp:include flush="true" page="contract_purchase_goods_grd_form.jsp"></jsp:include>
    			</div>
    			<div id="contract_purchase_goods_grd">
    			</div>
	        </div>
	        <div title="合同条款">
	        <%--合同条款对应界面 --%>
	        	<jsp:include flush="true" page="contract_purchase_clause.jsp"></jsp:include>
	        </div>
	        <div title="销售保函" style="text-align: center">
	        	<table class="table" align="center" style="width: 100%;">
	        		<tr>
	        			<th>保函金额*</th>
	        			<td><input id="contract_purchase_index_pay_amount"/></td>
	        			<th>付款日期*</th>
	        			<td><input id="contract_purchase_index_pay_time"/></td>
	        			<th>收款日期*</th>
	        			<td><input id="contract_purchase_index_receivables_time"/></td>
	        		</tr>
	        	</table>
	        </div>
	        <div title="支付方式详情">
	        	<jsp:include flush="true" page="contract_purchase_pay_detail.jsp"></jsp:include>
	        </div>
	        <div title="合同备注">
	            <table class="table" style="width: 100%;">
	            	<tr>
	            		<th>合同备注</th>
	            		<td>
	            		 <textarea rows="5" cols="170" id="contract_purchase_index_mome"></textarea>
	            		</td>
	            	</tr>
	            </table>
	        </div>
	        <div title="合同扫描件">
	        	<jsp:include flush="true" page="contract_purchase_scan.jsp"></jsp:include>
	        </div>
	        <div title="报价记录">
	        	<div id="contract_purchase_quoted_price_grd">
	        	</div>
	        </div>
    	</div>
    </div>
</div>
</html>