<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <jsp:include flush="true" page="/common/includ.jsp"></jsp:include>
  <title>销售报价</title>
  <script type="text/javascript">
 var quotation_sales_index_panel_tools=null; //工具栏列界面
 var spec_unit_data={};//容量单位数据
 var cash_type_data={};//货币数据
 $(document).ready(function(){
 	getLoadSpecUnitData();
	quotation_sales_index_panel_tools=$('#quotation_sales_index_panel_tools').panel({
		border:false,
		href:'${path}/jsp/quotation/sales/quotation_sales_toolbar.jsp'
	});
});
/**
 *加载容量数据
 **/
function getLoadSpecUnitData(){
	$.ajax({
		url:'${path}/common/system/category_code_list.html?parentId=1400',
		method:'POST',
		data:{},
		success:function(r){
			spec_unit_data=r;
		},error:function(r){
			$.messager.alert('提示','与后台通讯失败...','error');
		}
	});
}
/**
 *加载货币数据
 **/
function getLoadCashTypeData(){
	$.ajax({
		url:'${path}/common/system/category_code_list.html?parentId=800',
		method:'POST',
		data:{},
		success:function(r){
			cash_type_data=r;
		},error:function(r){
			$.messager.alert('提示','与后台通讯失败...','error');
		}
	});
}
</script>
</head>
<body>
<div id="quotation_sales_layout" class="easyui-layout" style="width:100%;height:100%;" fit="true">
    <div data-options="region:'north',split:true,title:'  '" style="width:100%;height:230%;" border="false">
    	<div id="quotation_sales_index_panel_tools" style="margin-top:5px;">
    		
    	</div>
    	<div style="width:100%;height:100%;padding:15px;" fit="true" id="quotation_sales_index_panel" class="easyui-panel" border="false">
    		<jsp:include flush="true" page="quotation_sales_base.jsp"></jsp:include>
    	</div>
    </div>
    <div data-options="region:'center',split:true" fit="true" border="false">
    	<div id="purchase_contract_index_tabs" class="easyui-tabs" data-options="split:true" fit="true" border="false">
    		<div title="商品明细" fit="true" style="padding:5px 15px 0px 15px;">
		    	<jsp:include flush="true" page="quotation_sales_goods_detail.jsp"></jsp:include>
		    	<jsp:include flush="true" page="quotation_sales_goods_grd.jsp"></jsp:include>
	    	</div>
    		<div title="报价单描述" fit="true" style="padding:5px 15px 0px 15px;">
		    	<jsp:include flush="true" page="quotation_sales_memo.jsp"></jsp:include>
	    	</div>
	    </div>
    </div>
</div>
<jsp:include flush="true" page="quotation_sales_open.jsp"></jsp:include>
</body>
</html>