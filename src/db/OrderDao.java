package db;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;
import databean.OrderListDataBean;

public class OrderDao {
	private SqlSession session = SqlMapClient.getSession();

	public int getOrderCount() {
		return session.selectOne("Admin.getOrderCount");
	}
	
	public List<OrderListDataBean> getList(Map<String, String> map){
			return session.selectList("Admin.selectOrderList",map);
	}
	
	public int getUserCount(String id) {
		return session.selectOne("Admin.userCount", id);
	}
	
}
	
