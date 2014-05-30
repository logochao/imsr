<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
var sys_role_grd_role_grd=null;
var editRow =null;
$(function(){
	sys_role_grd_role_grd=$('#sys_role_grd_role_grd').datagrid({
		fitColumns:false,
   		autoRowHeight:false,
   		border:false,
   		striped:true,
   		rownumbers:true,
   		collapsible:true,
   		columns:[[
   			 {field:'roleId',title:'角色编号',width:100},
   			 {field:'roleName',title:'角色名称',width:150},
			 {field:'memo',title:'备注',width:250,align:'center'}
		]],
		toolbar:[
		{text: '新建', iconCls: 'icon-add',id:'sys_role_grd_add_btn',hanlder:addRoleInfo},'-',
		{text: '保存', iconCls: 'icon-save'},'-',
		{text: '撤销', iconCls: 'icon-redo'},'-',
		{text: '删除', iconCls: 'icon-remove'},'-',
		{text: '修改', iconCls: 'icon-edit'}
		]
	});
});

function addRoleInfo(){
	if (editRow != undefined) {
         sys_role_grd_role_grd.datagrid('endEdit', editRow);
     }
    if (editRow == undefined) {
        sys_role_grd_role_grd.datagrid('insertRow', {
            index: 0,
            row: {}
        });
       sys_role_grd_role_grd.datagrid('beginEdit', 0);
        editRow = 0;
    }
}
</script>
<div id="sys_role_grd_role_grd">
	<%--角色信息列表--%>
</div>
