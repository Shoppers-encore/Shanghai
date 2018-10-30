package db;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;
public class BoardDao {
	private SqlSession session = SqlMapClient.getSession();
}
