package db;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;
public class OrderDao {
	private SqlSession session = SqlMapClient.getSession();
}
