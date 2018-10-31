package db;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;
import databean.ReviewDataBean;
public class BoardDao {
	private SqlSession session = SqlMapClient.getSession();
	
	public int getReviewCount() {
		return session.selectOne( "User.getReviewCount" );
	}
	public List<ReviewDataBean> getReviewList(Map<String, String> needData){
		return session.selectList( "User.getReviewList", needData );
	}
}
