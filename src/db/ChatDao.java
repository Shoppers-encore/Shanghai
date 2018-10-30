package db;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;

public class ChatDao {
	private SqlSession session = SqlMapClient.getSession();
}
