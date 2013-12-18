<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<jsp:include page="/common/includ.jsp"></jsp:include>
<script type="text/javascript">
	var grid;
	var addFun = function() {
		var dialog = parent.sy.modalDialog({
			title : '添加资源信息',
			url : '/stock/resource/system/resouce_add.html',
			buttons : [ {
				text : '添加',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$, parent.mainMenu);
				}
			} ]
		});
	};
	var showFun = function(id) {
		var dialog = parent.sy.modalDialog({
			title : '查看资源信息',
			url :   '/securityJsp/base/SyresourceForm.jsp?id=' + id
		});
	};
	var editFun = function(id) {
		var dialog = parent.sy.modalDialog({
			title : '编辑资源信息',
			url : '/securityJsp/base/SyresourceForm.jsp?id=' + id,
			buttons : [ {
				text : '编辑',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$, parent.mainMenu);
				}
			} ]
		});
	};
	var removeFun = function(id) {
		parent.$.messager.confirm('询问', '您确定要删除此记录？', function(r) {
			if (r) {
				$.post( 'http://sshe.jeasyuicn.com/base/syresource!delete.sy', {
					id : id
				}, function() {
					grid.treegrid('reload');
					parent.mainMenu.tree('reload');
				}, 'json');
			}
		});
	};
	var redoFun = function() {
		var node = grid.treegrid('getSelected');
		if (node) {
			grid.treegrid('expandAll', node.id);
		} else {
			grid.treegrid('expandAll');
		}
	};
	var undoFun = function() {
		var node = grid.treegrid('getSelected');
		if (node) {
			grid.treegrid('collapseAll', node.id);
		} else {
			grid.treegrid('collapseAll');
		}
	};
	$(function() {
		grid = $('#grid').treegrid({
			title : '',
			url : '/stock/jsp/resource/resource.json',
			idField : 'id',
			treeField : 'name',
			parentField : 'pid',
			rownumbers : true,
			pagination : false,
			sortName : 'seq',
			sortOrder : 'asc',
			frozenColumns : [ [ {
				width : '200',
				title : '资源名称',
				field : 'name'
			} ] ],
			columns : [ [ {
				width : '200',
				title : '图标名称',
				field : 'iconCls'
			}, {
				width : '200',
				title : '资源路径',
				field : 'url',
				formatter : function(value, row) {
					if(value){
						return sy.formatString('<span title="{0}">{1}</span>', value, value);
					}
				}
			}, {
				width : '60',
				title : '资源类型',
				field : 'syresourcetype',
				formatter : function(value, row) {
					return value.name;
				}
			}, {
				width : '150',
				title : '创建时间',
				field : 'createdatetime',
				hidden : true
			}, {
				width : '150',
				title : '修改时间',
				field : 'updatedatetime',
				hidden : true
			}, {
				width : '200',
				title : '资源描述',
				field : 'description',
				formatter : function(value, row) {
					if(value){
						return sy.formatString('<span title="{0}">{1}</span>', value, value);
					}
				}
			}, {
				width : '80',
				title : '排序',
				field : 'seq',
				hidden : true
			}, {
				width : '80',
				title : '目标',
				field : 'target'
			}, {
				title : '操作',
				field : 'action',
				width : '60',
				formatter : function(value, row) {
					return  "<a onclick=\"undoFun();\" href=\"javascript:void(0);\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:'accordion-expand'\">折叠</a>";
				}
			} ] ],
			toolbar : '#toolbar',
			onBeforeLoad : function(row, param) {
				parent.$.messager.progress({
					text : '数据加载中....'
				});
			},
			onLoadSuccess : function(row, data) {
				$('.iconImg').attr('src', sy.pixel_0);
				parent.$.messager.progress('close');
			}
		});
	});
</script>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
	<div id="toolbar" style="display: none;">
		<table>
			<tr>
				<%if (true) {%>
				<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="addFun();">添加</a></td>
				<%}%>
				<td><div class="datagrid-btn-separator"></div></td>
				<td><a onclick="redoFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'accordion-collapse'">展开</a>
				<a onclick="undoFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'accordion-expand'">折叠</a></td>
				<td><div class="datagrid-btn-separator"></div></td>
				<td><a onclick="grid.treegrid('reload');" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-arrow_refresh'">刷新</a></td>
			</tr>
		</table>
	</div>
	<div data-options="region:'center',fit:true,border:false">
		<table id="grid" data-options="fit:true,border:false"></table>
	</div>
</body>
</html>