package db;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;
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
}
