/**
 * 
 */
package com.radius.invoicing.ibatis.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.radius.base.dao.ibatis.BaseIbatisDaoImpl;
import com.radius.base.page.Pager;
import com.radius.base.utils.StringUtils;
import com.radius.invoicing.ibatis.dao.GoodsDao;
import com.radius.invoicing.ibatis.model.Goods;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 商品信息
 */
@Repository
@SuppressWarnings("unchecked")
public class GoodsDaoImpl extends BaseIbatisDaoImpl<Goods> implements GoodsDao{

	/**
	 * 获取商品信息
	 * @param goods
	 * @return
	 */
	public Goods getGoods(String goodsId){
		return this.getObjectByCondition(goodsId, "goodsSqlMap.getGoods");
	}
	/**
	 * 保存商品信息
	 * @param goods
	 */
	public  void insert(Goods goods){
		this.insertObject(goods, "goodsSqlMap.insert");
	}
	/**
	 * 更新商品信息
	 * @param goods
	 * @return
	 */
	public boolean updateGoods(Goods goods){
		return this.updateObject(goods, "goodsSqlMap.updateGoods")==1;
	}
	
	/**
	 * 删除商品信息
	 * @param goods
	 */
	public void deleteGoods(Goods goods){
		this.deleteObject(goods, "goodsSqlMap.deleteGoods");
	}
	
	
	/**
	 * 通过分页SQL获取分页对象
	 * @param pageNo
	 * @param countSQL
	 * @param splitPageSQL
	 * @return
	 */
	public Pager<Goods> getGoodsSplitPageBySQL(int pageNo,String countSQL,String splitPageSQL){
		List<Goods> list=this.getSqlMapClientTemplate().queryForList("goodsSqlMap.getGoodsSplitPageBySQL",splitPageSQL);
		Integer rowCount=(Integer)this.getSqlMapClientTemplate().queryForObject("goodsSqlMap.getGoodsSplitPageCountSQL", countSQL);
		Pager<Goods> page=new Pager<Goods>(pageNo, rowCount, list);
		return page;
	}
	
	/**
	 * 通过条件查询
	 * @param goods
	 * @return
	 */
	public List<Goods> getGoodsByCondition(Goods goods){
		return this.getSqlMapClientTemplate().queryForList("goodsSqlMap.getGoodsByCondition",goods);
	}
	/**
	 * 通过供应商编号与商品信息进行查询
	 * @param goods
	 * @return
	 */
	public List<String> getGoodsInfoBySupplierAndGoods(Goods goods){
		return this.getSqlMapClientTemplate().queryForList("goodsSqlMap.getGoodsInfoBySupplierAndGoods", goods);
	}
	
	public String getGoodsMaxId(){
		Integer id=(Integer)this.getSqlMapClientTemplate().queryForObject("goodsSqlMap.getGoodsMaxId");
		return StringUtils.getSpecifyStringByLengthBefore((id.intValue()+1)+"", 5, "0");
	}
}
