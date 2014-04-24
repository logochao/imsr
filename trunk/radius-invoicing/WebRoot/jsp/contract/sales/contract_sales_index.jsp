<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <jsp:include flush="true" page="/common/includ.jsp"></jsp:include>
<title>销售合同管理</title>
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
$(document).ready(function(){
	//工具栏列界面
	contract_sales_panel_tools=$("#contract_sales_panel_tools").panel({
		border:false,
		href:'${path}/jsp/contract/sales/contract_sales_toolbar.jsp'
	});
});
	
</script>
</head>
<body>
<div id="contract_sales_layout" class="easyui-layout" style="width:100%;height:100%;" fit="true">
    <div data-options="region:'north',split:true,title:'  '" style="width:100%;height:240px;" border="false">
    	<div id="contract_sales_panel_tools" style="margin-top:5px;"></div>
    	<div style="width:100%;height:100%;padding:0px 15px 0px 15px;margin-top:5px;" fit="true" id="contract_sales_panel" class="easyui-panel" border="false">
    		<jsp:include flush="true" page="contract_sales_base.jsp"></jsp:include>
    	</div>
    </div>
    <div data-options="region:'center',split:true" fit="true" border="false">
    	<div id="contract_sales_index_tabs" class="easyui-tabs" data-options="split:true" fit="true" border="false">
    		<div title="合同商品明细" fit="true" style="margin-top: 5px;">
    			<div id="contract_sales_goods_grd_form" style="padding:0px 15px 0px 15px;">
    				<jsp:include flush="true" page="contract_sales_goods_detail.jsp"></jsp:include>
    			</div>
    			<div id="contract_sales_goods_detail_grd">
    				<jsp:include flush="true" page="contract_sales_goods_detail_grd.jsp"></jsp:include>
    			</div>
	        </div>
	        <div title="合同条款" fit="true" style="padding:5px 15px 0px 15px;">
	        	<jsp:include flush="true" page="contract_sales_contract_terms.jsp"></jsp:include>
	        </div>
	        <div title="销售保函" fit="true" style="padding:5px 15px 0px 15px;">
	        	<jsp:include flush="true" page="contract_sales_contract_guarantee.jsp"></jsp:include>
	        </div>
	        <div title="支付方式详情" fit="true" style="margin-top: 5px;">
	        	<jsp:include flush="true" page="contract_sales_pay_detail.jsp"></jsp:include>
	        </div>
	        <div title="合同备注" fit="true" style="padding:5px 15px 0px 15px;">
	        	<jsp:include flush="true" page="contract_sales_contract_mome.jsp"></jsp:include>
	        </div>
	        <div title="合同扫描件" fit="true" style="margin-top: 5px;">
	        	<jsp:include flush="true" page="contract_sales_contract_scan.jsp"></jsp:include>
	        </div>
	        <div title="报价记录" fit="true" style="margin-top: 5px;">
	        	<jsp:include flush="true" page="contract_sales_goods_quoted.jsp"></jsp:include>
	        </div>
    	</div>
    </div>
</div>
<jsp:include flush="true" page="contract_sales_open.jsp"></jsp:include>
</body>
</html>