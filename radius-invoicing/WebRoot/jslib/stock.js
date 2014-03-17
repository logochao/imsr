/**
 * 进校存项目中使用到的一些公共方法
 **/
 /**
  * 将格式化后的添加到内存中
  * @param {} memcached_url
  * @param {} memcached_data
  */
 function addFormatterData2Memecached(memcached_url,memcached_data){
 	$.ajax({
		url:memcached_url,//缓存地址
		method:'POST',//请求方式
		data:memcached_data,
		success:function (data){
			if(!data.success){//请求缓存失败的提示信息
				$.messager.show({
					title:'提示',
					msg:data.message,
					timeout:5000,
					showType:'slide'
				});
			}
			console.info(data);
		},
		error:function(data){
			$.messager.show({
				title:'提示',
				msg:'与后台通讯失败..',
				timeout:5000,
				showType:'slide'
			});
		}
	});
 }
 /**
  * 添加目标datagrid的数据行
  * @param {} target_grid 目标对象
  * @param {} row_data   待添加的数据
  * @param {} row_index  添加在datagrid的哪行
  */
 function addTargetDataGridRowData(target_grid,row_data,row_index){
 	if(row_index==null||row_index==undefined){
 		row_index=0;
 	}
 	$(target_grid).datagrid('insertRow',{
		index:row_index,
		row:row_data
	});
 }
 
 /**
  * 更新目标datagrid 数据行
  * @param {} target_grid 目标对象datagrid 
  * @param {} row_data    待更新的行数据
  * @param {} row_index   待更新的datagrid行
  */
 function updateTargetDataGridRowData(target_grid,row_data,row_index){
 	if(row_index==null||row_index==undefined){
 		row_index=0;
 	}
 	$(target_grid).datagrid('updateRow',{
		index:row_index,
		row:row_data
	});
 }
 
 
 /**
 * 数据数字格式化
 * @param {} numberic 带格式化得数字或是字符
 * @return 
 **/
function numbericCurrentyFormatter(numberic){
	//1.利用js交易是否为数字
	if(numberic==null||numberic==undefined){
		return '0.00';
	}else{
		numberic=numberic+"";
		if(numberic.indexOf('.')>0){
			return numberic;
		}else{
			return parseInt(numberic).toFixed(2);
		}
	}
}
/**
 * 异步提交表单数据
 * @param {} ajax_url 异步请求地址
 * @param {} ajax_data json格式
 */
function commitForm2Ajax(ajax_url,ajax_data){
	$.ajax({
			url:ajax_url,//保存销售合同请求地址
			method:'POST',
			data:ajax_data,
			success:function(data){//通讯成功
				if(data&&data.success){
					$.messager.show({
						title:'提示',
						msg:data.message,
						timeout:5000,
						showType:'slide'
					});
				}
			},
			error:function(r){//操作失败
				$.messager.alert('提示','访问服务发生异常....','error');
			}
	});
}