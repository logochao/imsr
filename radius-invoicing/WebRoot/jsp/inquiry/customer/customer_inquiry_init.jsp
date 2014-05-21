<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
/**
 *初始化客户销售报价界面
 **/
function customerInquiryInit(){
	$("#customer_inquiry_toolbar_ok_btn").attr("disabled",false);
	$('#customer_inquiry_toolbar_ok_btn').linkbutton('enable');
	$("#customer_inquiry_toolbar_pend_btn").attr("disabled",false);
	$('#customer_inquiry_toolbar_pend_btn').linkbutton('enable');
	$('#customer_inquiry_goods_grd_add_btn').linkbutton('enable');
	$('#customer_inquiry_goods_grd_delete_btn').linkbutton('enable');
	//1.清空客户询价基本信息
	clearCustomerInquiryBaseInfo();
	//2.清空客户询价商品信息
	clearCustomerInquiryGoodsDetail();
	//3.清空询价单描述
	clearCustomerInquiryMemoTab();
	//3.获取客户询价编号
	$.ajax({
		url:'${path}/inquiry/manager/salesInquiry/customer_inquiry_info.html',
		method:'POST',
		data:{},
		success:function(r){
			if(r.success){
				$('#customer_inquiry_base_id').val(r.child);
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
