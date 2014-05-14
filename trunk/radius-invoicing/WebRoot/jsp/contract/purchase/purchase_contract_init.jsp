<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
<!--
 function purchaseContractInit(){
 	//1.清空相关表单域
 	clearPurchaseContract();
 	//2.获取采购合同编号
 	var ajax_url='${path}/contract/manager/purchaseContract/purchase_contract_init.html';
 	$.ajax({
 		url:ajax_url,
 		method:'POST',
 		data:{},
 		success:function(r){
			if(r.success){
				$('#purchase_contract_base_id').val(r.child);
			}
			if(!r.success){
				$.messager.alert('提示',r.message,'error');
			}
		},error:function(r){
			$.messager.alert('提示','访问服务发生异常....','error');
		}
 	});
 }
 
 function clearPurchaseContract(){
 	//1.清空采购合同基本信息
 	clearPurchaseContractBase();
 	//2.清空合同商品明细页签
 	clearPurchaseContractGoodsDetailTab();
 	//3.清空订单条款
 	clearPurchaseContractTermsTab();
 	//4.清空订单描述
 	clearPurchaseContractMemoTab();
 	//5.支付方式详情
 	clearPurchaseContractPaymentTab();
 	//6.清空扫描件列表
 	clearPurchaseContractScanTab();
 	//7.清空询价记录
 	clearPurchaseContractTab();
 }
//-->
</script>