package db;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;

public class UserDao{
	private SqlSession session = SqlMapClient.getSession();
	public int check(String id) {
		return session.selectOne("db.checkUserId", id);
	}
}

