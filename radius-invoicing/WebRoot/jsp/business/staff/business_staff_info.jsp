<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
var business_staff_info_form_staff_sex = null;//员工性别
var business_staff_info_form_staff_status = null;//员工状态
var business_staff_info_form_married = null;
var business_staff_info_form_belongInstitution = null;
//var business_goods_company_from = "0";
//var business_staff_info_form_cash_use_status = null;//使用状态
$(function(){
	
	//员工性别
	business_staff_info_form_staff_sex=$('#business_staff_info_form_staff_sex').combobox({
 		url:'${path}/common/system/sex_list.html',
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
	
	
	//员工状态
	business_staff_info_form_staff_status=$('#business_staff_info_form_staff_status').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=7000',
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
	//婚姻状态
	business_staff_info_form_married=$('#business_staff_info_form_married').combobox({
 		url:'${path}/common/system/category_code_list.html?parentId=7100',
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
	business_staff_info_form_belongInstitution=$('#business_staff_info_form_belongInstitution').combogrid({   
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
	//订货日期
 	$('#business_staff_info_form_birth').datebox({
 	
 	});
	/*
	business_staff_info_form_cash_use_status=$('#business_staff_info_form_cash_use_status').combobox({
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
	$('#business_staff_info_form_supplier_search_btn').on('click',function(){
		business_staff_info_company_dialog.dialog('open');
		business_staff_company_from=$(this).attr('from');
	});
	*/
});



 /**
  * 获取添加员工信息格式化后的员工信息(符合后台model对象)
  * @return json
  **/
 function getAddStaffInfoFormatter(){
 	var json={
 		id						:$('#business_staff_info_form_id').val(),                
		name					:$('#business_staff_info_form_name').val(),              
		sex						:business_staff_info_form_staff_sex.combobox('getValue'),               
		idNum					:$('#business_staff_info_form_idNum').val(),             
		birth					:parseDate($('#business_staff_info_form_birth').datebox('getValue')),           
		married					:business_staff_info_form_married.combobox('getValue'),         
		education				:$('#business_staff_info_form_education').val(),         
 		belongInstitution		:business_staff_info_form_belongInstitution.datebox('getValue'),
 		institutionName			:$('#business_staff_info_form_institutionName').val(),   
 		jobDuty					:$('#business_staff_info_form_jobDuty').val(),           
 		officeTel				:$('#business_staff_info_form_officeTel').val(),         
 		mobNum					:$('#business_staff_info_form_mobNum').val(),            
 		mobNum2					:$('#business_staff_info_form_mobNum2').val(),           
 		QQ						:$('#business_staff_info_form_QQ').val(),                
 		email					:$('#business_staff_info_form_email').val(),             
 		address					:$('#business_staff_info_form_address').val(),           
 		postCode				:$('#business_staff_info_form_postCode').val(),          
 		homeTel					:$('#business_staff_info_form_homeTel').val(),           
 		resume					:$('#business_staff_info_form_resume').val(),            
 		status					:business_staff_info_form_staff_status.combobox('getValue'),           
 		memo					:$('#business_staff_info_form_memo').val()       
 	};
 	return json;
 }
 
 /**
  * 验证添加员工信息
  * @return boolean 
  **/
 function validateAddStaffInfo(){
 	var validate =true;
 	return validate;
 }
  /**
  * 重置添加员工信息表单
  **/
 function resetBusinessStaffSearchAddStaffDialogForm(){
 	$('#business_staff_info_form_id').val(''),                
	$('#business_staff_info_form_name').val(''),              
	business_staff_info_form_staff_sex.combobox('setText',''),               
	$('#business_staff_info_form_idNum').val(''),             
	business_staff_info_form_birth.datebox('setValue',''),             
	business_staff_info_form_married.combobox('setText',''),          
	$('#business_staff_info_form_education').val(''),         
	$business_staff_info_form_belongInstitution.datebox('setValue',''), 
	$('#business_staff_info_form_institutionName').val(''),   
	$('#business_staff_info_form_jobDuty').val(''),           
	$('#business_staff_info_form_officeTel').val(''),         
	$('#business_staff_info_form_mobNum').val(''),            
	$('#business_staff_info_form_mobNum2').val(''),           
	$('#business_staff_info_form_QQ').val(''),                
	$('#business_staff_info_form_email').val(''),             
	$('#business_staff_info_form_address').val(''),           
	$('#business_staff_info_form_postCode').val(''),          
	$('#business_staff_info_form_homeTel').val(''),           
	$('#business_staff_info_form_resume').val(''),            
	business_staff_info_form_staff_status.combobox('setText',''),           
	$('#business_staff_info_form_memo').val('')  
 }
</script>
<table  tyle="width: 99%;margin-left: 10px;height: 100px;">
	<tr>
		<td>员工姓名</td>
		<td>
			<input id="business_staff_info_form_name" style="border:1px solid #95B8E7"/> 
			<input id="business_staff_info_form_id" type="hidden" value="${staff.id}"/> 
		</td>
		<td>员工性别</td>
		<td><input id="business_staff_info_form_staff_sex" style="border:1px solid #95B8E7"/> </td>
		<td>身份证号</td>
		<td><input id="business_staff_info_form_idNum" style="border:1px solid #95B8E7"/> </td>
		<td>出生日期</td>
		<td><input class="easyui-validatebox" type="text" id="business_staff_info_form_birth" style="border:1px solid #95B8E7"/> </td>
	</tr>
	<tr>
		<td>婚姻状况</td>
		<td><input id="business_staff_info_form_married" style="border:1px solid #95B8E7"/> </td>
		<td>学历</td>
		<td><input id="business_staff_info_form_education" style="border:1px solid #95B8E7"/> </td>
		<td>所属单位</td>
		<td colspan="3">
			<input id="business_staff_info_form_belongInstitution" style="border:1px solid #95B8E7;width: 260px" /> 
			<input id="business_staff_info_form_institutionName" type="hidden" value= "${institution.instName}"/>
		</td>
	</tr>
	<tr>
		<td>工作职务</td>
		<td><input id="business_staff_info_form_jobDuty" style="border:1px solid #95B8E7"/> </td>
		<td>办工电话</td>
		<td><input id="business_staff_info_form_officeTel" style="border:1px solid #95B8E7"/> </td>
		<td>手机号1</td>
		<td><input id="business_staff_info_form_mobNum" style="border:1px solid #95B8E7"/> </td>
		<td>手机号2</td>
		<td><input id="business_staff_info_form_mobNum2" style="border:1px solid #95B8E7"/> </td>
    </tr>
	<tr>
		<td>QQ号码</td>
		<td><input id="business_staff_info_form_QQ" style="border:1px solid #95B8E7"/> </td>
		<td>E_MAIL</td>
		<td><input id="business_staff_info_form_email" style="border:1px solid #95B8E7"/> </td>
		<td>住宅电话</td>
		<td><input id="business_staff_info_form_homeTel" style="border:1px solid #95B8E7"/> </td>
		<td>工作状态</td>
		<td><input id="business_staff_info_form_staff_status" style="border:1px solid #95B8E7"/> </td>
	</tr>
	<tr>
		<td>家庭住址</td>
		<td><input id="business_staff_info_form_address" style="border:1px solid #95B8E7"/> </td>
		<td>邮编</td>
		<td><input id="business_staff_info_form_postCode" style="border:1px solid #95B8E7"/> </td>
	</tr>
	<!-- 
	<tr>	    
        <td>简历</td>
		<td><input id="business_staff_info_form_resume" style="border:1px solid #95B8E7"/> </td>
	</tr>
	<tr>
		<td>备注</td>
		<td><input id="business_staff_info_form_memo" style="border:1px solid #95B8E7"/> </td>	
	</tr>
	 -->
</table>
<div class="easyui-tabs" data-options="split:true" fit="true" border="false" style="margin-top: 10px;"> 
	<div title="员工简历">
		<textarea rows="5" cols="120" id="business_staff_info_form_resume" style="border:1px solid #95B8E7"></textarea>
	</div>
	<div title="员工备注">
		<textarea rows="5" cols="120" id="business_staff_info_form_memo" style="border:1px solid #95B8E7"></textarea>
	</div>
</div>