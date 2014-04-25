package com.radius.invoicing.ibatis.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.invoicing.ibatis.dao.InstorageOrderDao;
import com.radius.invoicing.ibatis.model.InstorageOrder;

/**
 * 
 * @author Administrator
 * 描述  入库信息Dao
 */
@Repository
public class InstorageOrderDaoImpl extends BaseIbatisDaoImpl<InstorageOrder> implements InstorageOrderDao {

	private final String SQLMAPNAMESPACE="InstorageOrderSqlMap.";
	
	/***
	 * 通过主键获取入库信息
	 * @param instoreId
	 * @return
	 */
	public InstorageOrder getInstoreOrderById(String instoreId){
		return (InstorageOrder) this.getSqlMapClientTemplate().queryForObject(SQLMAPNAMESPACE+"getInstoreOrderById", instoreId);
	}
	
	/**
	 * 通过条件查询入库信息
	 * @param instoreOrder
	 * @return
	 */
	public List<InstorageOrder> getInstoreOrderCondition(InstorageOrder instoreOrder){
		return this.getListObject(instoreOrder, SQLMAPNAMESPACE+"getInstoreOrderCondition");
	}
	/**
	 * 通过主键查询是否存在入库信息
	 * @param instoreId
	 * @return
	 */
	public Integer getInstoreOrderCountById(String instoreId){
		return (Integer)this.getSqlMapClientTemplate().queryForObject(SQLMAPNAMESPACE+"getInstoreOrderCountById",instoreId);
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
	public boolean updateInstoreOrder(InstorageOrder instoreOrder){
		return this.updateObject(instoreOrder, SQLMAPNAMESPACE+"updateInstoreOrder")==1;
	}
	/**
	 * 批量更新入库信息
	 * @param list
	 */
	public void batchUpdateInstoreOrder(List<InstorageOrder> list){
		this.batchInsertListObject(list, SQLMAPNAMESPACE+"updateInstoreOrder");
	}
	/**
	 * 更新入库信息状态
	 * @param instoreOrder
	 * @return
	 */
	public boolean updateInstoreOrderStatus(InstorageOrder instoreOrder){
		return this.updateObject(instoreOrder, SQLMAPNAMESPACE+"updateInstoreOrder")==1;
	}
	/**
	 * 删除入库信息
	 * @param instoreOrder
	 * @return
	 */
	public boolean deleteInstoreOrderByCondition(InstorageOrder instoreOrder){
		return this.deleteObject(instoreOrder, SQLMAPNAMESPACE+"deleteInstoreOrderByCondition")==1;
	}
	/**
	 * 批量删除入库信息（通过主键）
	 * @param list
	 */
	public void batchDeleteInstoreOrder(List<InstorageOrder> list){
		this.batchDeleteListObject(list, SQLMAPNAMESPACE+"deleteInstoreOrderById");
	}
	
	/**
	 * 通过主键删除入库信息
	 * @param instoreId
	 * @return
	 */
	public boolean deleteInstoreOrderById(String instoreId){
		return this.deleteObject(instoreId, SQLMAPNAMESPACE+"deleteInstoreOrderById")==1;
	}
	
	
}
