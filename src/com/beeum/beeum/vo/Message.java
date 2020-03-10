package com.beeum.beeum.vo;

import java.sql.Timestamp;

public class Message {
	
	public static final String YES = "Y";
	public static final String NO = "N";
	
	private int noMessage;
	private int senderUser;
	private int receiverUser;
	private String content;
	private String condition;
	private Timestamp regiDate;
	
	
	public Message() {
		super();
	}
	public int getNoMessage() {
		return noMessage;
	}
	public void setNoMessage(int noMessage) {
		this.noMessage = noMessage;
	}
	public int getSenderUser() {
		return senderUser;
	}
	public void setSenderUser(int senderUser) {
		this.senderUser = senderUser;
	}
	public int getReceiverUser() {
		return receiverUser;
	}
	public void setReceiverUser(int receiverUser) {
		this.receiverUser = receiverUser;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public Timestamp getRegiDate() {
		return regiDate;
	}
	public void setRegiDate(Timestamp regiDate) {
		this.regiDate = regiDate;
	}
	
}
