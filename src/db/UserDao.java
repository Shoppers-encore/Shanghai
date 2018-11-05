package db;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;
import databean.UserDataBean;




public class UserDao{
	private SqlSession session = SqlMapClient.getSession();
	
	public int check(String id) {
		return session.selectOne("User.checkUserId", id);
	}

	public UserDataBean getUser(String id) {
	return session.selectOne("Admin.getUser", id);
	}

	public int check(String id, String password) {
		int result = 0;
		if( check(id) > 0) {
			//Yes ID
			UserDataBean UserDto = getUser(id);
			if( password.equals(UserDto.getPassword())) {
				// correct password
				result = 1;
			} else {
				// wrong password 
				result = -1;
			}
		} else {
			// No ID
			result = 0;
		}
		return result;
	}

	public int getUserListCount() {
		return session.selectOne("Admin.getUserListCount");
	}
	
	public List<UserDataBean> getList(int code, Map<String, String> map){
		List<UserDataBean> userlist = null;
		if(code==102) {
			userlist = session.selectList("Admin.getNameuserlist", map);
		}else {
			userlist = session.selectList("Admin.getAlluserlist", map);
		}
		return userlist;
	}
	
	public int admModify(UserDataBean dto) {
		return session.update("Admin.admModify", dto);
	}
}
