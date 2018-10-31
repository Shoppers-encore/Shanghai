package db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;
import databean.BasketDataBean;


public class BasketDao {
	private SqlSession session = SqlMapClient.getSession();
	public List<BasketDataBean> getList(String id) {
		System.out.println(id);
		return session.selectList("Basket.")
	}
}
