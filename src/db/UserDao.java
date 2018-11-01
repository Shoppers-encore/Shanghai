package db;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;
import databean.UserDataBean;

public class UserDao{
	private SqlSession session = SqlMapClient.getSession();
	public int check(String id) {
		return session.selectOne("db.checkUserId", id);
	}































	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	

	
	
	
	
	
	
	
	
	
	
	
	public UserDataBean getAdm(String id) {
		UserDataBean admDto = session.selectOne("Admin.getAdm",id);
		return admDto;
	}
	
	


}

