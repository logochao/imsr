<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String path = request.getContextPath();%>
	<script type="text/javascript" src="<%=path%>/jslib/plupload/plupload.js"></script>
	<script type="text/javascript" src="<%=path%>/jslib/plupload/zh_CN.js"></script>
<script type="text/javascript">
<!--
function Uploader(chunk,callBack){
	var addWin = $('<div style="overflow: hidden;"/>');
	var upladoer = $('<iframe/>');
	upladoer.attr({'src':'<%=path%>/upload_common.jsp?chunk='+chunk,width:'100%',height:'100%',frameborder:'0',scrolling:'no'});
	addWin.window({
		title:"上传文件",
		height:350,
		width:550,
		minimizable:false,
		modal:true,
		collapsible:false,
		maximizable:false,
		resizable:false,
		content:upladoer,
		onClose:function(){
			var fw = GetFrameWindow(upladoer[0]);
			var files = fw.files;
			$(this).window('destroy');
			callBack.call(this,files);
		},
		onOpen:function(){
			var target = $(this);
			setTimeout(function(){
				var fw = GetFrameWindow(upladoer[0]);
				fw.target = target;
			},100);
		}
	});
}

/**
 * 根据iframe对象获取iframe的window对象
 * @param frame
 * @returns {Boolean}
 */
function GetFrameWindow(frame){
	return frame && typeof(frame)=='object' && frame.tagName == 'IFRAME' && frame.contentWindow;
}
 
function makerUpload(chunk){
 Uploader(chunk,function(files){
	 if(files && files.length>0){
		 $("#purchase_contract_scan_res").text(files.join(","));
	 }
 });
}

var purchase_contract_scan_quantity = null;//合同扫描件数量
$(function(){
 //-------------------------------------------采购合同扫描件列表-----------------------------------------
	//合同扫描件数量
	purchase_contract_scan_quantity=$('#purchase_contract_scan_quantity').numberspinner({
		min: 0,
		max: 10,
		editable: false
	});
	purchase_contract_scan_quantity.numberspinner('setValue',0);//设置初始数量为0
	
	//---------------------------------业务处理------------------------------------------------
	//添加合同扫描件按钮
	$('#purchase_contract_scan_grd_add_btn').on('click',function(){
		if($('#purchase_contract_base_id').val().length<=0){
 			$.messager.alert('提示','请获取采购合同编号,再进行操作...','error');
 			return ;
 		}
		
		var files=$("#purchase_contract_scan_res").text();//获取已经上传好的文件名称
		var rows=purchase_contract_scan_contract_accessory_grd.datagrid('getRows');//获取当前页面的所有行记录
		var isExist=false;
		if(rows.length>0){
			for(var i=0;i<rows.length;i++){
				var filename=rows[i].scanFileName;
				if(files.indexOf(filename)>-1){
					isExist=true;
					break;
				}
			}
		}
		/**暂时对文件编码不处理
		if(parseInt($('#purchase_contract_scan_quantity').val())>parseInt($('#purchase_contract_scan_code').val())){
		}**/
		if(!isExist){//不存在相同的内容,则将其存放在对应的地方
			//1.将扫描件数据添加到memcache中
			//2.将扫描件信息添加到datagrid中  purchase_contract_scan_contract_accessory_grd
			addContractScan2Cache();
		}
	});
	
	//删除合同扫描件按钮
	$('#purchase_contract_scan_grd_delete_btn').on('click',function(){
		//1.将扫描件数据移除memcache中
    	//2.将datagrid中的数据进行移除 
    	//3.暂时不考虑其他已经保存到数据库中的数据修改
    	if($('#purchase_contract_base_id').val().length<=0){
 			$.messager.alert('提示','请获取采购合同编号,再进行操作...','error');
 			return ;
 		}
    	var rows=purchase_contract_scan_contract_accessory_grd.datagrid('getSelections');
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
					array.push(rows[i].scanCode);
				}
				if(array.length>0){
					$.ajax({
						url:'${path}/contract/manager/salescontract/contract_scan_info_remove_memcache.html',
						method:'POST',
						data:{
							contractId:$('#purchase_contract_base_id').val(),//合同编号
							contractType:purchase_contract_base_contract_type.val(),//合同类型
							memo:array.join(',')
						},
						success:function (data){//2.将dategrid的行数据进行删除操作
							if(data&&data.success){
								var rows=purchase_contract_scan_contract_accessory_grd.datagrid('getSelections');
								for(var i=0;i<rows.length;i++){
									var index=purchase_contract_scan_contract_accessory_grd.datagrid('getRowIndex',rows[i]);
									purchase_contract_scan_contract_accessory_grd.datagrid('deleteRow',index);
									purchase_contract_scan_contract_accessory_grd.datagrid('acceptChanges');//接受改变
								}
								//如果当前行数为0时，则将扫描件数量输入框可用
								rows=purchase_contract_scan_contract_accessory_grd.datagrid('getRows');
								console.info(rows);
								if(rows.length==0){//表示datagrid中已经没有数据
									purchase_contract_scan_quantity.numberspinner('enable');
								}
							}
						},
						error: function(data){
							$.messager.alert('提示','访问服务发生异常....','error');
						}
					});
				}						
			}
		});
	});
});
//将合同扫描件添加到缓存中
function addContractScan2Cache(){
	$.ajax({
		url:'${path}/contract/manager/purchaseContract/contract_scan_info_memcached.html',//请求地址
		method:'POST',
		data:{
			contractId:$('#purchase_contract_base_id').val(),//合同编号
			contractType:purchase_contract_base_contract_type.val(),//合同类型
			scanCode:$('#purchase_contract_scan_code').val(),//文件编码
			quantity:$('#purchase_contract_scan_quantity').val(),//文件数量
			fileName:$('#purchase_contract_scan_res').text()//文件名称
		},
		success:function(data){
			if(data&&data.success){//表示通讯成功
				//已经成功添加合同扫描件到内存中
				purchaseContractScanGrdAddRow(data.child);
			}
		},
		error:function(data){
			$.messager.alert('提示','访问服务发生异常....','error');
		}
	});
}
/**
* 添加扫描件列表信息
* @param filepath 表示文件待访问路径
**/
function purchaseContractScanGrdAddRow(filepath){
	var path=null;
	if(filepath&&filepath.length==0){
		path='${path}/image/'+$('#purchase_contract_scan_res').text();
	}else{
		path=filepath+$('#purchase_contract_scan_res').text();
	}
	//1.在datagrid中最后面一行中添加数据
	purchase_contract_scan_contract_accessory_grd.datagrid('appendRow',{
			code:$('#purchase_contract_scan_code').val(),//文件编码
			fileOrder:$('#purchase_contract_scan_quantity').val()+"-"+$('#purchase_contract_scan_code').val(),//文件顺序
			scanFileName:$('#purchase_contract_scan_res').text(),//文件名称
			open:path//文件访问路径
	});
	purchase_contract_scan_contract_accessory_grd.datagrid('acceptChanges');
	//2.将扫描件数量输入框进行锁定
	purchase_contract_scan_quantity.numberspinner('disable');
	var fileName=$('#purchase_contract_scan_res').text();
	var stop=fileName.indexOf('.');
	var itme=fileName.substring(0,stop);
	$("a").each(function(){
		if($(this).attr('id')==itme){
			//链接添加图片渲染方法
			$(this).imgPreview({
 				containerID: 'imgPreviewWithStyles',
			    srcAttr: 'rel',
			    imgCSS: {
			        //height: 200
			    },
			    onShow: function(link){
			        $('<span>' + link.href + '</span>').appendTo(this);
			    },
			    onHide: function(link){
			        $('span', this).remove();
			    }
 			});
 			//渲染指定对象
			$.parser.parse($(this).parent());
		}
	});
}

