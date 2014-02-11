<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>文件上传</title>
    <link rel="stylesheet" href="jslib/plupload/queue/css/jquery.plupload.queue.css" type="text/css"></link>
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="jslib/plupload/plupload.js"></script>
	<script type="text/javascript" src="jslib/plupload/plupload.html4.js"></script>
	<script type="text/javascript" src="jslib/plupload/plupload.html5.js"></script>
	<script type="text/javascript" src="jslib/plupload/plupload.flash.js"></script>
	<script type="text/javascript" src="jslib/plupload/zh_CN.js"></script>
    <script type="text/javascript" src="jslib/plupload/queue/jquery.plupload.queue.js"></script>
  <body style="padding: 0;margin: 0;">
    <div id="uploader">&nbsp;</div>
	<script type="text/javascript">
		var files = [];
		var errors = [];
		var type = 'file';
		var chunk = eval('${param.chunk}');
		var max_file_size = '5mb';
		var filters = {title : "文档", extensions : "png,gif"};
		$("#uploader").pluploadQueue($.extend({
			runtimes : 'flash,html4,html5',
			url : '<%=path%>/common/system/file_upload_list.html',
			max_file_size : max_file_size,
			file_data_name:'file',
			unique_names:true,
			filters : [filters],
			flash_swf_url : '<%=path%>/jslib/plupload/plupload.flash.swf',
			init:{
				FileUploaded:function(uploader,file,response){
					if(response.response){
						var rs = $.parseJSON(response.response);
						if(rs.status){
							files.push(rs.newName);
						}else{
							errors.push(file.name);
						}
					}
				},
				UploadComplete:function(uploader,fs){
					var e= errors.length ? ",失败"+errors.length+"个("+errors.join("、")+")。" : "。";
					alert("上传完成!共"+fs.length+"个,成功"+files.length+e);
					target.window("close");
					
				}
			}
		},(chunk ? {chunk_size:'1mb'} : {})));
</script>
  </body>
</html>
