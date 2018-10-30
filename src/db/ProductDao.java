package db;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;

public class ProductDao{
	private SqlSession session = SqlMapClient.getSession();
}
