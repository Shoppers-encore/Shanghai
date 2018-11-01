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
	public int check(String id, String password) {
		int result = 0;
		if( check(id) > 0) {
			//Yes ID
			UserDataBean UserDto = getUser(id);
			if( password.equals(UserDto.getPassword())) {
				result = 1;
			} else {
				result = -1;
			}
		} else {
			// No ID
			result = 0;
		}
		return result;
	}
	public UserDataBean getUser(String id) {
		return session.selectOne("db.getUserId", id);
	}
}

