<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
<!--
 $(function(){
 	$('#purchase_contract_terms_sign_time').datebox({
 	});
 	$('#purchase_contract_terms_effivit_time').datebox({
 	});
 	$('#purchase_contract_terms_validity_time').datebox({
 	});
 }); 
//-->
</script>
<table class="table" style="width: 99.5%;margin-top: 10px;">
	<tr>
		<th>签署日期</th>
   		<td><input id="purchase_contract_terms_sign_time"/></td>
   		<th>生效日期</th>
   		<td><input id="purchase_contract_terms_effivit_time"/></td>
   		<th>有效期到</th>
   		<td><input id="purchase_contract_terms_validity_time"/></td>
	</tr>
	<tr>
		<th>合同条款</th>
		<td colspan="5">
		  <textarea rows="5" cols="170" id="purchase_contract_terms" style="border:1px solid #95B8E7"></textarea>
		</td>
	</tr>
</table>