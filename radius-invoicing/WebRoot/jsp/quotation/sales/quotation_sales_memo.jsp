<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
function clearQuotationSalesMemoTab(){
	$('#quotation_sales_memo').val('');
}
/**
 * 设置采购合同描述
 *@params{} row_data
 **/
function setQuotationSalesMemo(row_data){
	$('#quotation_sales_memo').val(row_data.memo);
}
//-->
</script>
<table class="table" style="width: 99.5%;margin-top: 10px;">
   	<tr>
   		<th>报价单备注</th>
   		<td colspan="7">
   			<textarea rows="5" cols="170" id="quotation_sales_memo" style="border:1px solid #95B8E7"></textarea>
   		</td>
   	</tr>
</table>