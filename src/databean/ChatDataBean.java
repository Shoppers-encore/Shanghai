package databean;

import java.sql.Timestamp;

public class ChatDataBean {
	private String sender;
	private String receiver;
	private String chatContent;
	private Timestamp chatDate;
	private int isUser;
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getChatContent() {
		return chatContent;
	}
	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}
	public Timestamp getChatDate() {
		return chatDate;
	}
	public void setChatDate(Timestamp chatDate) {
		this.chatDate = chatDate;
	}
	public int getIsUser() {
		return isUser;
	}
	public void setIsUser(int isUser) {
		this.isUser = isUser;
	}
}