function clearPurchaseContractScanTab(){
 $('#purchase_contract_scan_quantity').val('');
 $('#purchase_contract_scan_code').val('');	
 $('#purchase_contract_scan_res').val('');	
 com.radius.datagrid.clear(purchase_contract_scan_contract_accessory_grd);
}
/**
 *通过采购合同编号获取采购合同附件列表
 *@params{} row_data 采购合同列表
 **/
function setPurchaseContractScan(row_data){
	var contract_id =row_data.id;
	purchase_contract_scan_contract_accessory_grd.datagrid('loadData',{ total: 0, rows: []});
	//1.将缓存中的数据进行删除
	var memcached_url='${path}/contract/manager/salescontract/contract_scan_info_remove_memcache.html';
	var memcached_data={
		contractId:contract_id,
		delete:true
	};
	removeFormatterData2Memecached(memcached_url,memcached_data);
	//2.根据合同编号获取销售合同明细列表
	$.ajax({
		url:'${path}/contract/manager/salescontract/contract_scan_list.html',
		method:'POST',
		data:{contractId:contract_id},
		success:function(r){
			if(r&&r.total>0){
				$.each(r.rows,function(index,d){
					//遍历销售合同支付明细
					//1.获取格式化数据并设置到表格里
						var row_data = purchaseContractScanGrdFormatter(d);
						addTargetDataGridRowData($('#purchase_contract_scan_contract_accessory_grd'),row_data,0);
						$('#purchase_contract_scan_contract_accessory_grd').datagrid('acceptChanges');
						//2.将数据添加到memcahed中
						var memcached_url = '${path}/contract/manager/salescontract/contract_scan_info_memcache.html';//销售合同扫描列表
						if(d.validityDate!=null&&d.validityDate!=undefined){
							d.validityDate=parseDate(d.validityDate);
						}
						addFormatterData2Memecached(memcached_url,d);
				});
			}
		},error:function(r){
			$.messager.alert('提示','访问服务发生异常....','error');
		}
	});
}

function purchaseContractScanGrdFormatter(_data){
	var json={
		code:_data.scanCode,
		scanFileName:_data.fileName,
		fileOrder:_data.fileOrder,
		open:_data.filePath
	};
	
	return json;
}
//-->
</script>
<table class="table" style="width: 100%;margin-top: 10px;">
	<tr>
		<th>扫描件数量</th>
		<td colspan="5" style="text-align: left;border:1px solid #95B8E7;">
			<input id="purchase_contract_scan_quantity"/>
		</td>
	</tr>
	<tr>
		<th>扫描件编码</th>
		<td><input id="purchase_contract_scan_code" style="border:1px solid #95B8E7;"/></td>
		<th>选择文件</th>
		<td colspan="2">
			<a class="easyui-linkbutton" plain="true" href="javascript:makerUpload(false)">上传文件</a> 
		    <div id="purchase_contract_scan_res"></div>
		</td>
		<td>
			<a id="purchase_contract_scan_grd_add_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" plain="true">加入(A)</a>
			<a id="purchase_contract_scan_grd_delete_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-remove'" plain="true">删除(D)</a>
		</td>
	</tr>
</table>
<jsp:include flush="true" page="purchase_contract_scan_grd.jsp"></jsp:include>