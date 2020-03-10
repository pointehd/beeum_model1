package com.beeum.beeum.vo;

import java.sql.Timestamp;

public class Payment {	
	private int noReservation;
	private int noUser;
	private int noTour;
	private Timestamp startDate;
	private Timestamp endDate;
	private String name;
	private int phoneNum;
	private String payMethod;
	private int usedHoney;
	
	
	public Payment() {
		super();
	}
	public int getNoReservation() {
		return noReservation;
	}
	public void setNoReservation(int noReservation) {
		this.noReservation = noReservation;
	}
	public int getNoUser() {
		return noUser;
	}
	public void setNoUser(int noUser) {
		this.noUser = noUser;
	}
	public int getNoTour() {
		return noTour;
	}
	public void setNoTour(int noTour) {
		this.noTour = noTour;
	}
	public Timestamp getStartDate() {
		return startDate;
	}
	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}
	public Timestamp getEndDate() {
		return endDate;
	}
	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(int phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public int getUsedHoney() {
		return usedHoney;
	}
	public void setUsedHoney(int usedHoney) {
		this.usedHoney = usedHoney;
	}
	
	
}
