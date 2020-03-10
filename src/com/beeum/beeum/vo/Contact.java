package com.beeum.beeum.vo;

public class Contact {
	
	public static final String FACEBOOK = "F";
	public static final String INSTAGRAM = "I";
	public static final String TWITTER = "T";
	public static final String EMAIL = "E";
	
	private int noContact;
	private int noUser;
	private String type;
	private String account;
	
	
	
	public Contact() {
		super();
	}
	public int getNoContact() {
		return noContact;
	}
	public void setNoContact(int noContact) {
		this.noContact = noContact;
	}
	public int getNoUser() {
		return noUser;
	}
	public void setNoUser(int noUser) {
		this.noUser = noUser;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	
}
