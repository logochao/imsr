<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
/**
 * 初始化销售订单管界面
 **/
function salesOrderInit(){
	//1.获取销售订单号
	$.ajax({
		url:'${path}/order/manager/salesOrder/sales_order_info.html',
		method:'POST',
		data:{},
		success:function(r){
			if(r.success){
				$('#sales_order_base_id').val(r.child);
			}
			if(!r.success){
				$.messager.alert('提示',r.message,'error');
			}
		},error:function(r){
			$.messager.alert('提示','访问服务发生异常....','error');
		}
	});
	//2.将相关内容清空
	clearSalesOrder();
}
/**
 *清空销售订单信息
 **/
function clearSalesOrder(){
	//操作按钮处理
	$("#sales_order_toolbar_ok_btn").attr("disabled",false);
	$('#sales_order_toolbar_ok_btn').linkbutton('enable');
	$("#sales_order_toolbar_pend_btn").attr("disabled",false);
	$('#sales_order_toolbar_pend_btn').linkbutton('enable');
	
	$('#contract_sales_goods_grd_add_btn').linkbutton('enable');
	$('#contract_sales_goods_grd_delete_btn').linkbutton('enable');
	//1.订单基本信息
		clearSalesOrderBase();
	//2.订单商品明细
		clearSalesOrderGoodsDetailTab();
		com.radius.datagrid.clear(sales_order_goods_detail_grd);//清空销售明细
	//3.订单条款
		clearSalesOrderTermsTab();
	//4.订单备注
		clearSalesOrdermemoTab();
	//5.订单合同商品信息
		clearSalesContractGoodsGrdTab();
	//6.报价记录
		clearSalesOrderQuotedTab();
}
</script>