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
  		client_inquiry_index_panel_tools=$('#client_inquiry_index_panel_tools').panel({
			border:false,
			href:'${path}/jsp/inquiry/client/client_inquiry_toolbar.jsp'
		});
  	});
  </script>
</head>
<body>
<div id="client_inquiry_layout" class="easyui-layout" style="width:100%;height:100%;" fit="true">
    <div data-options="region:'north',split:true,title:'  '" style="width:100%;height:250%;" border="false">
    	<div id="client_inquiry_index_panel_tools" style="margin-top:5px;"></div>
    	<div style="width:100%;height:100%;padding:15px;" fit="true" id="client_inquiry_index_panel" class="easyui-panel" border="false">
    		<jsp:include flush="true" page="client_inquiry_base.jsp"></jsp:include>
    	</div>
    </div>
    <div data-options="region:'center',split:true" fit="true" border="false" style="padding:0px 15px 0px 15px;">
    	<jsp:include flush="true" page="client_inquiry_goods_grd_form.jsp"></jsp:include>
    </div>
</div>
</body>
</html>