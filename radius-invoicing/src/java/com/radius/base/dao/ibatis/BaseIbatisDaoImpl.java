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
	 * ���������������Զ����ݿ���в��� ��ÿһ�����ݿⶼ����һ��dao��  �������������� �ڷ�������
	 * <code>@Resouce("sqlMapclient")����ľ�������</code>
	 * @param sqlMapClient
	 */
	public void setSqlMapClientBase(SqlMapClient sqlMapClient) {
		super.setSqlMapClient(sqlMapClient);
	}
	/**
	 * ͨ��������ѯ��ȡ������map����ʽ���� map�еļ�ֵcolumName�����Ӧ������Ϊ��
	 * @param params
	 * @param statement
	 * @param columName ��ѯ����г��ֵ����������ܱ�־Ψһ�е�һ������
	 * @return
	 */
	public Map getSelectObjectMap(Map params,String statement,String columName){
		return this.getSqlMapClientTemplate().queryForMap(statement, params, columName);
	}
	
	/**
	 * ͨ��ʵ�������з�ҳ��ѯ
	 * @param e
	 * @param countKey
	 * @param selectKey
	 * @return
	 */
	public Pager<E> getPagerListObject(E e,String countKey,String selectKey){
		
		//1.��ȡ�����Ĳ�ѯ����
		Integer rowCount= getCountByCondition(e, countKey);
		//2.��=ȡ��ѯ������
		List<E> list=getListObject(e, selectKey);
		Pager<E> page=new Pager<E>(e.getPageNo(), rowCount, list);
		return page;
	}
	/**
	 * ͨ��Map������з�ҳ��ѯ
	 * @param map
	 * @param countKey
	 * @param selectKey
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Pager getPagerListObject(Map map,String countKey,String selectKey,int pageNo){
		
		//1.��ȡ�����Ĳ�ѯ����
		Integer rowCount= getCountByCondition(map, countKey);
		//2.��=ȡ��ѯ������
		List list=getListObject(map, selectKey);
		Pager page=new Pager(pageNo, rowCount, list);
		return page;
	}
	/**
	 * ͨ��map������Ӳ�ѯ���� 
	 * @param map
	 * @param statementName ��Ӧnamespace.id���ж�Ϊһ��keyֵ
	 * @return
	 */
	public List getListObject(Map map,String statementName){
		return this.getSqlMapClientTemplate().queryForList(statementName, map);
	}
	/**
	 * ͨ��Map������ѯ����Ҫ��ļ�¼����
	 * @param map
	 * @param statementName ��Ӧnamespace.id���ж�Ϊһ��keyֵ
	 * @return
	 */
	public Integer getCountByCondition(Map map,String statementName){
		return (Integer)this.getSqlMapClientTemplate().queryForObject(statementName,map);
	}
	
	/**
	 * ͨ��ʵ������ѯ����Ҫ��ļ�¼�б�
	 * @param e
	 * @param statementName
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<E> getListObject(E e,String statementName){
		return this.getSqlMapClientTemplate().queryForList(statementName, e);
	}
	/**
	 * ͨ��ʵ������ѯ����Ҫ��ļ�¼����
	 * @param e
	 * @param statementName ��Ӧnamespace.id���ж�Ϊһ��keyֵ
	 * @return
	 */
	public Integer getCountByCondition(E e,String statementName){
		return (Integer)this.getSqlMapClientTemplate().queryForObject(statementName,e);
	}
	/**
	 * �������
	 * @param e
	 * @param statementName ��Ӧnamespace.id���ж�Ϊһ��keyֵ
	 */
	public void insertObject(E e,String statementName){
		this.getSqlMapClientTemplate().insert(statementName, e);
	}
	/**
	 * ͨ����������б������
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
	 * ������Ϣ
	 * @param e
	 * @param statementName
	 * @return 
	 */
	public int updateObject(E e,String statementName){
		return this.getSqlMapClientTemplate().update(statementName, e);
	}
	/**
	 * ����������Ϣ
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
	 * ɾ������
	 * @param e
	 * @param statementName
	 * @return
	 */
	public int  deleteObject(E e,String statementName){
		return this.getSqlMapClientTemplate().delete(statementName, e);
	}
	/**
	 * ͨ��������ɾ������
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
