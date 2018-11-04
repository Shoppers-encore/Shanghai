package db;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;
import databean.OrderListDataBean;

public class OrderDao {
	private SqlSession session = SqlMapClient.getSession();

	// ADMIN
	public int getOrderCount() {
		return session.selectOne("Admin.getOrderCount");
	}
	
	
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

	// USER
	public int getDistinctOrderCountById(String id) {
		return session.selectOne("User.getDistinctOrderCountById", id);
	}
	
	public List<OrderListDataBean> getDistinctOrderListById(Map<String, String> selectReferences) {
		return session.selectList("User.getDistinctOrderListById", selectReferences);
	}
			
	public List<OrderListDataBean> getOrderListByOrderCode(int orderCode) {
		return session.selectList("User.getOrderListByOrderCode", orderCode);
	}
}
	
