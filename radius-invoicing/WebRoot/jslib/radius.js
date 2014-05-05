/**
 * 命名空间定义
 * @type 
 */
var com={};
com.radius={};
com.radius.datagrid={};
com.radius.datagrid.spec_type={};
/**
 * 格式化相关属性
 * @param {} value
 * @param {} row
 * @param {} index
 * @param {} target_combobox
 * @return {} string
 */
com.radius.datagrid.formatter=function(value,row,index,target_combobox){
	var combobox_data =$(target_combobox).combobox('getData');
	for(var i=0,length=combobox_data.length;i<length;i++){
		if(combobox_data[i].id==value){
			value=combobox_data[i].name;
			break;
		}
	}
	return value;
}

/**
 * 规格信息格式化
 * @param {} value
 * @param {} row
 * @param {} index
 * @param {} target_combobox
 * @return {}
 */
com.radius.datagrid.spec_type.formatter=function(value,row,index,target_combobox){
	var combobox_data =$(target_combobox).combobox('getData');
	for(var i=0,length=combobox_data.length;i<length;i++){
		if(combobox_data[i].specId==value){
			value=combobox_data[i].specName;
			break;
		}
	}
	return value;
}

/**
 * 货币命名空间
 * @type 
 */
com.radius.datagrid.currency={};
/**
 * 货币格式化
 * @param {} value
 * @param {} row
 * @param {} index
 * @return {}
 */
com.radius.datagrid.currency.formatter=function(value,row,index){
	if(value!=undefined&&value!=null&&(value+"").indexOf(".")<=0){
		value=parseInt(value).toFixed(2);
	}
	return value;
}
/**
 * 重置datagrid数据
 * @param {} target
 */
com.radius.datagrid.resetdata=function(target){
	$(target).datagrid('loadData',{ total: 0, rows: []});
}
/**
 * 清空datagrid列表数据
 * @param {} target
 */
com.radius.datagrid.clear=function(target){
	$(target).datagrid('loadData',{ total: 0, rows: []});
}
//------------------combobox包文件处理---------------------------
com.radius.combobox={};

com.radius.combobox.setelement=function(target,method,value){
 $(target).combobox(method,value);
}

//----------------combo 组件包路径----------------------
com.radius.combo={};

com.radius.combo.clear=function(target){
	$(target).combo('clear');
}
