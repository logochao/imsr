<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
<!--
 $(function(){
 	$('#contract_sales_contract_terms_sign_time').datebox({});
 	$('#contract_sales_contract_terms_effivit_time').datebox({});
 	$('#contract_sales_contract_terms_fail_time').datebox({});
 });
 
 /**
  * 设置销售合同条款页签
  *@params{} row_data
  **/
 function setContractSalesContractTermsTab(row_data){
	setInputElementValue($('#contract_sales_contract_terms_contract_file_id'),row_data.contractFile);//合同文件编号
 	setDateboxElement($('#contract_sales_contract_terms_sign_time'),'setValue',row_data.signTime);//签署日期
 	setDateboxElement($('#contract_sales_contract_terms_effivit_time'),'setValue',row_data.effectDate);//生效日期
 	setDateboxElement($('#contract_sales_contract_terms_fail_time'),'setValue',row_data.validityDate);//有效期至
	setInputElementValue($('#contract_sales_contract_terms_contract_terms'),row_data.contractTerms);//合同文件编号
 }
 
 /**
  * 清空合同条款
  **/
 function clearContractSalesContractTerms(){
	$('#contract_sales_contract_terms_contract_file_id').val('');
	$('#contract_sales_contract_terms_contract_terms').val('');
	$('#contract_sales_contract_terms_sign_time').datebox('setValue','');
	$('#contract_sales_contract_terms_effivit_time').datebox('setValue','');
	$('#contract_sales_contract_terms_fail_time').datebox('setValue','');
 }
//-->
</script>
<table class="table" style="width: 99.5%;">
   	<tr>
   		<th>合同文件编号</th>
   		<td><input id="contract_sales_contract_terms_contract_file_id" style="border:1px solid #95B8E7;"/> </td>
   		<th>签署日期</th>
   		<td><input id="contract_sales_contract_terms_sign_time"/></td>
   		<th>生效日期</th>
   		<td><input id="contract_sales_contract_terms_effivit_time"/></td>
   		<th>有效期到</th>
   		<td><input id="contract_sales_contract_terms_fail_time"/></td>
   	</tr>
   	<tr>
   		<th>合同条款</th>
   		<td colspan="7">
   			<textarea rows="4" cols="150" style="border:1px solid #95B8E7;" id="contract_sales_contract_terms_contract_terms"></textarea>
   		</td>
   	</tr>
   	<%--<tr>
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
--%></table>