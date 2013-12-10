<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <jsp:include flush="true" page="common/includ.jsp"></jsp:include>
  <%@ taglib uri="http://www.radius.com/functions" prefix="radius"%> 
    <title></title>
    <script type="text/javascript">
    	var mainMenu;
		var mainTabs;
		$(function() {
			mainMenu = $('#mainMenu').tree({
			url : 'menu.json',
			parentField : 'pid',
			onClick : function(node) {
				if (node.attributes.url) {
					var tabs = $('#mainTabs');
					var src =  node.attributes.url;
					var opts = {
						title : node.text,
						closable : true,
						iconCls : node.iconCls,
						content :'',// sy.formatString('<iframe src="{0}" allowTransparency="true" style="border:0;width:100%;height:99%;" frameBorder="0"></iframe>', src),
						border : false,
						fit : true
					};
					if (tabs.tabs('exists', opts.title)) {
						tabs.tabs('select', opts.title);
					} else {
						tabs.tabs('add', opts);
					}
				}
			}
		});
		mainTabs = $('#mainTabs').tabs({
			fit : true,
			border : false,
			tools : [ {
				iconCls : 'ext-icon-arrow_up',
				handler : function() {
					mainTabs.tabs({
						tabPosition : 'top'
					});
				}
			}, {
				iconCls : 'ext-icon-arrow_left',
				handler : function() {
					mainTabs.tabs({
						tabPosition : 'left'
					});
				}
			}, {
				iconCls : 'ext-icon-arrow_down',
				handler : function() {
					mainTabs.tabs({
						tabPosition : 'bottom'
					});
				}
			}, {
				iconCls : 'ext-icon-arrow_right',
				handler : function() {
					mainTabs.tabs({
						tabPosition : 'right'
					});
				}
			}, {
				text : '刷新',
				iconCls : 'ext-icon-arrow_refresh',
				handler : function() {
					var panel = mainTabs.tabs('getSelected').panel('panel');
					var frame = panel.find('iframe');
					try {
						if (frame.length > 0) {
							for ( var i = 0; i < frame.length; i++) {
								frame[i].contentWindow.document.write('');
								frame[i].contentWindow.close();
								frame[i].src = frame[i].src;
							}
							if (navigator.userAgent.indexOf("MSIE") > 0) {// IE特有回收内存方法
								try {
									CollectGarbage();
								} catch (e) {
								}
							}
						}
					} catch (e) {
					}
				}
			}, {
				text : '关闭',
				iconCls : 'ext-icon-cross',
				handler : function() {
					var index = mainTabs.tabs('getTabIndex', mainTabs.tabs('getSelected'));
					var tab = mainTabs.tabs('getTab', index);
					if (tab.panel('options').closable) {
						mainTabs.tabs('close', index);
					} else {
						$.messager.alert('提示', '[' + tab.panel('options').title + ']不可以被关闭！', 'error');
					}
				}
			} ]
		});
	});
    </script>
  </head>
<body class="easyui-layout">  
    <div data-options="region:'north',title:'North Title',split:true,href:'north.jsp'" style="height:150px;"></div>  
    <div data-options="region:'south',title:'落款',split:true" style="height:100px;"></div>  
    <div data-options="region:'west',title:'导航',split:true" style="width:200px;">
    	<div class="easyui-accordion" data-options="border:false,isonCls:'icon-home',tools : [ {
				iconCls : 'database_refresh',
				handler : function() {
					$('#mainMenu').tree('reload');
				}
			}, {
				iconCls : 'resultset_next',
				handler : function() {
					var node = $('#mainMenu').tree('getSelected');
					if (node) {
						$('#mainMenu').tree('expandAll', node.target);
					} else {
						$('#mainMenu').tree('expandAll');
					}
				}
			}, {
				iconCls : 'resultset_previous',
				handler : function() {
					var node = $('#mainMenu').tree('getSelected');
					if (node) {
						$('#mainMenu').tree('collapseAll', node.target);
					} else {
						$('#mainMenu').tree('collapseAll');
					}
				}
			} ]">
    		<div title="系统菜单" style="padding: 5px;" >
    			<div class="well well-small">
    				<ul id="mainMenu"></ul>
    			</div>
    		</div>
	    	<div title="其他示例" data-options="border:false,iconCls:'anchor'">
				<ul>
					<li>菜单</li>
					<li>菜单</li>
					<li>菜单</li>
				</ul>
			</div>
		</div>
    </div>  
    <div data-options="region:'center'" style="overflow: hidden;">
    	<div id="mainTabs">
			<div title="关于SSHE" data-options="iconCls:'ext-icon-heart'">
				<iframe src="welcome.jsp" allowTransparency="true" style="border: 0; width: 100%; height: 99%;" frameBorder="0"></iframe>
			</div>
		</div>
    </div>  
</body>  
</html>
