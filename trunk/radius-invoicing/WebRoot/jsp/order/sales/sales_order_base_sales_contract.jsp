<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
var sales_order_base_sales_contract_dialog = null;
$(function(){
	//销售合同对话框
	sales_order_base_sales_contract_dialog=$('#sales_order_base_sales_contract_dialog').show().dialog({//销售合同查询对话框
		 title:'选择销售合同',
		 width:800,
		 height:400,
		 collapsible:true,//向上缩小按钮
		 maximizable:true,
		 modal:true,
		 closed:true
	});
	
	//查询销售合同按钮
	$('#sales_order_base_sales_contract_search_btn').on('click',function(){//选择合同确定按钮
		$.ajax({//获取销售合同信息
			url:'${path}/contract/manager/salescontract/sales_contract_info_by_customer.html',
			method:'POST',
			data:{
				customerId:$('#sales_order_base_customer_id').val(),//客户编号
				id:$('#sales_order_base_sales_contract_id').val()//销售合同编号
			},
			success:function (r){//将数据追加到销售合同列表
				//1.将获取到的合同信息追加到列表中
				sales_order_base_sales_contract_grd.datagrid('loadData',r.rows);
			},
			error:function (r){
				$.messager.alert('提示','与服务端通信失败...','error');	
			} 
		});
	});
	
	//确定选择销售合同按钮
	$('#sales_order_base_sales_contract_ok_btn').on('click',function(){//销售合同确定按钮
		var rows=sales_order_base_sales_contract_grd.datagrid('getSelections');
		if(rows.length>1){
			$.messager.alert('提示','请选择单行销售合同信息','warning');
			return ;			
		}
		if(rows.length==0){
			$.messager.alert('提示','请选择销售合同行信息','warning');
			return null;			
		}
		var contractId=$('#sales_order_base_sales_contract_id').val();
		//处理合同相同的情况下,即合同没有变化所有的操作都不进行
		if(contractId.length>0&&contractId==rows[0].id){
			$('#sales_order_base_sales_contract_dialog').dialog('close');
			return;
		}
		
		if(contractId.length>0&&contractId!=rows[0].id){//如果合同编号发生变化则将数据数据表格的数据情况、sales_order_total_amount设置为 0 
			removeDataGrid2Memcached();
			//情况销售合同页签下的datagrid数据
			$('#sales_order_sales_contract_goods_detail_grd').datagrid('loadData', {total: 0,rows:[]});
		}
		$('#sales_order_base_sales_contract_id').val(rows[0].id);
		$('#sales_order_base_total_amount').val((rows[0].totalAmount/100).toFixed(2));
		$('#sales_order_base_sales_contract_dialog').dialog('close');
		//表示存在-->将商品列表中的相关按钮禁用
		$('#contract_sales_goods_grd_add_btn').linkbutton('disable');
		$('#contract_sales_goods_grd_delete_btn').linkbutton('disable');
		//2.异步请求获取销售合同的详细信息
		getSalesContractDetailInfo();
	});
});
</script>
<%-- 合同查询对话框--%>
<div id="sales_order_base_sales_contract_dialog">
	<fieldset>	
		<legend>查询销售合同</legend>
		<table class="table" style="width: 100%;"><%--商家信息 --%>
			<tr>
				<th>合同编号</th>
				<td><input id="sales_order_base_sales_contract_id" style="border:1px solid #95B8E7"/></td>
				<td>
					<div style="float: left;">
					<a id="sales_order_base_sales_contract_search_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
					</div>
					<div class="datagrid-btn-separator"></div>
					<div style="float: left;">
					<a id="sales_order_base_sales_contract_ok_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-true'" plain="true">确定</a>
					<div>
				</td>
			</tr>
		</table>
	</fieldset>
	<jsp:include flush="true" page="sales_order_base_sales_contract_grd.jsp"></jsp:include>
</div>