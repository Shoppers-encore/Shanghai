package db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;
import databean.BasketDataBean;


public class BasketDao {
	private SqlSession session = SqlMapClient.getSession();
	
	/*-----103118_HY Added-----*/
	public List<BasketDataBean> getBasketList(String id) {
		System.out.println("BasketDao/getBasketList: "+id);
		return session.selectList("User.getBasketList");
	}
	
	public int getBasketCount(String id) {
		System.out.println("BasketDao/getBasketCount: "+id);
		return session.selectOne("User.getBasketCount");
		
	}
	/*----------HY_fin---------*/
}
