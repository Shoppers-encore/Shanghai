package db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;
import databean.ProductTagDataBean;
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
	public int insertProdTag(ProductTagDataBean productTagDto) {
		return session.insert("Admin.insertProdTag", productTagDto);
	}
	public int deleteProdTag(ProductTagDataBean productTagDto) {
		return session.delete("Admin.deleteProdTag", productTagDto);
	}
	public List<Integer> getProductTagId(int ref) {
		return session.selectList("Admin.getProductTagId", ref);
	}
	
}
