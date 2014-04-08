package com.radius.invoicing.goodsmanage.service;

import com.radius.base.page.EasyuiSplitPager;
import com.radius.base.utils.JsonUtils;
import com.radius.invoicing.ibatis.model.Goods;

public interface GoodsService {

	/**
	 * 通过条件查询获取easyui的分页对象
	 * @param goods
	 * @return
	 */
	public EasyuiSplitPager<Goods> getGoodsSplitPage(Goods goods);

	/**
	 * 保存商品信息 <br> 1.如果存在,则更新;<br/>2.如果不存在,则添加
	 * @param goods
	 * @return
	 */
	public JsonUtils saveGoodsInfo(Goods goods, String statusCode);

	/**
	 * 更新商品信息
	 * @param goods
	 * @return
	 */
	public JsonUtils updateGoodsInfo(Goods goods, String statusCode);

	/**
	 * 添加商品信息
	 * @param goods
	 * @return
	 */
	public JsonUtils addGoodsInfo(Goods goods, String statusCode);

}