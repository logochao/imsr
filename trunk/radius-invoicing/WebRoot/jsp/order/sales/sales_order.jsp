<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <jsp:include flush="true" page="/common/includ.jsp"></jsp:include>
<title>销售订单管理</title>
<style >
#imgPreviewWithStyles {
    background: #222;
    -moz-border-radius: 10px;
    -webkit-border-radius: 10px;
    padding: 15px;
    z-index: 999;
    border: none;
}

/* Text below image */
#imgPreviewWithStyles span {
    color: white;
    text-align: center;
    display: block;
    padding: 10px 0 3px 0;
}
</style>
<script type="text/javascript">
	var sales_order_panel_tools=null; 
	$(document).ready(function(){
		//工具栏列界面
		sales_order_panel_tools=$("#sales_order_panel_tools").panel({
			border:false,
			href:'${path}/jsp/order/sales/sales_order_toolbar.jsp'
		});
		
		$('#sales_order_index_pay_time').datebox({
	 		//required:true
	 	});
		$('#sales_order_index_receivables_time').datebox({
	 		//required:true
	 	});
	 	$('#sales_order_index_tabs').tabs({//页签
	 		onSelect:function(title,index){
	 		}
	 	});
	});
	
</script>
</head>
<div id="sales_order_layout" class="easyui-layout" style="width:100%;height:100%;" fit="true">
    <div data-options="region:'north',split:true,title:' '" style="width:100%;height:250%;" border="false">
    	<div id="sales_order_panel_tools" style="margin-top: 5px;"></div>
    	<div style="width:100%;height:100%;padding:15px;" fit="true" id="sales_order_panel" class="easyui-panel" border="false">
    		<jsp:include flush="true" page="sales_order_base.jsp"></jsp:include>
    	</div>
    </div>
    <div data-options="region:'center',split:true" fit="true" border="false">
    	<div id="sales_order_index_tabs" class="easyui-tabs" data-options="split:true" fit="true" border="false">
    		<div title="订单明细" fit="true">
	        </div>
    		<div title="订单条款" fit="true">
	        </div>
    		<div title="订单备注" fit="true">
	        </div>
    		<div title="销售合同" fit="true">
    			<jsp:include flush="true" page="sales_order_contract_detail.jsp"></jsp:include>
	        </div>
    		<div title="报价记录" fit="true">
	        </div>
    	</div>
    </div>
</div>
</html>