<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table class="table" style="width: 100%;">
	<tr>
		<th>商品</th>
		<td colspan="3">
			<input class="easyui-validatebox" type="text" style="width: 300px;" name="name" data-options="required:true"/>
			<a id="btn" href="#" class="easyui-linkbutton" plain="true"><font style="font-size:3ex">...</font></a>
		</td>
		<th>规格</th>
		<td colspan="3">
			<input class="easyui-validatebox" type="text" style="width: 200px;" name="name" data-options="required:true"/>
		</td>
		<th>单价</th>
		<td>
			<input class="easyui-validatebox" type="text" name="name" data-options="required:true"/>
			<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-font'"  plain="true"></a>
		</td>
	</tr>
	<tr>
		<th>折合单价</th>
		<td>
			<input class="easyui-validatebox" type="text" name="name" data-options="required:true"/>
		</td>
		<th>数量</th>
		<td>
			<input style="width: 100px;" type="text"  name="name" data-options="required:true"/>
			<input type="text" name="name" style="width: 20px;" readonly="readonly" value="桶"/>
		</td>
		<th>折合数量</th>
		<td colspan="3">
			<input style="width: 100px;" type="text"  name="name" data-options="required:true"/>
			<input type="text" name="name" style="width: 20px;" readonly="readonly" value="吨"/>
		</td>
		<th>金额</th>
		<td>
			<input class="easyui-validatebox" type="text" name="name" data-options="required:true"/>
		</td>
	</tr>
	<tr>
		<th>备注</th>
		<td colspan="6">
			<input class="easyui-validatebox" style="width: 500px;" type="text" name="name" data-options="required:true"/>
		</td>
		<th colspan="2" style="text-align: center;"><input type="checkbox"/> 加入后不置空</th>
		<td>
			<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" plain="true">加入(A)</a>
			<a id="btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-remove'" plain="true">删除(D)</a>
		</td>
	</tr>
</table>