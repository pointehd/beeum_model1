package com.beeum.beeum.vo;

import java.sql.Timestamp;

public class HoneyHistory {
	public static final String USER = "U"; // use reason
	public static final String POINT = "P"; // use reason
	
	public static final String YES = "Y"; // use approval;
	public static final String NO = "N"; //use approval;
	
	private int noHoney;
	private int noUser;
	private int noUse;
	private int numHoney;
	private Timestamp regDate;
	private String reason;
	private String approval;
	
	
	
	public HoneyHistory() {
		super();
	}
	public int getNoHoney() {
		return noHoney;
	}
	public void setNoHoney(int noHoney) {
		this.noHoney = noHoney;
	}
	public int getNoUser() {
		return noUser;
	}
	public void setNoUser(int noUser) {
		this.noUser = noUser;
	}
	public int getNoUse() {
		return noUse;
	}
	public void setNoUse(int noUse) {
		this.noUse = noUse;
	}
	public int getNumHoney() {
		return numHoney;
	}
	public void setNumHoney(int numHoney) {
		this.numHoney = numHoney;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getApproval() {
		return approval;
	}
	public void setApproval(String approval) {
		this.approval = approval;
	}
	public static String getUser() {
		return USER;
	}
	public static String getPoint() {
		return POINT;
	}
	public static String getYes() {
		return YES;
	}
	public static String getNo() {
		return NO;
	}
	
}
