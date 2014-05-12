<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
function clearPurchaseOrderMemoTab(){
	$('#purchase_order_memo').val('');
}
function setPurchaseOrderMemo(row_data){
	$('#purchase_order_memo').val(row_data.memo);
}
//-->
</script>
<table class="table" style="width: 99.5%;margin-top: 10px;">
   	<tr>
   		<th>合同备注</th>
   		<td colspan="7">
   			<textarea rows="4" cols="140" id="purchase_order_memo" style="border:1px solid #95B8E7"></textarea>
   		</td>
   	</tr>
</table>