<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
var business_staff_grd_staff_grid=null;
$(function(){
	business_staff_grd_staff_grid=$('#business_staff_grd_staff_grid').datagrid({
		fitColumns:false,
   		autoRowHeight:true,
   		border:false,
   		striped:true,
   		rownumbers:true,
   		collapsible:true,
   		columns:[[
	   		{field:'id',title:'工号',width:40},
			{field:'name',title:'姓名',width:60},
			{field:'sex',title:'性别',width:40,formatter:staffsexFormatter},
			{field:'idNum',title:'身份证号',width:130},
			{field:'birth',title:'出生日期',width:80},
			{field:'married',title:'婚否',width:40,formatter:staffMarriedFormatter},           
			{field:'education',title:'学历',width:40},         
			{field:'belongInstitution',title:'所属单位编号',width:60}, 
			{field:'institutionName',title:'所属单位名称',width:250},   
			{field:'jobDuty',title:'职务',width:60},           
			{field:'officeTel',title:'办公电话',width:90},         
			{field:'mobNum',title:'手机号1',width:80},            
			{field:'mobNum2',title:'手机号2',width:80},           
			{field:'QQ',title:'QQ号码',width:80},                
			{field:'email',title:'E_mail',width:120},             
			{field:'address',title:'家庭住址',width:250},           
			{field:'postCode',title:'邮政编码',width:60},          
			{field:'homeTel',title:'住宅电话',width:90},
			{field:'status',title:'员工状态',width:120,formatter:staffStatusFormatter},            
 			{field:'modifyDate',title:'信息修改日期',width:80},        
			{field:'operator',title:'操作员编号',width:60},
			{field:'resume',title:'简历',width:120},                       
			{field:'memo',title:'备注',width:120},          
		]]
	});
});

/**
 * 将数据添加到员工列表中
 *@params{} row_data
 *
 **/     
function addBusinessStaffGrdStaffGrid(row_data){
	//1.将数据添加到datagrid中
	addTargetDataGridRowData(business_staff_grd_staff_grid,row_data,0);//target_grid,row_data,row_index
	business_staff_grd_staff_grid.datagrid('acceptChanges');//接受改变
}



/**
 * 员工类型信息
 *@params{}  value
 *@params{}  row
 *@params{}  index
 *@return   
 **/
 

function staffsexFormatter(value,row,index){
	var combobox_data = business_staff_search_staff_sex.combobox('getData');
	for(var i=0,length=combobox_data.length;i<length;i++){
		if(combobox_data[i].id==value){
			value=combobox_data[i].name;
			break;
		}
	}
	return value;
}

/**
 * 员工状态信息
 *@params{}  value
 *@params{}  row
 *@params{}  index
 *@return   
 **/

function staffStatusFormatter(value,row,index){
	var combobox_data = business_staff_info_form_staff_status.combobox('getData');
	for(var i=0,length=combobox_data.length;i<length;i++){
		if(combobox_data[i].id==value){
			value=combobox_data[i].name;
			break;
		}
	}
	return value;
}

function staffMarriedFormatter(value,row,index){
	var combobox_data = business_staff_info_form_married.combobox('getData');
	for(var i=0,length=combobox_data.length;i<length;i++){
		if(combobox_data[i].id==value){
			value=combobox_data[i].name;
			break;
		}
	}
	return value;
}
/**
 * 使用状态信息
 *@params{}  value
 *@params{}  row
 *@params{}  index
 *@return   
 **/
/**
function useStatusFormatter(value,row,index){
	var combobox_data = business_staff_info_form_cash_use_status.combobox('getData');
	for(var i=0,length=combobox_data.length;i<length;i++){
		if(combobox_data[i].id==value){
			value=combobox_data[i].name;
			break;
		}
	}
	return value;
}
**/
</script>
<div id="business_staff_grd_staff_grid"><%--员工列表--%></div>