<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String contextPath = request.getContextPath();
%>
<%
	String id = request.getParameter("id");
	if (id == null) {
		id = "";
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<title></title>
		<jsp:include page="/common/includ.jsp"></jsp:include>
<script type="text/javascript">
	var submitForm = function($dialog, $grid, $pjq, $mainMenu) {
		if ($('form').form('validate')) {
			var url;
			if ($(':input[name="id"]').val().length > 0) {
				url = sy.contextPath + '/base/syresource!update.sy';
			} else {
				url = '/stock/resource/system/resouce_save.html';
			}
			$.post(url, sy.serializeObject($('form')), function(result) {
				if (result.success) {
					$pjq.messager.show({
							title:'提示',
							msg:result.message,
							timeout:5000,
							showType:'slide'
						});
					$grid.treegrid('reload');
					$dialog.dialog('destroy');
					$mainMenu.tree('reload');
				} else {
					$pjq.messager.alert('提示', result.message, 'error');
				}
			}, 'json');
		}
	}; 
</script>
	</head>
	<body>
		<form method="post" class="form"  action="/resource/system/resouce_save.html">
			<fieldset>
				<legend>
					资源基本信息
				</legend>
				<table class="table" style="width: 100%;">
					<tr>
						<%--
						<th>
							编号
						</th>
						<td>
							<input name="id" value="${resource.id}" readonly="readonly" />
						</td>
						--%>
						<th>
							资源中文名
						</th>
						<td>
							<input type="hidden" name="id" value="${resource.id}" readonly="readonly" />
							<input id="labelName" name="labelName" value="${resource.labelName}" class="easyui-validatebox" data-options="required:true" />
						</td>
						<th>
							资源英文名
						</th>
						<td>
							<input name="name" id="name" class="easyui-validatebox" data-options="required:true" />
						</td>
					</tr>
					<tr>
						<th>
							资源路径
						</th>
						<td>
							<input name="url"  id="url" />
						</td>
						<th>
							资源类型
						</th>
						<td>
							<select name="typeId" class="easyui-combobox"
								data-options="required:true,editable:false,valueField:'id',textField:'name',url:'/stock/resource/system/resouce_type_json.html',panelHeight:'auto'"
								style="width: 155px;"></select>
						</td>
					</tr>
					<tr>
						<th>
							父资源
						</th>
						<td>
							<select id="pId" name="pId"
								class="easyui-combotree"
								data-options="editable:false,idField:'id',textField:'text',parentField:'pid',url:'/stock/resource/system/resouce_menu.html'"
								style="width: 155px;"></select>
							<img class="iconImg ext-icon-cross" onclick="$('#pId').combotree('clear');" title="清空" />
						</td>
						<th>
							资源图标
						</th>
						<td>
							<input id="iconCls" name="icon" readonly="readonly"
								style="padding-left: 18px; width: 134px;" />
							<img class="iconImg ext-icon-zoom" onclick="showIcons();"
								title="浏览图标" />
							&nbsp;
							<img class="iconImg ext-icon-cross"
								onclick="$('#iconCls').val('');$('#iconCls').attr('class','');"
								title="清空" />
						</td>
					</tr>
					<tr>
						<th>
							目标
						</th>
						<td>
							<input name="target" />
						</td>
						<th>
							资源描述
						</th>
						<td>
							<textarea name="remark"></textarea>
						</td>
					</tr>
				</table>
			</fieldset>
		</form>
	</body>
</html>
