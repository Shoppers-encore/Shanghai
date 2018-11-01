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
		UserDataBean userDto = session.selectOne("Admin.getAdm",id);
		return userDto;
	}
	
	public int check(String id, String passwd) {
		if(id.length() <= 5) {
			UserDataBean userDto = getAdm(id);
			if(passwd.equals(userDto.getPassword())) {
					return 1;
				}else {
					return 2;
				}
			}
			return -1;
		}
}

