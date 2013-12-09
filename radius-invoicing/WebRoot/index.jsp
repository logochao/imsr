<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <jsp:include flush="true" page="common/includ.jsp"></jsp:include>
  <%@ taglib uri="http://www.radius.com/functions" prefix="radius"%> 
    <title></title>
  </head>
<body class="easyui-layout">  
    <div data-options="region:'north',title:'North Title',split:true,href:'north.jsp'" style="height:150px;"></div>  
    <div data-options="region:'south',title:'落款',split:true" style="height:100px;"></div>  
    <div data-options="region:'west',title:'导航',split:true,href:'menu.jsp'" style="width:200px;"></div>  
    <div data-options="region:'center',title:'界面'" style="padding:5px;"></div>  
</body>  
</html>
