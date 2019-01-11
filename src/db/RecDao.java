package db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;
import databean.RecDataBean;

public class RecDao {
	private SqlSession session = SqlMapClient.getSession();
	
	public int getClusterCount(String id) {
		return session.selectOne("User.getClusterCount", id);
	}
	
	public List<RecDataBean> getRecCategories(String id) {
		return session.selectList("User.getRecCategories", id);
	}
}
