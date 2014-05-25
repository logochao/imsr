<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
//var business_institution_info_form_institution_type = null;//商品类型
//var business_institution_info_form_institution_status = null;//商品状态
//var business_institution_company_from = "0";
//var business_institution_info_form_cash_use_status = null;//使用状态
var business_institution_info_form_instHead = null;//机构负责人
var business_institution_info_form_approRev = null;//审批复核人
var business_institution_info_form_linkMan = null;//机构成联系人
var business_institution_info_form_fatherInst = null;//父级机构信息
$(function(){
	business_institution_info_form_instHead = $('#business_institution_info_form_instHead').combogrid({   
	    panelWidth:450,   
	    //value:'',   
	    
	    idField:'id',   
	    textField:'name',   
	    url:'${path}/staff/manager/staff/info_2_staff.html',  
	    columns:[[   
	        {field:'id',title:'员工编号',width:100},   
	        {field:'name',title:'员工姓名',width:100},
	        {field:'institutionName',title:'所属单位',width:100},    
	        {field:'jobDuty',title:'职务',width:120}  
	    ]] ,
	    
	    /*
	    onSelect:function(rowIndex, rowData){
	    	$('#business_institution_info_form_instHead_id').val(rowData.id);
	    }  
	    */
	});
	business_institution_info_form_approRev = $('#business_institution_info_form_approRev').combogrid({   
	    panelWidth:450,   
	    //value:'',   
	    
	    idField:'id',   
	    textField:'name',   
	    url:'${path}/staff/manager/staff/info_2_staff.html',  
	    columns:[[   
	        {field:'id',title:'员工编号',width:100},   
	        {field:'name',title:'员工姓名',width:100},
	        {field:'institutionName',title:'所属单位',width:100},    
	        {field:'jobDuty',title:'职务',width:120}  
	    ]] ,
	    
	    /*
	    onSelect:function(rowIndex, rowData){
	    	$('#business_institution_info_form_instHead_id').val(rowData.id);
	    }  
	    */
	});
	business_institution_info_form_linkMan = $('#business_institution_info_form_linkMan').combogrid({   
	    panelWidth:450,   
	    //value:'',   
	    
	    idField:'id',   
	    textField:'name',   
	    url:'${path}/staff/manager/staff/info_2_staff.html',  
	    columns:[[   
	        {field:'id',title:'员工编号',width:100},   
	        {field:'name',title:'员工姓名',width:100},
	        {field:'institutionName',title:'所属单位',width:100},    
	        {field:'jobDuty',title:'职务',width:120}  
	    ]] ,
	    
	    /*
	    onSelect:function(rowIndex, rowData){
	    	$('#business_institution_info_form_instHead_id').val(rowData.id);
	    }  
	    */
	});
	business_institution_info_form_fatherInst=$('#business_institution_info_form_fatherInst').combogrid({   
	    panelWidth:450,   
	    //value:'',   
	    idField:'instId',   
	    textField:'instName',   
	    url:'${path}/institution/manager/institution/institution_info_2_institution.html',  
	    columns:[[   
	        {field:'instId',title:'机构编号',width:100},   
	        {field:'instName',title:'机构名称',width:100},
	        {field:'instHead',title:'机构负责人',width:100} 
	    ]]   
	});  

/*
	//商品类型
	business_institution_info_form_institution_type=$('#business_institution_info_form_institution_type').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=2600',
 		valueField: 'id',
		textField: 'name',
		onLoadSuccess:function(){
			var target = $(this);
			var data = target.combobox("getData");
			var options = target.combobox("options");
			if(data && data.length>0){
				var fs = data[0];
				target.combobox("setValue",fs[options.valueField]);
			}
		},
		editable:false
	});
	//商品状态
	business_institution_info_form_institution_status=$('#business_institution_info_form_institution_status').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=3700',
 		valueField: 'id',
		textField: 'name',
		onLoadSuccess:function(){
			var target = $(this);
			var data = target.combobox("getData");
			var options = target.combobox("options");
			if(data && data.length>0){
				var fs = data[0];
				target.combobox("setValue",fs[options.valueField]);
			}
		},
		editable:false
	});
	
	business_institution_info_form_cash_use_status=$('#business_institution_info_form_cash_use_status').combobox({
 		url:'${path}/common/system/use_status_list.html',
 		valueField: 'id',
		textField: 'name',
		onLoadSuccess:function(){
			var target = $(this);
			var data = target.combobox("getData");
			var options = target.combobox("options");
			if(data && data.length>0){
				var fs = data[0];
				target.combobox("setValue",fs[options.valueField]);
			}
		},
		editable:false
	});
	
	//生成厂商查询按钮
	$('#business_institution_info_form_supplier_search_btn').on('click',function(){
		business_institution_info_company_dialog.dialog('open');
		business_institution_company_from=$(this).attr('from');
	});
	*/
});


 /**
  * 获取添加商品信息格式化后的商品信息(符合后台model对象)
  * @return json
  **/
 function getAddInstitutionInfoFormatter(){
 /*
 	var instHead_id = business_institution_info_form_instHead.datebox('getValue');
 	console.info($('#business_institution_info_form_instHead_id'));
 	alert(instHead_id);
 */	
 	var json={
		 instId						:$('#business_institution_info_form_instId').val(),
	     instName					:$('#business_institution_info_form_instName').val(),
	     instTel					:$('#business_institution_info_form_instTel').val(),
	     instHead					:business_institution_info_form_instHead.datebox('getValue'),
	     approRev					:business_institution_info_form_approRev.datebox('getValue'),
	     amountLmt					:$('#business_institution_info_form_amountLmt').val(),
	     fatherInst					:business_institution_info_form_fatherInst.datebox('getValue'),
	     instAddr					:$('#business_institution_info_form_instAddr').val(),
	     postCode					:$('#business_institution_info_form_postCode').val(),
	     instUrl					:$('#business_institution_info_form_instUrl').val(),
	     linkMan					:business_institution_info_form_linkMan.datebox('getValue'),
	     instFax					:$('#business_institution_info_form_instFax').val(),
	     instMail					:$('#business_institution_info_form_instMail').val()
 	};
 	return json;
 	
 }
 
 /**
  * 验证添加商品信息
  * @return boolean 
  **/
 function validateAddInstitutionInfo(){
 	var validate =true;
 	return validate;
 }
  /**
  * 重置添加商品信息表单
  **/
 function resetBusinessInstitutionSearchAddInstitutionDialogForm(){
 	$('#business_institution_info_form_instId').val(''),    
	$('#business_institution_info_form_instName').val(''),  
	$('#business_institution_info_form_instTel').val(''),   
	$('#business_institution_info_form_instHead').val(''),  
	$('#business_institution_info_form_approRev').val(''),  
	$('#business_institution_info_form_amountLmt').val(''), 
	$('#business_institution_info_form_fatherInst').val(''),
	$('#business_institution_info_form_instAddr').val(''),  
	$('#business_institution_info_form_postCode').val(''),  
	$('#business_institution_info_form_instUrl').val(''),   
	$('#business_institution_info_form_linkMan').val(''),   
	$('#business_institution_info_form_instFax').val(''),   
	$('#business_institution_info_form_instMail').val('')  
 }
