<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<!-- 引入jQuery -->
<script src="<%=path%>/easyui/jquery-1.8.0.min.js" type="text/javascript" charset="utf-8"></script>


<!-- 引入bootstrap样式 -->
<link href="<%=path%>/easyui/demo/demo.css" rel="stylesheet" media="screen">

<!-- 引入EasyUI -->
<link id="easyuiTheme" rel="stylesheet" href="<%=path%>/easyui/themes/default/easyui.css" type="text/css">
<link rel="stylesheet" href="<%=path%>/easyui/themes/icon.css" type="text/css">
<script type="text/javascript" src="<%=path%>/easyui/jquery.easyui.min.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=path%>/easyui/locale/easyui-lang-zh_CN.js" charset="utf-8"></script>
<%--<!-- 修复EasyUI1.3.3中layout组件的BUG -->
<script type="text/javascript" src="<%=path%>/easyuiplugins/jquery.layout.js" charset="utf-8"></script>

--%>


<%--<!-- 引入EasyUI Portal插件 -->
<link rel="stylesheet" href="<%=path%>/easyui/jquery-easyui-portal/portal.css" type="text/css">
<script type="text/javascript" src="<%=path%>/easyui/jquery-easyui-portal/jquery.portal.js" charset="utf-8"></script>

	
-%>
<%--自定义js--%>
<script type="text/javascript" src="<%=path%>/jslib/syExtJquery.js" charset="utf-8"></script>

<link rel="stylesheet" href="<%=path%>/common/stock.css" type="text/css">