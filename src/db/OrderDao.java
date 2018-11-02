package db;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;
import databean.OrderListDataBean;
import databean.UserDataBean;


public class OrderDao {
	private SqlSession session = SqlMapClient.getSession();

	public int getOrderCount() {
		return session.selectOne("Admin.getOrderCount");
	}
	
	/*public List<OrderListDataBean> getList(Map<String, String> map){
			return session.selectList("Admin.selectOrderList",map);
	}*/
	
	public List<OrderListDataBean> getList(Map<String, String> map){
		if(map.get("id") == null || map.get("id").length()<=5) {
			return session.selectList("Admin.selectAllOrderList",map);
		}else {
			return session.selectList("Admin.selectUserOrderList",map);
	
		}
	}
	
	public int getUserCount(String id) {
		return session.selectOne("Admin.userCount", id);
	}
	
	public List<OrderListDataBean> getOrderList(Map<String, String> map){
		List<OrderListDataBean> orderList = null;
		orderList = session.selectList("Admin.getOrderList", map);
			return orderList;
	}

	public OrderListDataBean getOrder(String id) {
		return session.selectOne("Admin.getOrder", id);
		}

}
	
