<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
var business_supplier_link_man_count=1;
var business_supplier_link_man_sex = null;//性别 
$(function(){
	business_supplier_link_man_grd=$('#business_supplier_link_man_grd').datagrid({
		fitColumns:false,
   		autoRowHeight:false,
   		border:false,
   		striped:true,
   		rownumbers:true,
   		collapsible:true,
   		frozenColumns:[[
   			{field:'id',title:'编号',width:40},
			{field:'name',title:'姓名',width:100},
			{field:'pinyin',title:'拼音',width:100},
			{field:'sex',title:'性别',width:40},
			{field:'numbers',title:'身份证号',width:80}
   		]],
   		columns:[[
   			 {field:'mobile1',title:'手机1',width:100},
			 {field:'mobile2',title:'手机2',width:120},
			 {field:'mobile3',title:'手机3',width:130},
			 {field:'tel',title:'电话号码',width:130},
			 {field:'homeTel',title:'固定电话',width:130},
			 {field:'address',title:'通讯地址',width:140},
			 {field:'qq',title:'qq',width:80},
			 {field:'email',title:'email',width:80},
			 {field:'jobDuty',title:'职务',width:100},
			 {field:'expertise',title:'职业专长',width:180},
			 {field:'jobTitle',title:'职称',width:120},
			 {field:'jobContent',title:'负责工作内容',width:200},
			 {field:'hobbies',title:'兴趣爱好',width:200},
			 {field:'postCode',title:'邮编',width:80},
			 {field:'companyId',title:'任职公司编号',width:80},
			 {field:'companyName',title:'任职公司名称',width:120},
			 {field:'supplierProperty',title:'公司性质',width:80},
			 {field:'supplierIllustrate',title:'公司说明',width:200},
			 {field:'officeAddress',title:'办公地址',width:200},
			 {field:'staff',title:'业务员编号',width:100},
			 {field:'memo',title:'备注',width:250,align:'center'}
		]]
	});
	//性别
	business_supplier_link_man_sex=$('#business_supplier_link_man_sex').combobox({
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
	//保存联系人按钮事件
	$('#business_supplier_link_man_add_btn').on('click',function(){
		//1.验证数据是否合法
		 var validate =true; //validataLinkManInfo();
		 //var validate = validataLinkManInfo();
		if(!validate){
			$.messager.alert('提示','待提交的联系人信息不符合要求,请核对...','error');
			return ;
		}
		
		var memcached_url ='${path}/supplier/manager/supplier/supplier_link_man_info_memcached.html';//添加供应商联系人信息缓存地址
		var row_data = getLinkManInfo2LinkManGrdRowData();
		console.info(row_data);
		//2.保存数据
		addLinkManInfo2BusinesssupplierLinkManGrd(memcached_url,row_data);
	});
	//重置联系人信息事件
	$('#business_supplier_link_man_reset_btn').on('click',function(){
		resetLinkManInfo();
	});
	
	//删除联系人
	$('#business_supplier_link_man_delete_btn').on('click',function(){
    	var rows=business_supplier_link_man_grd.datagrid('getSelections');
 		if(rows.length<=0){
 			$.messager.alert('提示','请选择待删除的行信息','error');
 			return ;
 		}
		//弹出对话框
		$.messager.confirm('提示','是否确定要删除当前已经选择的行信息',function(r){
			if(r){
				//1.删除数据
				var array=[];
				for(var i=0;i<rows.length;i++){
					array.push(rows[i].id);
				}
				if(array.length>0){
					$.ajax({
						url:'${path}/supplier/manager/supplier/supplier_link_man_info_remove_memcached.html',
						method:'POST',
						data:{
							companyId:$('#business_supplier_search_supplier_id').val(),
							mome:array.join(',')
						},
						success:function (data){//2.将dategrid的行数据进行删除操作
							if(data&&data.success){
								var rows=business_supplier_link_man_grd.datagrid('getSelections');
								for(var i=0;i<rows.length;i++){
									var index=business_supplier_link_man_grd.datagrid('getRowIndex',rows[i]);
									business_supplier_link_man_grd.datagrid('deleteRow',index);
									business_supplier_link_man_grd.datagrid('acceptChanges');//接受改变
								}
							}
						},
						error: function(data){
							$.messager.alert('提示','处理缓存失败...',error);
						}
					});
				}						
			}
		});
	});
});

function resetLinkManInfo(){
    $('#business_supplier_link_man_name').val('');//姓名
	$('#business_supplier_link_man_pinyin').val('');//拼音
	business_supplier_link_man_sex.combobox('setText','未知');//性别
	business_supplier_link_man_sex.combobox('setValue',2);//性别
	$('#business_supplier_link_man_numbers').val('');//身份证号码
	$('#business_supplier_link_man_mobile1').val('');//手机1
	$('#business_supplier_link_man_mobile2').val('');//手机2
	$('#business_supplier_link_man_mobile3').val('');//手机3
	$('#business_supplier_link_man_tel').val('');//电话号码
	$('#business_supplier_link_man_home_tel').val('');
	$('#business_supplier_link_man_address').val('');//通讯地址
	$('#business_supplier_link_man_qq').val('');
	$('#business_supplier_link_man_email').val('');
	$('#business_supplier_link_man_job_duty').val('');//职务
	$('#business_supplier_link_man_expertise').val('');//职业专长
	$('#business_supplier_link_man_job_title').val('');//职称
	$('#business_supplier_link_man_job_contenty').val('');//负责工作内容
	$('#business_supplier_link_man_hobbies').val('');//兴趣爱好
	$('#business_supplier_link_man_post_Code').val('');//邮编
	$('#business_supplier_link_man_mome').val('');//备注
	$('#business_supplier_link_man_staff').val('');//业务员编号
}

/**
 *提交联系人信息
 *@params{} memcached_url
 *@params{} row_data
 **/
function addLinkManInfo2BusinesssupplierLinkManGrd(memcached_url,row_data){
	//1.将数据添加到datagrid中
	addTargetDataGridRowData(business_supplier_link_man_grd,row_data,0);
	//2.获取符合后台的数据
	var memcached_data = getLinkManInfoFormatter(row_data); 
	//3.将数据添加到memcached中
	addFormatterData2Memecached(memcached_url,memcached_data);
	business_supplier_link_man_count++;
	//4.清空列表
	resetLinkManInfo();
}



/**
 * 验证联系人信息是否符合校验
 *@return boolean 默认为false 不符合 
 **/
function validataLinkManInfo(){
	var validata=false;
	return validata;
}

/**
 * 将前端数据组装符合后台的数据
 *@params{} row_data
 *@return json
 **/
function getLinkManInfoFormatter(row_data){
	var json={
		id				:row_data.id,//联系人编号
		name			:row_data.name,//姓名
		pinyin			:row_data.pinyin,//拼音
		sex2			:business_supplier_link_man_sex.combobox('getValue'),//性别
		numbers			:row_data.numbers,//身份证号码
		mobile1			:row_data.mobile1,//手机1
		mobile2			:row_data.mobile2,//手机
		mobile3			:row_data.mobile3,//手机3
		tel				:row_data.tel,//电话号码
		homeTel			:row_data.homeTel,
		address			:row_data.address,//通讯地址
		qq				:row_data.qq,
		email			:row_data.email,
		jobDuty			:row_data.jobDuty,//职务
		expertise		:row_data.expertise,//职业专长
		jobTitle		:row_data.jobTitle,//职称
		jobContent		:row_data.jobContent,//负责工作内容
		hobbies			:row_data.hobbies,//兴趣爱好
		postCode		:row_data.postCode,//邮编
		companyId		:row_data.companyId,//任职公司编号
		companyName		:row_data.companyName,//任职公司名称
		supplierProperty:business_supplier_search_add_supplier_dialog_form_supplier_property.combobox('getValue'),//公司性质
		supplierIllustrate:row_data.supplierIllustrate,//公司说明
		officeAddress	:row_data.officeAddress,//办公地址
		mome			:row_data.memo,//备注
		staff			:row_data.staff//业务员编号
	};
	return json;
}

/**
 * 将后台的数据转为符合联系人列表的数据
 * @return json
 **/
function getLinkManInfo2LinkManGrdRowData(){
	var json={
		id				:business_supplier_link_man_count,//联系人编号
		name			:$('#business_supplier_link_man_name').val(),//姓名
		pinyin			:$('#business_supplier_link_man_pinyin').val(),//拼音
		sex				:business_supplier_link_man_sex.combobox('getText'),//性别
		numbers			:$('#business_supplier_link_man_numbers').val(),//身份证号码
		mobile1			:$('#business_supplier_link_man_mobile1').val(),//手机1
		mobile2			:$('#business_supplier_link_man_mobile2').val(),//手机2
		mobile3			:$('#business_supplier_link_man_mobile3').val(),//手机3
		tel				:$('#business_supplier_link_man_tel').val(),//电话号码
		homeTel			:$('#business_supplier_link_man_home_tel').val(),
		address			:$('#business_supplier_link_man_address').val(),//通讯地址
		qq				:$('#business_supplier_link_man_qq').val(),
		email			:$('#business_supplier_link_man_email').val(),
		jobDuty			:$('#business_supplier_link_man_job_duty').val(),//职务
		expertise		:$('#business_supplier_link_man_expertise').val(),//职业专长
		jobTitle		:$('#business_supplier_link_man_job_title').val(),//职称
		jobContent		:$('#business_supplier_link_man_job_contenty').val(),//负责工作内容
		hobbies			:$('#business_supplier_link_man_hobbies').val(),//兴趣爱好
		postCode		:$('#business_supplier_link_man_post_Code').val(),//邮编
		companyId		:$('#business_supplier_search_supplier_id').val(),//任职公司编号
		companyName		:$('#business_supplier_search_add_supplier_dialog_form_name').val(),//任职公司名称
		supplierProperty:business_supplier_search_add_supplier_dialog_form_supplier_property.combobox('getText'),//公司性质
		supplierIllustrate:$('#business_supplier_search_add_supplier_dialog_form_supplier_illustrate').val(),//公司说明
		officeAddress	:$('#business_supplier_search_add_supplier_dialog_form_office_address').val(),//办公地址
		memo			:$('#business_supplier_link_man_mome').val(),//备注
		staff			:$('#business_supplier_link_man_staff').val()//业务员编号
	};
	return json;
}
</script>
<div id="business_supplier_link_man"><%--供应商联系人--%>
	<table style="width: 100%;margin-left: 10px;height: 100px;">
		<tr>
		<!--id;//联系人编号-->
			<td>姓名:</td>
			<td><input id="business_supplier_link_man_name" style="border:1px solid #95B8E7"/></td>
			<td>拼音:</td>
			<td><input id="business_supplier_link_man_pinyin" style="border:1px solid #95B8E7"/></td>
			<td>性别:</td>
			<td><input id="business_supplier_link_man_sex" style="border:1px solid #95B8E7"/></td>
		</tr>
		<tr>
			<td>身份证号码:</td>
			<td><input id="business_supplier_link_man_numbers" style="border:1px solid #95B8E7"/></td>
			<td>手机1:</td>
			<td><input id="business_supplier_link_man_mobile1" style="border:1px solid #95B8E7"/></td>
			<td>手机2:</td>
			<td><input id="business_supplier_link_man_mobile2" style="border:1px solid #95B8E7"/></td>
		</tr>
		<tr>
			<td>手机3:</td>
			<td><input id="business_supplier_link_man_mobile3" style="border:1px solid #95B8E7"/></td>
			<td>电话号码:</td>
			<td><input id="business_supplier_link_man_tel" style="border:1px solid #95B8E7"/></td>
			<td>固定电话:</td>
			<td><input id="business_supplier_link_man_home_tel" style="border:1px solid #95B8E7"/></td>
		</tr>
		<tr>
			<td>通讯地址:</td>
			<td><input id="business_supplier_link_man_address" style="border:1px solid #95B8E7"/></td>
			<td>qq:</td>
			<td><input id="business_supplier_link_man_qq" style="border:1px solid #95B8E7"/></td>
			<td>email:</td>
			<td><input id="business_supplier_link_man_email" style="border:1px solid #95B8E7"/></td>
		</tr>
		<tr>
			<td>职务:</td>
			<td><input id="business_supplier_link_man_job_duty" style="border:1px solid #95B8E7"/></td>
			<td>职业专长:</td>
			<td><input id="business_supplier_link_man_expertise" style="border:1px solid #95B8E7"/></td>
			<td>职称:</td>
			<td><input id="business_supplier_link_man_job_title" style="border:1px solid #95B8E7"/></td>
		</tr>
		<tr>
			<td>负责工作内容:</td>
			<td><input id="business_supplier_link_man_job_contenty" style="border:1px solid #95B8E7"/></td>
			<td>兴趣爱好:</td>
			<td><input id="business_supplier_link_man_hobbies" style="border:1px solid #95B8E7"/></td>
			<td>邮编:</td>
			<td><input id="business_supplier_link_man_post_Code" style="border:1px solid #95B8E7"/></td>
		</tr>
		<tr>
			<td>业务员:</td>
			<td><input id="business_supplier_link_man_staff" style="border:1px solid #95B8E7"/></td>
			<td>备注:</td>
			<td colspan="2"><input id="business_supplier_link_man_mome" style="border:1px solid #95B8E7;width: 100%;"/></td>
			<td style="text-align: center;">
				<div style="float: left;">
					<a id="business_supplier_link_man_add_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-mini_add'" plain="true">添加</a>
				</div>
				<div class="datagrid-btn-separator"></div>
				<div style="float: left;">
					<a id="business_supplier_link_man_reset_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-undo'" plain="true">重置</a>
				</div>
				<div class="datagrid-btn-separator"></div>
				<div style="float: left;">
					<a id="business_supplier_link_man_delete_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" plain="true">删除</a>
				</div>
			</td>
		</tr>
	</table>
</div>
<div id="business_supplier_link_man_grd"></div>