<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <jsp:include flush="true" page="/common/includ.jsp"></jsp:include>
<title>规格管理</title>
<script type="text/javascript">
$(document).ready(function(){
	   //工具栏列界面
		spec_type_index_panel_tools=$("#spec_type_index_panel_tools").panel({
			border:false,
			href:'${path}/jsp/business/spectype/spec_type_toolbar.jsp'
		});
});
</script>
</head>
<body>
<div id="spec_type_index_layout" class="easyui-layout" style="width:100%;height:100%;" fit="true">
    <div data-options="region:'north',split:true,title:'  '" style="width:100%;height:140%;" border="false">
    	<div id="spec_type_index_panel_tools" style="margin-top:5px;"></div>
    	<div style="width:100%;height:100%;padding:15px;" fit="true" id="spec_type_index_panel" class="easyui-panel" border="false">
    		<jsp:include flush="true" page="spec_type_search.jsp"></jsp:include>
    	</div>
    </div>
    <div data-options="region:'center',split:true,title:'规格信息列表'" fit="true" border="false">
    	<%-- 新建(编辑)对话框--%>
    	<jsp:include flush="true" page="spec_type_grd.jsp"></jsp:include>
    	<jsp:include flush="true" page="spec_type_form.jsp"></jsp:include>
    </div>
</div>
</body>
</html>