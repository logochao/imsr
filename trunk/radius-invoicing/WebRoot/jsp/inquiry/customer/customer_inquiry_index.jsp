<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <jsp:include flush="true" page="/common/includ.jsp"></jsp:include>
  <title>客户询价</title>
  <script type="text/javascript">
  	var client_inquiry_index_panel_tools=null; //工具栏列界面
  	$(document).ready(function(){
  		client_inquiry_index_panel_tools=$('#customer_inquiry_index_panel_tools').panel({
			border:false,
			href:'${path}/jsp/inquiry/customer/customer_inquiry_toolbar.jsp'
		});
  	});
  </script>
</head>
<body>
<div id="customer_inquiry_layout" class="easyui-layout" style="width:100%;height:100%;" fit="true">
    <div data-options="region:'north',split:true,title:'  '" style="width:100%;height:230%;" border="false">
    	<div id="customer_inquiry_index_panel_tools" style="margin-top:5px;"></div>
    	<div style="width:100%;height:100%;padding:15px;" fit="true" id="customer_inquiry_index_panel" class="easyui-panel" border="false">
    		<jsp:include flush="true" page="customer_inquiry_base.jsp"></jsp:include>
    	</div>
    </div>
    <div data-options="region:'center',split:true" fit="true" border="false">
    	<div id="purchase_contract_index_tabs" class="easyui-tabs" data-options="split:true" fit="true" border="false">
    		<div title="询价商品明细" fit="true" style="padding:5px 15px 0px 15px;">
		    	<jsp:include flush="true" page="customer_inquiry_goods_detail.jsp"></jsp:include>
		    	<jsp:include flush="true" page="customer_inquiry_goods_detail_grd.jsp"></jsp:include>
	    	</div>
    		<div title="询价单描述" fit="true" style="padding:5px 15px 0px 15px;">
		    	<jsp:include flush="true" page="customer_inquiry_memo.jsp"></jsp:include>
	    	</div>
	    </div>
    </div>
</div>
<jsp:include flush="true" page="customer_inquiry_open.jsp"></jsp:include>
</body>
</html>