<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
<!--
 $(function(){
 	$('#contract_sales_contract_guarantee_pay_amount').on('change',function(){
 		//转换为大写
		toUpper($('#contract_sales_contract_guarantee_pay_amount'),$('#contract_sales_contract_guarantee_pay_upper_amount'));
 	});
 });
 
 function clearContractSalesContractGuarantee(){
	 setInputElementValue($('#contract_sales_contract_guarantee_pay_amount'),'0.00');
	 setInputElementValue($('#contract_sales_contract_guarantee_pay_upper_amount'),'');
 	$('#contract_sales_contract_guarantee_pay_time').val('');//签署日期
 	$('#contract_sales_contract_guarantee_receivables_time').val('');//签署日期
 }
//-->
</script>
<table class="table" align="center" style="width: 100%;">
	<tr>
		<th>保函金额*</th>
		<td>
			<input id="contract_sales_contract_guarantee_pay_amount" style="border:1px solid #95B8E7;"/>
			<input type="hidden" id="contract_sales_contract_guarantee_pay_upper_amount" style="border:1px solid #95B8E7;"/>
		</td>
		<th>付款日期*</th>
		<td><input id="contract_sales_contract_guarantee_pay_time" class="Wdate" onClick="WdatePicker()"/></td>
		<th>收款日期*</th>
		<td><input id="contract_sales_contract_guarantee_receivables_time" class="Wdate" onClick="WdatePicker()"/></td>
	</tr>
</table>