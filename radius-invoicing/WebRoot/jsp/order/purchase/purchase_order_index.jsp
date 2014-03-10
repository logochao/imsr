<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <jsp:include flush="true" page="/common/includ.jsp"></jsp:include>
<title>采购订单管理</title>
<script type="text/javascript">
<!--
var sales_order_panel_tools = null; 
$(document).ready(function(){
	sales_order_panel_tools=$('#sales_order_panel_tools').panel({
		border:false,
		href:'${path}/jsp/order/purchase/purchase_order_toolbar.jsp'
	});
	
	$('#purchase_order_index_tabs').tabs({//页签
 	});
});
//-->
</script>
</head>
<body>
<div id="purchase_order_layout" class="easyui-layout" style="width:100%;height:100%;" fit="true">
    <div data-options="region:'north',split:true,title:' '" style="width:100%;height:250%;" border="false">
    	<div id="sales_order_panel_tools" style="margin-top: 5px;"></div>
    	<div style="width:100%;height:100%;padding:15px;" fit="true" id="purchase_order_index_panel" class="easyui-panel" border="false">
    		<jsp:include flush="true" page="purchase_order_base.jsp"></jsp:include>
    	</div>
    </div>
    <div data-options="region:'center',split:true" fit="true" border="false">
    	<div id="purchase_order_index_tabs"  data-options="split:true" fit="true" border="false">
    		<div title="订单明细" fit="true">
                <jsp:include flush="true" page="purchase_order_form.jsp"></jsp:include>
	        </div>
    		<div title="订单条款" fit="true">
    			<jsp:include flush="true" page="purchase_order_terms.jsp"></jsp:include>
	        </div>
    		<div title="订单备注" fit="true">
    			<jsp:include flush="true" page="purchase_order_memo.jsp"></jsp:include>
	        </div>
    		<div title="询价记录" fit="true">
    			<jsp:include flush="true" page="purchase_order_inquiry.jsp"></jsp:include>
	        </div>
    		<div title="合单明细" fit="true">
    			<jsp:include flush="true" page="purchase_order_merger_order_detail.jsp"></jsp:include>
	        </div>
    	</div>
    </div>
</div>
</body>
</html>