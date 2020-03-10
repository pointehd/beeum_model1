package com.beeum.beeum.vo;

public class TravelersDetail {
	public static final String MALE = "M";
	public static final String FEMALE = "F";
	
	private int noTravDetail;
	private int noReqTour;
	private String gender; // M || F
	private int age;
	private int pax;
	public TravelersDetail() {
	}
	public int getNoTravDetail() {
		return noTravDetail;
	}
	public void setNoTravDetail(int noTravDetail) {
		this.noTravDetail = noTravDetail;
	}
	public int getNoReqTour() {
		return noReqTour;
	}
	public void setNoReqTour(int noReqTour) {
		this.noReqTour = noReqTour;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getPax() {
		return pax;
	}
	public void setPax(int pax) {
		this.pax = pax;
	}
	
}
