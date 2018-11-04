package db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;
import databean.BasketDataBean;


public class BasketDao {
	private SqlSession session = SqlMapClient.getSession();
	
	public List<BasketDataBean> getBasketList(String id) {
		return session.selectList("User.getBasketList", id);
	}
	
	public int getBasketCount(String id) {
		return session.selectOne("User.getBasketCount", id);
		
	}

	public int deleteBasketItem(BasketDataBean deleteReferences) {
		return session.delete("User.deleteBasketItem", deleteReferences);
	}
	
	//basket input
	public int inputBasket(BasketDataBean basket) {
		return session.insert("User.inputBasket", basket);

	}
}
