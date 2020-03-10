package com.beeum.beeum.vo;



public class Wish {
	public static final String TOUR = "T";
	public static final String USER = "U";
	
	private int noWish;
	private int noUser;
	private String type; // T || U
	private int contentNum;
	
	/****************동현추가********************/
	
	private Tour tour;
	
	/************************************/
	
	public Wish() {
	}
	public Tour getTour() {
		return tour;
	}
	public void setTour(Tour tour) {
		this.tour = tour;
	}
	public int getNoWish() {
		return noWish;
	}
	public void setNoWish(int noWish) {
		this.noWish = noWish;
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
	public int getContentNum() {
		return contentNum;
	}
	public void setContentNum(int contentNum) {
		this.contentNum = contentNum;
	}
	
	
	
	
}
