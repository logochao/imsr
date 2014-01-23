/**
 * 
 */
package com.radius.base.page;

import java.util.List;


/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明
 */
public class EasyuiSplitPager<E> {

	private Integer total=0;
	private List<E> rows;
	public List<E> getRows() {
		return rows;
	}
	public void setRows(List<E> rows) {
		this.rows = rows;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
}
