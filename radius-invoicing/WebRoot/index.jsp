<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'index.jsp' starting page</title>
	<jsp:include flush="true" page="common/includ.jsp"></jsp:include>
  	<script type="text/javascript">
  	
  	</script>
  </head>
<body class="easyui-layout">  
    <div data-options="region:'north',title:'North Title',split:true" style="height:150px;"></div>  
    <div data-options="region:'south',title:'落款',split:true" style="height:100px;"></div>  
    <%--
    <div data-options="region:'east',iconCls:'icon-reload',title:'East',split:true" style="width:100px;"></div>  
    --%>
    <div data-options="region:'west',title:'导航',split:true" style="width:200px;"></div>  
    <div data-options="region:'center',title:'界面'" style="padding:5px;"></div>  
</body>  
</html>
