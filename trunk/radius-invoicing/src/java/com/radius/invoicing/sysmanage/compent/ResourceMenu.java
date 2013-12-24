package com.radius.invoicing.sysmanage.compent;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.radius.invoicing.ibatis.model.Resource;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
@Component
public class ResourceMenu {

	
	public String getResouceMenuJsonManager(List<Resource> list,boolean icon){
		StringBuffer bf=new StringBuffer("[");
		for(Resource r:list){
			ResouceJson(r, bf, icon);
		}
		bf.deleteCharAt(bf.length()-1);
		bf.append("]");
		return bf.toString();
		
	}
	
	private void ResouceJson(Resource r,StringBuffer bf,boolean icon){
		StringBuffer b=new StringBuffer();
		b.append("{\"attributes\":{\"target\":\"\",\"url\":\"").append(r.getUrl()==null?"":r.getUrl()).append("\"},");
		b.append("\"state\":\"closed\",");
		if(icon){
			b.append("\"iconCls\":\"").append(r.getIcon()).append("\",");
		}
		b.append("\"id\":\"").append(r.getId()).append("\",");
		if(r.getPId()!=0)
			b.append("\"pid\":\"").append(r.getPId()).append("\",");
		b.append("\"text\":\"").append(r.getLabelName()).append("\"},");
		bf.append(b);
	}
	
	/**
	 * 获取菜单资源
	 * @param list
	 * @return
	 */
	public String getResoureMenuJson(List<Resource> list,boolean icon){
		StringBuffer bf=new StringBuffer("[");
		for(Resource r:list){
			loopResourceMenu(bf,r,icon);
		}
		bf.deleteCharAt(bf.length()-1);
		bf.append("]");
		return bf.toString();
	}
	
	private void loopResourceMenu(StringBuffer b,Resource parent,boolean icon){
		StringBuffer sf=new StringBuffer("{");
//		getResourceMenu(parent, sf, isopen, icon, parent.isExistChild());
		if(parent.isExistChild()){
			getResourceMenu(parent, sf, icon, parent.isExistChild());
			for(Resource child:parent.getChildResource()){
				loopResourceMenu(sf,child, icon);
			}
			sf.deleteCharAt(sf.length()-1);
			sf.append("]");
		}else{
			getResourceMenu(parent, sf, icon, parent.isExistChild());
		}
		sf.append("},");
		b.append(sf);
	}
	
	
	private void getResourceMenu(Resource r,StringBuffer bf,boolean icon,boolean isChild){
		bf.append("\"id\":").append(r.getId()).append(",");
		if(icon){
			bf.append("\"iconCls\":\"").append(r.getIcon()).append("\",");
		}
		bf.append("\"pid\":\"").append(r.getPId()).append("\",");
		bf.append("\"resourcetype\":\"").append(r.getResourceType().getTypeName()).append("\",");
		bf.append("\"description\":\"").append(r.getRemark()).append("\",");
		bf.append("\"attributes\":{\"target\":\"\",");
		bf.append("\"url\":\"").append(r.getUrl()==null?"":r.getUrl()).append("\"},");
		bf.append("\"text\":\"").append(r.getLabelName()).append("\"");
		
		if(isChild){
			bf.append(",\"state\":\"closed\"");
			bf.append(",\"children\":[");
		}
		
		
	}
	/**
	 * 对菜单进行树形排序
	 * @param list 必须进行排序
	 * @return
	 */
	public List<Resource> resourceTreeOrderBy(List<Resource> list){// 
		List<Resource> menuList=new ArrayList<Resource>();
		for(Resource r:list){
			if(r.getPId()==0){
				menuList.add(r);
				resourceTreeOrderByLoop(list, r);
			}
		}
		return menuList;
	}
	/**
	 * 
	 * @param list
	 * @param parent
	 */
	private void resourceTreeOrderByLoop(List<Resource> list,Resource parent){
		for(Resource child:list){
			if(child.getPId()==parent.getId()){//判断节点的是否为当前节点的子节点
				parent.setExistChild(true);
				parent.addResource(child);
				resourceTreeOrderByLoop(list, child);
			}
		}
	}
}
