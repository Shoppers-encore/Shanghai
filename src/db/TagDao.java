package db;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;
import databean.TagDataBean;

public class TagDao {
	private SqlSession session = SqlMapClient.getSession();
	public List<TagDataBean> getTags(){
		return session.selectList("Admin.getTags");	
	}
	public int insertTag(String newTag) {
		return session.insert("Admin.insertTag", newTag);
	}
	public int deleteTag(int tagId) {
		return session.insert("Admin.deleteTag", tagId);
	}
}
