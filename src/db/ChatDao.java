package db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;
import databean.ChatDataBean;

public class ChatDao {
	private SqlSession session = SqlMapClient.getSession();

	public List<ChatDataBean> getList(String id) {
		return session.selectList("User.getChatList", id);
	}

	public int chatInput(ChatDataBean chat) {
		return session.insert("User.chatInput", chat);
	}

	public List<ChatDataBean> getChatList() {
		return session.selectList("Admin.getChatList");
	}

	public int getChatListCount() {
		return session.selectOne("Admin.getChatListCount");
	}
}
