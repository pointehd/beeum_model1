package com.beeum.beeum.vo;

public class Career {
	private int noCareer;
	private int noUser;
	private int startDate; // 199406
	private int endDate;  //199408
	private String content;
	
	
	public Career() {
		super();
	}
	public int getNoCareer() {
		return noCareer;
	}
	public void setNoCareer(int noCareer) {
		this.noCareer = noCareer;
	}
	public int getNoUser() {
		return noUser;
	}
	public void setNoUser(int noUser) {
		this.noUser = noUser;
	}
	public int getStartDate() {
		return startDate;
	}
	public void setStartDate(int startDate) {
		this.startDate = startDate;
	}
	public int getEndDate() {
		return endDate;
	}
	public void setEndDate(int endDate) {
		this.endDate = endDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
