<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <jsp:include flush="true" page="/common/includ.jsp"></jsp:include>
<title>客户管理</title>
<script type="text/javascript">
var business_customer_index_panel_tools =null;
$(document).ready(function(){
	   //工具栏列界面
		business_customer_index_panel_tools=$("#business_customer_index_panel_tools").panel({
			border:false,
			href:'${path}/jsp/business/customer/business_customer_toolbar.jsp'
		});
});
</script>
</head>
<body>
<div id="business_goods_index_layout" class="easyui-layout" style="width:100%;height:100%;" fit="true">
    <div data-options="region:'north',split:true,title:'  '" style="width:100%;height:180%;" border="false">
    	<div id="business_customer_index_panel_tools" style="margin-top:5px;"></div>
    	<div style="width:100%;height:100%;padding:15px;" fit="true" id="business_customer_index_panel" class="easyui-panel" border="false">
    		<jsp:include flush="true" page="business_customer_search.jsp"></jsp:include>
    	</div>
    </div>
    <div data-options="region:'center',split:true" fit="true" border="false">
    	<%-- 新建(编辑)商品对话框--%>
    	<jsp:include flush="true" page="business_customer_grd.jsp"></jsp:include>
    </div>
</div>
</body>
</html>