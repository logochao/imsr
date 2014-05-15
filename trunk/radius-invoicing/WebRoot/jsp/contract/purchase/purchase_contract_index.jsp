<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include flush="true" page="/common/includ.jsp"></jsp:include>
<title>采购合同管理</title>
<script type="text/javascript">
<!--
var purchase_contract_panel_tools = null; 
$(function(){
	purchase_contract_panel_tools=$('#purchase_contract_panel_tools').panel({
		border:false,
		href:'${path}/jsp/contract/purchase/purchase_contract_toolbar.jsp'
	});
	
	$('#purchase_contract_index_tabs').tabs({//页签
 	});
});
//-->
</script>
</head>
<body>
<div id="purchase_contract_layout" class="easyui-layout" style="width:100%;height:100%;" fit="true">
    <div data-options="region:'north',split:true,title:' '" style="width:100%;height:250%;" border="false">
    	<div id="purchase_contract_panel_tools" style="margin-top: 5px;"></div>
    	<div style="width:100%;height:100%;padding:15px;" fit="true" id="purchase_contract_index_panel" class="easyui-panel" border="false">
    		<jsp:include flush="true" page="purchase_contract_base.jsp"></jsp:include>
    	</div>
    </div>
    <div data-options="region:'center',split:true" fit="true" border="false">
    	<div id="purchase_contract_index_tabs"  data-options="split:true" fit="true" border="false">
    		<div title="合同商品明细" fit="true">
                <jsp:include flush="true" page="purchase_contract_goods_detail.jsp"></jsp:include>
	        </div>
    		<div title="订单条款" fit="true">
    			<jsp:include flush="true" page="purchase_contract_terms.jsp"></jsp:include>
	        </div>
    		<div title="订单备注" fit="true">
    			<jsp:include flush="true" page="purchase_contract_memo.jsp"></jsp:include>
	        </div>
            <div title="支付方式详情" fit="true">
                <jsp:include flush="true" page="purchase_contract_payment.jsp"></jsp:include>
            </div>
             <div title="合同扫描件" fit="true">
                <jsp:include flush="true" page="purchase_contract_scan.jsp"></jsp:include>
            </div>
    		<div title="询价记录" fit="true">
    			<jsp:include flush="true" page="purchase_contract_inquired.jsp"></jsp:include>
	        </div>
    	</div>
    </div>
</div>
<jsp:include flush="true" page="purchase_contract_open.jsp"></jsp:include>
</body>
</html>