<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
/**
 *初始化客户销售报价界面
 **/
function salesQuotationInit(){
	$("#quotation_sales_toolbar_ok_btn").attr("disabled",false);
	$('#quotation_sales_toolbar_ok_btn').linkbutton('enable');
	$("#quotation_sales_toolbar_pend_btn").attr("disabled",false);
	$('#quotation_sales_toolbar_pend_btn').linkbutton('enable');
	$('#quotation_sales_goods_grd_add_btn').linkbutton('enable');
	$('#quotation_sales_goods_grd_delete_btn').linkbutton('enable');
	//1.清空客户询价基本信息
	//clearSalesQuotationBaseInfo();
	//2.清空客户询价商品信息
	//clearSalesQuotationGoodsDetail();
	//3.清空询价单描述
	//clearSalesQuotationMemoTab();
	//3.获取客户询价编号
	$.ajax({
		url:'${path}/quotation/manager/salesQuotation/sales_quotation_info.html',
		method:'POST',
		data:{},
		success:function(r){
			if(r.success){
				$('#quotation_sales_base_id').val(r.child);
			}
			if(!r.success){
				$.messager.alert('提示',r.message,'error');
			}
		},error:function(r){
			$.messager.alert('提示','访问服务发生异常....','error');
		}
	});
}
</script>
