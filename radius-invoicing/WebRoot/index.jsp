<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<title>进销存系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <jsp:include flush="true" page="/common/includ.jsp"></jsp:include>
<style type="text/css">
<!--
body{margin:0;padding:0;font-size:12px;background:#fff;}
.m{margin:100px auto 0;width:582px;height:329px;background:url(indexbg.jpg) no-repeat;position:relative;}
.put{height:24px;line-height:24px;width:140px;background:#fff;border:1px solid #95B8E7;}
.p6{width:60px;}
.fm{padding:110px 0 0 180px;}
.btn{position:absolute;bottom:25px;left:230px;}
.but{height:24px;line-height:24px;background:#fff;border:1px solid #95b8e7;padding:0 20px;display:inline-block;cursor:pointer;margin:0 4px;}
table{border-collapse:collapse;border-spacing:0;}
th,td{padding:6px 0;margin:0;border:none;}
-->
</style>
<script type="text/javascript">
	var index_login_form = null;
	$(document).ready(function(){
		/*
		index_login_form = $('#index_login_form').form({
			url:'${path}/system/manage/sys/login_sys.html',
			onSubmit:function(){
			},
			success:function(r){
				if(r){
					alert(r);
					console.info(r);
				}
			}
		});
		
		index_login_form.submit();
		**/
	});
</script>
</head>
<body>
<div class="m">
	<div class="fm">
	<form id="index_login_form" action="${path}/system/manage/sys/login_sys.html" method="POST">
		<table>
			<tr>
				<th>用户名：</th>
				<td><input type="text" class="put"></td>
			</tr>
			<tr>
				<th>密&nbsp;&nbsp;码：</th>
				<td><input type="password" class="put"></td>
			</tr>
			<tr>
				<th>验证码：</th>
				<td><input type="text" class="put p6"></td>
			</tr>
		</table>
		<div class="btn">
			<input type="submit" class="but" value="登录">
			<input type="reset" class="but" value="重置">
		</div>
	</form>
	</div>
</div>
</body>
</html>
