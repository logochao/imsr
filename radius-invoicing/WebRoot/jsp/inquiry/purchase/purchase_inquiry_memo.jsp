<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
function clearPurchaseInquiryMemoTab(){
	$('#purchase_inquiry_memo').val('');
}
/**
 * 设置采购合同描述
 *@params{} row_data
 **/
function setPurchaseInquiryMemo(row_data){
	$('#purchase_inquiry_memo').val(row_data.memo);
}
//-->
</script>
<table class="table" style="width: 99.5%;margin-top: 10px;">
   	<tr>
   		<th>询价单备注</th>
   		<td colspan="7">
   			<textarea rows="5" cols="170" id="purchase_inquiry_memo" style="border:1px solid #95B8E7"></textarea>
   		</td>
   	</tr>
</table>