</script>
<table  style="width: 100%;margin-left: 10px;height: 100px;">
	<tr>
		<td>机构名称</td>
		<td>
			<input id="business_institution_info_form_instName" style="border:1px solid #95B8E7"/> 
			<input id="business_institution_info_form_instId" type="hidden" value="${institution.instId}"/> 
		</td>
		<td>机构电话</td>
		<td><input id="business_institution_info_form_instTel" style="border:1px solid #95B8E7"/> </td>
		<td>机构负责人</td>
		<td>
		<input id="business_institution_info_form_instHead"  style="border:1px solid #95B8E7"/> 
		<%--
		<input id="business_institution_info_form_instHead_id" type="hidden"/>
		 --%>
		</td>
	</tr>
	<tr>
		<td>审批复核人</td>
		<td><input id="business_institution_info_form_approRev" style="border:1px solid #95B8E7"/> </td>
		<td>审批额度</td>
		<td><input id="business_institution_info_form_amountLmt" style="border:1px solid #95B8E7"/> </td>
		<td>父级机构</td>
		<td><input id="business_institution_info_form_fatherInst" style="border:1px solid #95B8E7"/> </td>
	</tr>
	<tr>
		<td>机构地址</td>
		<td><input id="business_institution_info_form_instAddr" style="border:1px solid #95B8E7"/> </td>
		<td>邮政编码</td>
		<td><input id="business_institution_info_form_postCode" style="border:1px solid #95B8E7"/> </td>
		<td>机构网址</td>
		<td><input id="business_institution_info_form_instUrl" style="border:1px solid #95B8E7"/> </td>
	</tr>
	<tr>
		<td>联系人</td>
		<td><input id="business_institution_info_form_linkMan" style="border:1px solid #95B8E7"/> </td>
		<td>传真</td>
		<td><input id="business_institution_info_form_instFax" style="border:1px solid #95B8E7"/> </td>
		<td>机构邮箱</td>
		<td><input id="business_institution_info_form_instMail" style="border:1px solid #95B8E7"/> </td>
	</tr>

</table>

