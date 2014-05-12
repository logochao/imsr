<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
/**
 *采购订单初始化
 **/
function purchaseOrderInit(){
 //1.获取新的采购订单号
 $.ajax({
 	url:'${path}/order/manager/purchaseOrder/purchase_order_info.html',
 	method:'POST',
 	data:{},
 	success:function(r){
 		if(!r.success){
			$.messager.alert('提示',r.message,'error');
		}
		if(r.success){
			 //2.清空相关界面内容
			clearPurchaseOrder();
			$('#purchase_order_base_id').val(r.child);
		}	
 	},error:function(r){
 		$.messager.alert('提示','访问服务发生异常....','error');
 	}
 });
}


/**
 * 清空采购订单
 */
function clearPurchaseOrder(){
	//1.采购订单基本信息
	clearPurchaseOrderBase();
	//2.订单明细页签
	clearPurchaseOrderGoodsDetailTab();
	//3.订单条款页签
	clearPurchaseOrderTermsTab();
	//4.订单备注页签
	clearPurchaseOrderMemoTab();
	//5.询价记录页签
	clearPurchaseOrderInquiryTab();
	//6.合并订单明细页签
	clearPurchaseOrderMergerOrderDetailTab();
}
</script>
