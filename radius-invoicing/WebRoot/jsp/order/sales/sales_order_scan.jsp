<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String path = request.getContextPath();%>
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
		 $("#sales_order_scan_res").text(files.join(","));
	 }
 });
}

//easyui 对象变量
 var sales_order_scan_quantity=null;

$(function(){
	//合同扫描件数量
	sales_order_scan_quantity=$('#sales_order_scan_quantity').numberspinner({
		min: 0,
		max: 10,
		editable: false
	});
	sales_order_scan_quantity.numberspinner('setValue',0);//设置初始数量为0
	
	//添加按钮
	$('#sales_order_scan_grd_add_btn').on('click',function(){
		var files=$("#sales_order_scan_res").text();//获取已经上传好的文件名称
		var rows=sales_order_scan_grd.datagrid('getRows');//获取当前页面的所有行记录
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
		if(parseInt($('#sales_order_scan_quantity').val())>parseInt($('#sales_order_scan_code').val())){
		}**/
		if(!isExist){//不存在相同的内容,则将其存放在对应的地方
			//1.将扫描件数据添加到memcache中
			//2.将扫描件信息添加到datagrid中  sales_order_scan_grd
			addContractScan2Cache();
		}
	});
	//删除按钮
    $('#sales_order_scan_grd_delete_btn').on('click',function(){
    	//1.将扫描件数据移除memcache中
    	//2.将datagrid中的数据进行移除 
    	//3.暂时不考虑其他已经保存到数据库中的数据修改
    	var rows=sales_order_scan_grd.datagrid('getSelections');
 		if(rows.length>0){
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
								contractId:$('#sales_order_purchase_base_id').val(),//合同编号
								contractType:sales_order_base_contract_type.val(),//合同类型
								memo:array.join(',')
							},
							success:function (data){//2.将dategrid的行数据进行删除操作
								if(data&&data.success){
									var rows=sales_order_scan_grd.datagrid('getSelections');
									for(var i=0;i<rows.length;i++){
										var index=sales_order_scan_grd.datagrid('getRowIndex',rows[i]);
										sales_order_scan_grd.datagrid('deleteRow',index);
										sales_order_scan_grd.datagrid('acceptChanges');//接受改变
									}
									//如果当前行数为0时，则将扫描件数量输入框可用
									rows=sales_order_scan_grd.datagrid('getRows');
									console.info(rows);
									if(rows.length==0){//表示datagrid中已经没有数据
										sales_order_scan_quantity.numberspinner('enable');
									}
								}
							},
							error: function(data){
								console.info(data);
								$.messager.alert('提示','处理缓存失败...',error);
							}
						});
					}						
				}
			});
 		}else{
 			$.messager.alert('提示','请选择待删除的行信息','error');
 		}
    });
});
//将合同扫描件添加到缓存中
function addContractScan2Cache(){
	$.ajax({
		url:'${path}/contract/manager/salescontract/contract_scan_info_memcache.html',//请求地址
		method:'POST',
		data:{
			contractId:$('#sales_order_clause_contract_id').val(),//合同编号
			contractType:sales_order_base_contract_type.val(),//合同类型
			scanCode:$('#sales_order_scan_code').val(),//文件编码
			quantity:$('#sales_order_scan_quantity').val(),//文件数量
			fileName:$('#sales_order_scan_res').text()//文件名称
		},
		success:function(data){
			if(data&&data.success){//表示通讯成功
				//已经成功添加合同扫描件到内存中
				contractSalesScanGrdAddRow(data.child);
			}
		},
		error:function(data){
			console.info(data);
		}
	});
}
/**
* 添加扫描件列表信息
* @param filepath 表示文件待访问路径
**/
function contractSalesScanGrdAddRow(filepath){
	var path=null;
	if(filepath&&filepath.length==0){
		console.info(filepath);
		path='${path}/image/'+$('#sales_order_scan_res').text();
	}else{
		path=filepath+$('#sales_order_scan_res').text();
	}
	//1.在datagrid中最后面一行中添加数据
	sales_order_scan_grd.datagrid('appendRow',{
			code:$('#sales_order_scan_code').val(),//文件编码
			fileOrder:$('#sales_order_scan_quantity').val()+"-"+$('#sales_order_scan_code').val(),//文件顺序
			scanFileName:$('#sales_order_scan_res').text(),//文件名称
			open:path//文件访问路径
	});
	sales_order_scan_grd.datagrid('acceptChanges');
	//2.将扫描件数量输入框进行锁定
	sales_order_scan_quantity.numberspinner('disable');
	var fileName=$('#sales_order_scan_res').text();
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

//-->
</script>
<table class="table" style="width: 100%;">
	<tr>
		<th>扫描件数量</th>
		<td colspan="5" style="text-align: left;">
			<input id="sales_order_scan_quantity"/>
		</td>
	</tr>
	<tr>
		<th>扫描件编码</th>
		<td><input id="sales_order_scan_code"/></td>
		<th>选择文件</th>
		<td colspan="2">
			<a class="easyui-linkbutton" plain="true" href="javascript:makerUpload(false)">上传文件</a> 
		    <%--
		    <a class="easyui-linkbutton" plain="true" href="javascript:makerUpload(true)">分割文件上传</a>
		    --%>
		    <div id="sales_order_scan_res"></div>
		</td>
		<td>
			<a id="sales_order_scan_grd_add_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" plain="true">加入(A)</a>
			<a id="sales_order_scan_grd_delete_btn" href="#" class="easyui-linkbutton" style="margin-left:20px;" data-options="iconCls:'icon-remove'" plain="true">删除(D)</a>
		</td>
	</tr>
</table>
<div id="sales_order_scan_grd"><%--合同扫描件--%></div>