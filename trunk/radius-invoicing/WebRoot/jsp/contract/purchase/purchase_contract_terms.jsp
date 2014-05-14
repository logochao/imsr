<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
 function clearPurchaseContractTermsTab(){
 	$('#purchase_contract_terms_contract_file').val('');
 	$('#purchase_contract_terms_sign_time').val('');
 	$('#purchase_contract_terms_effivit_time').val('');
 	$('#purchase_contract_terms_validity_time').val('');
 	$('#purchase_contract_terms').val('');
 }
 
 /**
  * 设置采购合同条款
  *@params{} row_data
  **/
 function setPurchaseContractTerms(row_data){
 	$('#purchase_contract_terms_contract_file').val(row_data.contractFile);
 	$('#purchase_contract_terms_sign_time').val(row_data.signTime);
 	$('#purchase_contract_terms_effivit_time').val(row_data.effectDate);
 	$('#purchase_contract_terms_validity_time').val(row_data.validityDate);
 	$('#purchase_contract_terms').val(row_data.contractTerms);
 }
//-->
</script>
<table class="table" style="width: 99.5%;margin-top: 10px;">
	<tr>
		<th>合同文件编号</th>
   		<td><input id="purchase_contract_terms_contract_file" style="border:1px solid #95B8E7;"/></td>
		<th>签署日期</th>
   		<td><input id="purchase_contract_terms_sign_time"/></td>
   		<th>生效日期</th>
   		<td><input id="purchase_contract_terms_effivit_time"/></td>
   		<th>有效期到</th>
   		<td><input id="purchase_contract_terms_validity_time"/></td>
	</tr>
	<tr>
		<th>合同条款</th>
		<td colspan="7">
		  <textarea rows="7" cols="170" id="purchase_contract_terms" style="border:1px solid #95B8E7"></textarea>
		</td>
	</tr>
</table>