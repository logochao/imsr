package com.radius.base.dao.ibatis;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientCallback;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapExecutor;
import com.radius.base.BaseEntity;
import com.radius.base.dao.BaseIbatisDao;
import com.radius.base.page.Pager;


public class BaseIbatisDaoImpl<E extends BaseEntity> extends SqlMapClientDaoSupport implements BaseIbatisDao<E>{

	/**
	 * 如有特殊的需求如对多数据库进行操作 则每一个数据库都定义一个dao类  并都添加这个方法 在方法上面
	 * <code>@Resouce("sqlMapclient")具体的具体设置</code>
	 * @param sqlMapClient
	 */
	public void setSqlMapClientBase(SqlMapClient sqlMapClient) {
		super.setSqlMapClient(sqlMapClient);
	}
	/**
	 * 通过条件查询获取数据已map的形式返回 map中的键值columName这个对应的内容为正
	 * @param params
	 * @param statement
	 * @param columName 查询语句中出现的主键或是能标志唯一行的一个内容
	 * @return
	 */
	public Map getSelectObjectMap(Map params,String statement,String columName){
		return this.getSqlMapClientTemplate().queryForMap(statement, params, columName);
	}
	
	/**
	 * 通过实体对象进行分页查询
	 * @param e
	 * @param countKey
	 * @param selectKey
	 * @return
	 */
	public Pager<E> getPagerListObject(E e,String countKey,String selectKey){
		
		//1.获取整个的查询总数
		Integer rowCount= getCountByCondition(e, countKey);
		//2.获=取查询的数据
		List<E> list=getListObject(e, selectKey);
		Pager<E> page=new Pager<E>(e.getPageNo(), rowCount, list);
		return page;
	}
	/**
	 * 通过Map对象进行分页查询
	 * @param map
	 * @param countKey
	 * @param selectKey
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Pager getPagerListObject(Map map,String countKey,String selectKey,int pageNo){
		
		//1.获取整个的查询总数
		Integer rowCount= getCountByCondition(map, countKey);
		//2.获=取查询的数据
		List list=getListObject(map, selectKey);
		Pager page=new Pager(pageNo, rowCount, list);
		return page;
	}
	/**
	 * 通过map对象添加查询条件 
	 * @param map
	 * @param statementName 对应namespace.id来判断为一个key值
	 * @return
	 */
	public List getListObject(Map map,String statementName){
		return this.getSqlMapClientTemplate().queryForList(statementName, map);
	}
	/**
	 * 通过Map条件查询符合要求的记录个数
	 * @param map
	 * @param statementName 对应namespace.id来判断为一个key值
	 * @return
	 */
	public Integer getCountByCondition(Map map,String statementName){
		return (Integer)this.getSqlMapClientTemplate().queryForObject(statementName,map);
	}
	
	/**
	 * 通过实体对象查询符合要求的记录列表
	 * @param e
	 * @param statementName
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<E> getListObject(E e,String statementName){
		return this.getSqlMapClientTemplate().queryForList(statementName, e);
	}
	/**
	 * 通过实体对象查询符合要求的记录个数
	 * @param e
	 * @param statementName 对应namespace.id来判断为一个key值
	 * @return
	 */
	public Integer getCountByCondition(E e,String statementName){
		return (Integer)this.getSqlMapClientTemplate().queryForObject(statementName,e);
	}
	/**
	 * 保存对象
	 * @param e
	 * @param statementName 对应namespace.id来判断为一个key值
	 */
	public void insertObject(E e,String statementName){
		this.getSqlMapClientTemplate().insert(statementName, e);
	}
	/**
	 * 通过批处理进行保存对象
	 * @param list
	 * @param statementName
	 */
	@SuppressWarnings("unchecked")
	public void batchInsertListObject(final List<E> list,final String statementName){
		this.getSqlMapClientTemplate().execute(new SqlMapClientCallback(){
			public Object doInSqlMapClient(SqlMapExecutor executor) throws SQLException {
				int i=1;
				executor.startBatch();
				for(E e:list){
					insertObject(e, statementName);
					if(i%100==0){
						executor.executeBatch();
					}
					i++;
				}
				executor.executeBatch();
				return null;
			}
		});
	}
	
	/**
	 * 更新信息
	 * @param e
	 * @param statementName
	 * @return 
	 */
	public int updateObject(E e,String statementName){
		return this.getSqlMapClientTemplate().update(statementName, e);
	}
	/**
	 * 批量更新信息
	 * @param list
	 * @param statementName
	 */
	@SuppressWarnings("unchecked")
	public void updateListObject(final List<E> list,final String statementName){
		this.getSqlMapClientTemplate().execute(new SqlMapClientCallback(){
			public Object doInSqlMapClient(SqlMapExecutor executor) throws SQLException {
				executor.startBatch();
				int i=1;
				for(E e:list){
					updateObject(e, statementName);
					if(i%100==0){
						executor.executeBatch();
					}
					i++;
				}
				executor.executeBatch();
				return null;
			}
		});
	}
	/**
	 * 删除对象
	 * @param e
	 * @param statementName
	 * @return
	 */
	public int  deleteObject(E e,String statementName){
		return this.getSqlMapClientTemplate().delete(statementName, e);
	}
	/**
	 * 通过批处理删除对象
	 * @param list
	 * @param statementName
	 */
	@SuppressWarnings("unchecked")
	public void batchDeleteListObject(final List<E> list,final String statementName){
		this.getSqlMapClientTemplate().execute(new SqlMapClientCallback(){
			public Object doInSqlMapClient(SqlMapExecutor executor) throws SQLException {
				executor.startBatch();
				int i=1;
				for(E e:list){
					deleteObject(e, statementName);
					if(i%100==0){
						executor.executeBatch();
					}
					i++;
				}
				executor.executeBatch();
				return null;
			}
		});
	}
}
