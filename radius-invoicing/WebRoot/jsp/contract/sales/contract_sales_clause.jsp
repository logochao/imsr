<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
 $(function(){
 	$('#contract_sales_clause_sign_time').datebox({
 		//required:true
 	});
 	$('#contract_sales_clause_effivit_time').datebox({
 		//required:true
 	});
 	$('#contract_sales_clause_fail_time').datebox({
 		//required:true
 	});
 });
//-->
</script>
<table class="table" style="width: 99.5%;">
   	<tr>
   		<th>合同编号</th>
   		<td><input id="contract_sales_clause_contract_id" style="background:#eee;" readonly="readonly" value="${salesContract.id }"/> </td>
   		<th>签署日期</th>
   		<td><input id="contract_sales_clause_sign_time"/></td>
   		<th>生效日期</th>
   		<td><input id="contract_sales_clause_effivit_time"/></td>
   		<th>有效期到</th>
   		<td><input id="contract_sales_clause_fail_time"/></td>
   	</tr>
   	<tr>
   		<th>合同条款</th>
   		<td colspan="7">
   			<textarea rows="4" cols="150" style="border:1px solid #95B8E7;" id="contract_sales_clause_contract_terms"></textarea>
   		</td>
   	</tr>
   	<tr>
   		<th>责任与权利</th>
   		<td colspan="7">
   			<textarea rows="4" cols="150" style="border:1px solid #95B8E7;"></textarea>
   		</td>
   	</tr>
   	<tr>
   		<th>违约条款</th>
   		<td colspan="7">
   			<textarea rows="4" cols="150" style="border:1px solid #95B8E7;"></textarea>
   		</td>
   	</tr>
   	<tr>
   		<th>争议处理</th>
   		<td colspan="7">
   			<textarea rows="4" cols="150" style="border:1px solid #95B8E7;"></textarea>
   		</td>
   	</tr>
   </table>