<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	/**
	 *清空销售合同条款
	 **/
	function clearSalesOrderTermsTab(){
		$('#sales_order_terms_terms').val('');
	}
	
	function setSalesOrderTerms(row_data){
		setInputElementValue($('#sales_order_terms_terms'),row_data.terms);
	}
</script>
<table class="table" style="width: 99.5%;">
	<tr>
		<th>合同条款</th>
		<td>
		  <textarea rows="5" cols="170" id="sales_order_terms_terms" style="border:1px solid #95B8E7"></textarea>
		</td>
	</tr>
</table>
