package db;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;
import databean.CommentDataBean;
import databean.ReviewDataBean;
public class BoardDao {
	private SqlSession session = SqlMapClient.getSession();
	
	public int getReviewCount(Map<String, String> map) {
		return session.selectOne("User.getReviewCount", map);
	}
	public int getReviewCount() {
		return session.selectOne("User.getReviewNoSearchCount");
	}
	public List<ReviewDataBean> getReviewList(Map<String, String> needData){
		return session.selectList("User.getReviewList", needData);
	}
	
	public int getMaxReview() {
		return session.selectOne("User.getMaxReview");
	}
	public int insert(ReviewDataBean reviewDto) {
		return session.insert("User.insertReview", reviewDto);
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
	public int insertReviewLike(Map<String,String>map) {
		return session.insert("User.insertReviewLike",map);
	}
	public int deleteReviewLike(Map<String,String>map) {
		return session.delete("User.deleteReviewLike",map);
	}
	
	public int delete(int num) {
		return session.delete("User.deleteReview", num);
	}
	public int deleteRvComment(int num) {
		return session.delete("User.deleteRvComment", num);
	}
	public int deleteReviewLikes(int num) {
		return session.delete("User.deleteReviewLikes", num);
	}
	
	public int modify(ReviewDataBean reviewDto) {
		return session.update("User.modifyReview", reviewDto);
	}
	
	public int insertComment(CommentDataBean cmtDto) {
		return session.insert("User.insertComment", cmtDto);
	}
	public List<CommentDataBean> getComment( int reviewNo ) {
		return session.selectList("User.getComment", reviewNo);
	}
	public int updateComment(CommentDataBean cmtDto) {
		return session.update("User.updateComment", cmtDto);
	}
	public int deleteComment( int commentNo ) {
		return session.delete("User.deleteComment", commentNo);
	}
	public List <ReviewDataBean> getRvList(Map<String, String> map) {
		return session.selectList("Admin.getRvList", map);
	}
	public int reviewDelete( int reviewNo ) {
		return session.delete( "Admin.reviewDelete", reviewNo );
	}
	public int getRefNo( String productCode ) {
		return session.selectOne( "Admin.getRefNo", productCode );
	}

	//////// 1107 added by JH ^^
	public int getReviewSearchCount(Map<String,String> map) {
		return session.selectOne("User.getReviewCount", map);
	}
	public List <ReviewDataBean> getRvSearchList(Map<String,String> map) {
		return session.selectList("User.getRvSearchList", map);
	}
	
	public List<ReviewDataBean> checkReviewWritten(int orderCode) {
		return session.selectList("User.checkReviewWritten", orderCode);
	}
}
