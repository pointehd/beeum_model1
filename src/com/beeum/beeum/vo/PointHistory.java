package com.beeum.beeum.vo;

import java.sql.Timestamp;

public class PointHistory {
	public static final String PAYMENT="P";
	public static final String TO_LOCAL_REVIEW = "T";
	public static final String TO_TRABELER_REVIEW = "L";
	
	private int noPoint;
	private int noUser;
	private int noReservation;
	private int noTlr;
	private int noTtr;
	private int getPoint;
	private String type;
	private Timestamp getDate;
	
	
	public PointHistory() {
	}
	public int getNoPoint() {
		return noPoint;
	}
	public void setNoPoint(int noPoint) {
		this.noPoint = noPoint;
	}
	public int getNoUser() {
		return noUser;
	}
	public void setNoUser(int noUser) {
		this.noUser = noUser;
	}
	public int getNoReservation() {
		return noReservation;
	}
	public void setNoReservation(int noReservation) {
		this.noReservation = noReservation;
	}
	public int getNoTlr() {
		return noTlr;
	}
	public void setNoTlr(int noTlr) {
		this.noTlr = noTlr;
	}
	public int getNoTtr() {
		return noTtr;
	}
	public void setNoTtr(int noTtr) {
		this.noTtr = noTtr;
	}
	public int getGetPoint() {
		return getPoint;
	}
	public void setGetPoint(int getPoint) {
		this.getPoint = getPoint;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Timestamp getGetDate() {
		return getDate;
	}
	public void setGetDate(Timestamp getDate) {
		this.getDate = getDate;
	}
		
}
