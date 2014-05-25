<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
function initSupplierQuotation(){
	//1.将相关表单域进行清空操作
	//2.获取供应商订单号
	$.ajax({
		url:'${path}/quotation/manager/supplierQuotation/supplier_quotation_info.html',
		method:'POST',
		data:{},
		success:function(r){
			if(r.success){
				$('#quotation_supplier_base_id').val(r.child);
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