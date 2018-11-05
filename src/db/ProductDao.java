package db;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;
import databean.ImageInfoDataBean;
import databean.OrderListDataBean;
import databean.ProductDataBean;


public class ProductDao{
	private SqlSession session = SqlMapClient.getSession();

	public int getProductCount(Map<String, String> map) {
		return session.selectOne("User.getProductCount", map);
	}
	
	public List<ProductDataBean> getProductList(Map<String, String> map) {
		return session.selectList("User.getProductList", map);
	}
	
	public String getProductName(String productCode) {
		return session.selectOne("User.getProductName", productCode);
	}

	public List<ProductDataBean> getProductDetail(int ref) {
		return session.selectList("User.getProductDetail",ref);
	}

	public List<ProductDataBean> getProductCodesByRef(String ref) {
		return session.selectList("User.getProductCodesByRef", ref);
	}

	public int getSearchCount(String searchWord) {	
		System.out.println(searchWord);
		return session.selectOne("Admin.getSearchCount", searchWord);
	}
	
	public List<ProductDataBean> getNameSearch(Map<String,String> map){
		return session.selectList("Admin.searchName", map);
		//SELECT * FROM jk_good WHERE good_name LIKE '%'||#{searchWord}||'%' AND good_code=to_char(ref)
	}
	
	public int getProdCount() {
		return session.selectOne("Admin.getProdCount");
	}
	
	public List<ProductDataBean> getProdList(Map<String, String> map){
		List<ProductDataBean> productList = null;
		productList = session.selectList("Admin.getProdList", map);
			return productList;
	}
	
	public int getRef() {
		return session.selectOne("Admin.getRef");
	}
	
	public int input(ProductDataBean productDto) {
		return session.insert("Admin.input", productDto);
	}
	
	public int getImgNo() {
		int num = 0;
		if(session.selectOne("Admin.maxImg") == null) {
			num = 0;
		}else {
			num = session.selectOne("Admin.maxImg");
		}
		return num;
	}
	
	public int insertImgInfo(ImageInfoDataBean imgDto) {
		return session.insert("Admin.insertImg", imgDto);
	}

	//For basket's Thumbnail use
	public String getThumbnail(String productCode) {
		return session.selectOne("User.getProductThumbnail", productCode);
	}

	public int getProductNoSearchCount(Map<String, String> map) {
		return session.selectOne("User.getProductNoSearch", map);
	}

	public List<ProductDataBean> getNoSearchProductList(Map<String, String> map) {
		return session.selectList("User.getProductNoSearchList", map);
	}
}
