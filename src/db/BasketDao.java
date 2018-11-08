package db;

import java.util.List;
import java.util.Map;

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
	
	public int updateBasketList(Map<String, Object> updateReferences) {
		return session.update("User.updateBasketList", updateReferences);
	}
	
	public int deleteBasketListById(String id) {
		return session.delete("User.deleteBasketListById", id);
	}
	
	
	//basket input
	public int inputBasket(BasketDataBean basket) {
		return session.insert("User.inputBasket", basket);

	}

	public int getDupicateCheck(BasketDataBean basket) {
		return session.selectOne("User.getDuplicateCheck", basket);
	}

	public int increaseBasketItem(BasketDataBean basket) {
		return session.update("increaseBasketItemQuantity", basket);
	}
}
