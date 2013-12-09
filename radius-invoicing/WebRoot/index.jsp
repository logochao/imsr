<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'index.jsp' starting page</title>
	<jsp:include flush="true" page="common/includ.jsp"></jsp:include>
  	<script type="text/javascript">
	  	$('#aa').accordion({   
		    animate:false
		}); 
  	</script>
  </head>
<body class="easyui-layout">  
    <div data-options="region:'north',title:'North Title',split:true" style="height:150px;"></div>  
    <div data-options="region:'south',title:'落款',split:true" style="height:100px;"></div>  
    <%--
    <div data-options="region:'east',iconCls:'icon-reload',title:'East',split:true" style="width:100px;"></div>  
    --%>
    <div data-options="region:'west',title:'导航',split:true" style="width:200px;">
    	<div id="aa" class="easyui-accordion" data-options="fit:true">  
		    <div title="Title1" data-options="iconCls:'icon-save'" style="overflow:auto;padding:10px;">  
		        <h3 style="color:#0099FF;">Accordion for jQuery</h3>  
		        <p>Accordion is a part of easyui framework for jQuery.    
		        It lets you define your accordion component on web page more easily.</p>  
		    </div>  
		    <div title="Title2" data-options="iconCls:'icon-reload',selected:true" style="padding:10px;">  
		        content2   
		    </div>  
		    <div title="Title3" style="height:100%">  
		        content3   
		    </div>  
		</div>
    </div>  
    <div data-options="region:'center',title:'界面'" style="padding:5px;"></div>  
</body>  
</html>
