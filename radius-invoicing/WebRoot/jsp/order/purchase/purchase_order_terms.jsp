<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
function clearPurchaseOrderTermsTab(){
	$('#purchase_order_terms').val('');
}
function setPurchaseOrderTerms(row_data){
	$('#purchase_order_terms').val(row_data.terms);
}
//-->
</script>
<table class="table" style="width: 99.5%;margin-top: 10px;">
	<tr>
		<th>合同条款</th>
		<td colspan="7">
		   <textarea rows="4" cols="140" id="purchase_order_terms" style="border:1px solid #95B8E7"></textarea>
		</td>
	</tr>
</table>