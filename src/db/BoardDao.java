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
	public ReviewDataBean get(int num) {
		return session.selectOne("User.selectReview", num);
	}
	public int getReviewLikes(int num) {
		return session.selectOne("User.getReviewLikes", num);
	}
	public int getReviewLike(Map<String,String> map) {
		return session.selectOne("User.getReviewLike", map);
	}
	public int addCount(int num) {
		return session.update("User.addCount",num);
	}
}
