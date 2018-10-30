package db;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;

public class TagDao {
	private SqlSession session = SqlMapClient.getSession();
}
