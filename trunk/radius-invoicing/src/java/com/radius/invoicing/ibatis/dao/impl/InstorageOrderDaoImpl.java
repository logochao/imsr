package com.radius.invoicing.ibatis.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.invoicing.ibatis.model.InstorageOrder;

/**
 * 
 * @author Administrator
 * 描述  入库信息Dao
 */
@Repository
public class InstorageOrderDaoImpl extends BaseIbatisDaoImpl<InstorageOrder> {

	private final String SQLMAPNAMESPACE="instorageOrderSqlMap.";
	
	/***
	 * 通过主键获取入库信息
	 * @param instoreId
	 * @return
	 */
	public InstorageOrder getInstorageOrderById(String instoreId){
		return (InstorageOrder) this.getSqlMapClientTemplate().queryForObject(SQLMAPNAMESPACE+"getInstorageOrderById", instoreId);
	}
	
	/**
	 * 通过条件查询入库信息
	 * @param instoreOrder
	 * @return
	 */
	public List<InstorageOrder> getInstorageOrderCondition(InstorageOrder instoreOrder){
		return this.getListObject(instoreOrder, SQLMAPNAMESPACE+"getInstorageOrderCondition");
	}
	/**
	 * 通过主键查询是否存在入库信息
	 * @param instoreId
	 * @return
	 */
	public Integer getInstorageOrderCountById(String instoreId){
		return (Integer)this.getSqlMapClientTemplate().queryForObject(SQLMAPNAMESPACE+"getInstorageOrderCountById",instoreId);
	}
	
	/**
	 * 保存入库信息
	 * @param instoreOrder
	 */
	public void insertInstoreOrder(InstorageOrder instoreOrder){
		this.insertObject(instoreOrder, SQLMAPNAMESPACE+"insert");
	}
	/**
	 * 批量保存入库信息
	 * @param list
	 */
	public void batchInsertInstoreOrder(List<InstorageOrder> list){
		this.batchInsertListObject(list, SQLMAPNAMESPACE+"insert");
	}
	/**
	 * 更新入库信息
	 * @param instoreOrder
	 * @return
	 */
	public boolean updateInstorageOrder(InstorageOrder instoreOrder){
		return this.updateObject(instoreOrder, SQLMAPNAMESPACE+"updateInstorageOrder")==1;
	}
	/**
	 * 批量更新入库信息
	 * @param list
	 */
	public void batchUpdateInstorageOrder(List<InstorageOrder> list){
		this.batchInsertListObject(list, SQLMAPNAMESPACE+"updateInstorageOrder");
	}
	/**
	 * 更新入库信息状态
	 * @param instoreOrder
	 * @return
	 */
	public boolean updateInstoreOrderStatus(InstorageOrder instoreOrder){
		return this.updateObject(instoreOrder, SQLMAPNAMESPACE+"updateInstorageOrderStatus")==1;
	}
	/**
	 * 删除入库信息
	 * @param instoreOrder
	 * @return
	 */
	public boolean deleteInstorageOrderByCondition(InstorageOrder instoreOrder){
		return this.deleteObject(instoreOrder, SQLMAPNAMESPACE+"deleteInstorageOrderByCondition")==1;
	}
	/**
	 * 批量删除入库信息（通过主键）
	 * @param list
	 */
	public void batchDeleteInstorageOrder(List<InstorageOrder> list){
		this.batchDeleteListObject(list, SQLMAPNAMESPACE+"deleteInstorageOrderByCondition");
	}
	
	/**
	 * 通过主键删除入库信息
	 * @param instoreId
	 * @return
	 */
	public boolean deleteInstorageOrderById(String instoreId){
		return this.deleteObject(instoreId, SQLMAPNAMESPACE+"deleteInstorageOrderById")==1;
	}
	
	
}
