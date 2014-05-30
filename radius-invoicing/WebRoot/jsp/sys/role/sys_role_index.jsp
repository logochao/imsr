<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <jsp:include flush="true" page="/common/includ.jsp"></jsp:include>
<title>角色管理</title>
<script type="text/javascript">
var sys_role_index_panel_tools =null;
$(document).ready(function(){
});
</script>
</head>
<body>
<div id="business_goods_index_layout" class="easyui-layout" style="width:100%;height:100%;" fit="true">
    <div data-options="region:'north',split:true,title:'  '" style="width:100%;height:100%;" border="false">
    	<div id="sys_role_index_panel_tools" style="margin-top:5px;"></div>
    	<div style="width:100%;height:100%;padding:15px;" fit="true" id="sys_role_index_panel" class="easyui-panel" border="false">
    		<jsp:include flush="true" page="sys_role_search.jsp"></jsp:include>
    	</div>
    </div>
    <div data-options="region:'center',split:true,title:'角色信息列表'" fit="true" border="false">
    	<jsp:include flush="true" page="sys_role_grd.jsp"></jsp:include>
    </div>
</div>
</body>
</html>