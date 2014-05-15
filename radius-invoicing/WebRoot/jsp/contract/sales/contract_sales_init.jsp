<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
function salesContractInit(){
	//1.清空销售合同相关信息
	clearSalesContract();
}
//清空销售合同
function clearSalesContract(){
	//1.销售合同基本信息
	clearContractSalesBase();
	//2.销售合同商品明细
	clearContractSalesGoodsDetail();
	//3.销售合同条款
	clearContractSalesContractTerms();
	//4.销售合同保函
	clearContractSalesContractGuarantee();
	//5.销售合同支付明细
	clearContractSalesPayDetail();
	//6.销售合同备注
	clearContractSalesContractMome();
	//7.销售合同扫描件
	clearContractSalesContractScan();
	//8.销售报价
	clearContractSalesGoodsQuoted();
	//2.获取新的合同编号并设置对应的域
	$.ajax({
		url:'${path}/contract/manager/salescontract/get_sales_contract_info.html',
		mehtod:'POST',
		data:{},
		success:function(r){
			if(r&&r.success){
				$('#constract_sales_base_id').val(r.child.id);
			}
		},error:function(r){
			$.messager.alert('提示','访问服务发生异常....','error');
		}
	});
}
</script>