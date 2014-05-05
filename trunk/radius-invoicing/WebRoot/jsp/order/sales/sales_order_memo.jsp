<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<script type="text/javascript">
/**
 * 清空销售订单描述
 **/
function clearSalesOrdermemoTab(){
 $('#sales_order_memo_memo').val('');
}
function setSalesOrdermemo(row_data){
	setInputElementValue($('#sales_order_memo_memo'),row_data.memo);
}
</script>
<table class="table" style="width: 99.5%;">
   	<tr>
   		<th>合同备注</th>
   		<td colspan="7">
   			<textarea rows="4" cols="140" id="sales_order_memo_memo" style="border:1px solid #95B8E7"></textarea>
   		</td>
   	</tr>
</table>