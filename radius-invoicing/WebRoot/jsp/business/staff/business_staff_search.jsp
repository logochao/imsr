<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
<!--
var business_staff_search_staff_status = null;//员工状态
//var business_staff_search_product_series = null ;//员工类别
var business_staff_search_staff_sex = null ;//员工性别

//var business_staff_search_add_product_dialog = null;//添加员工信息对话框 
//var business_staff_info_company_dialog = null;
 $(function (){
 
 	//----------------------------------初始化--------------------------------------------------------
 	business_staff_search_add_staff_dialog=$('#business_staff_search_add_staff_dialog').show().dialog({
		 title:'添加员工信息',
		 width:800,
		 height:400,
		 collapsible:true,//向上缩小按钮
		 maximizable:true,
		 modal:true,
		 closed:true,
		 toolbar:['-',{
	 			 id:'business_staff_search_add_staff_dialog_save_btn',
	 			 text:'信息保存',
	 			 iconCls: 'icon-add',
	 			 handler:addStaffInfoSaveBtn
	 			},'-',{
	 			 id:'business_staff_search_add_staff_dialog_close_btn',
	 			 text:'关闭',
	 			 iconCls: 'icon-cancel',
	 			 handler:addStaffInfoCloseBtn
	 			},
	 		'-']
	});
 	
 	
 	//员工状态
 	business_staff_search_staff_status=$('#business_staff_search_staff_status').combobox({
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
 	
 	
 	//员工性别
 	business_staff_search_staff_sex=$('#business_staff_search_staff_sex').combobox({
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
 	
 	//---------------------------------------业务处理--------------------------------------------------------------
 	//查询按钮
 	$('#business_staff_search_query_btn').on('click',function(){
 		business_staff_grd_staff_grid.datagrid('options').url='${path}/staff/manager/staff/info_2_staff.html';
 		business_staff_grd_staff_grid.datagrid('load',{
 			name			:$('#business_staff_search_name').val(),
 			sex				:business_staff_search_staff_sex.combobox('getValue'),
 			status			:business_staff_search_staff_status.combobox('getValue')
 		});
 	});
 	//确定按钮
 	$('#business_staff_search_ok_btn').on('click',function(){
 		
 	});
 });
 
 /**
  * 保存员工信息按钮处理事件
  *
  **/
 
 function addStaffInfoSaveBtn(){
 	var staff_data = getAddStaffInfoFormatter();
 	var validate = validateAddStaffInfo();
 	if(validate){
 		$.ajax({
 			url:'${path}/staff/manager/staff/staff_infos_add.html',
 			method:'POST',
 			data:staff_data,
 			success:function(r){
 				if(r&&r.success){
 					//1.将数据追加到datagrid中
 					var row_data=getStaffInfo2StaffGrid(r.child);
 					addBusinessStaffGrdStaffGrid(row_data);
 					//2.将添加员工界面进行清空处理
 					resetBusinessStaffSearchAddStaffDialogForm();
 					//3.员工编号
 					$('#business_staff_info_form_id').val(r.child.backup);
 					//4.关闭对话框
 					addStaffInfoCloseBtn();
 				}
 			},
 			error:function(r){
 				$.messager.alert('提示','访问服务发生异常....','error');
 			}
 		});
 	}
 }

 /**
  * 将后台数据转化为员工列表datagrid row_data
  * @params{} _data 后台数据对象
  * @return   json
  **/
 function getStaffInfo2StaffGrid(_data){
 	var  json ={
 		id					:_data.id,                
		name				:_data.name,              
		sex					:_data.sex,               
		idNum				:_data.idNum,             
		birth				:_data.birth,             
		married				:_data.married,           
		education			:_data.education,         
		belongInstitution	:_data.belongInstitution, 
		institutionName		:_data.institutionName,   
		jobDuty				:_data.jobDuty,           
		officeTel			:_data.officeTel,         
		mobNum				:_data.mobNum,            
		mobNum2				:_data.mobNum2,           
		QQ					:_data.QQ,                
		email				:_data.email,             
		address				:_data.address,           
		postCode			:_data.postCode,          
		homeTel				:_data.homeTel,           
		resume				:_data.resume,            
		status				:_data.status,            
		memo				:_data.memo,              
		modifyDate			:_data.modifyDate,        
		operator			:_data.operator          
	};
 	return json;
 }
 
 /**
  * 添加员工的关闭按钮事件
  **/
 function addStaffInfoCloseBtn(){
 	//1.将对话框中的内容清空
 	resetBusinessStaffSearchAddStaffDialogForm();
 	//2.关闭对话框
 	business_staff_search_add_staff_dialog.dialog('close');
 }
//-->
</script>
<div id="business_staff_search_search_staff_info">
	<table  style="width: 100%;">
		<tr>
			<th>员工姓名:</th>
			<td><input id="business_staff_search_name"  style="border:1px solid #95B8E7"/></td>
			<th>员工性别:</th>
			<td><input id="business_staff_search_staff_sex"  style="border:1px solid #95B8E7"/></td>
			<th>员工状态:</th>
			<td><input id="business_staff_search_staff_status"  style="border:1px solid #95B8E7"/></td>
		
			<td colspan="2" style="text-align: right;" >
				<div style="float: left;margin-top: 5px;">
					<a id="business_staff_search_query_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">查询</a>
				</div>
				<div style="float: left;margin-left: 10px;margin-top: 5px;">
					<a id="business_staff_search_ok_btn"  href="#" class="easyui-linkbutton" data-options="iconCls:'icon-true'" plain="true">确定</a>
				</div>
			</td>
		</tr>
		<tr>
		</tr>
	</table>
</div>

<div id="business_staff_search_add_staff_dialog">
	<form id="business_staff_search_add_staff_dialog_form">
		<jsp:include flush="true" page="business_staff_info.jsp"></jsp:include>
	</form>
</div>
