package com.beeum.beeum.vo;

import java.util.List;

public class Tour {
	public static final String MALE = "M";
	public static final String FEMALE = "F";
	public static final String ALL = "A";
	
	
	public static final String HISTORY = "H";
	public static final String LOCAL = "L";
	public static final String NATURE = "N";
	public static final String EXPERIENCE = "E";
	public static final String LEPORT = "P";
	public static final String SHOPPING = "S";
	
	private int noTour;
	private int noUser;
	private String title;
	private String theme; // L || S || H || N || E || P
	private String tourInfo;
	private String gender; // M || F || A값이 들어감.
	private int startTime;
	private int endTime;
	private String meetPoint;
	private String lat;
	private String lng;
	private int totalTime;
	private int minimum;
	private int maximum;
	private int price;
	
	
	
	/*************동현 추가********/
	
	private double score;
	private int reviewCount, noReqTour;
	private String name, profilePic, tourPic, city;
	private List<AvalBee> beeList;
	
	/*********************/
	
	
	/***********예빈 추가**********/
	
	
	private int courseScore, priceScore, mannerScore, langScore, matchScore;
	
	private int noCity, noUpCity, countNum;
	private String  tourPicFileName, userPicFileName, userLevel;
	private String language;
	private int maxTourPrice, maxTime;
	
	
	/*********************/
	
	
	public Tour() {
	}
	
	
	
	public int getCourseScore() {
		return courseScore;
	}



	public void setCourseScore(int courseScore) {
		this.courseScore = courseScore;
	}



	public int getPriceScore() {
		return priceScore;
	}



	public void setPriceScore(int priceScore) {
		this.priceScore = priceScore;
	}



	public int getMannerScore() {
		return mannerScore;
	}



	public void setMannerScore(int mannerScore) {
		this.mannerScore = mannerScore;
	}



	public int getLangScore() {
		return langScore;
	}



	public void setLangScore(int langScore) {
		this.langScore = langScore;
	}



	public int getMatchScore() {
		return matchScore;
	}



	public void setMatchScore(int matchScore) {
		this.matchScore = matchScore;
	}



	public int getNoCity() {
		return noCity;
	}



	public void setNoCity(int noCity) {
		this.noCity = noCity;
	}



	public int getNoUpCity() {
		return noUpCity;
	}



	public void setNoUpCity(int noUpCity) {
		this.noUpCity = noUpCity;
	}



	public int getCountNum() {
		return countNum;
	}



	public void setCountNum(int countNum) {
		this.countNum = countNum;
	}



	public String getTourPicFileName() {
		return tourPicFileName;
	}



	public void setTourPicFileName(String tourPicFileName) {
		this.tourPicFileName = tourPicFileName;
	}



	public String getUserPicFileName() {
		return userPicFileName;
	}



	public void setUserPicFileName(String userPicFileName) {
		this.userPicFileName = userPicFileName;
	}



	public String getUserLevel() {
		return userLevel;
	}



	public void setUserLevel(String userLevel) {
		this.userLevel = userLevel;
	}



	public String getLanguage() {
		return language;
	}



	public void setLanguage(String language) {
		this.language = language;
	}



	public int getMaxTourPrice() {
		return maxTourPrice;
	}



	public void setMaxTourPrice(int maxTourPrice) {
		this.maxTourPrice = maxTourPrice;
	}



	public int getMaxTime() {
		return maxTime;
	}



	public void setMaxTime(int maxTime) {
		this.maxTime = maxTime;
	}



	public int getNoReqTour() {
		return noReqTour;
	}
	public void setNoReqTour(int noReqTour) {
		this.noReqTour = noReqTour;
	}
	public String getProfilePic() {
		return profilePic;
	}
	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}
	public String getTourPic() {
		return tourPic;
	}
	public void setTourPic(String tourPic) {
		this.tourPic = tourPic;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public List<AvalBee> getBeeList() {
		return beeList;
	}
	public void setBeeList(List<AvalBee> beeList) {
		this.beeList = beeList;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public int getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNoTour() {
		return noTour;
	}
	public void setNoTour(int noTour) {
		this.noTour = noTour;
	}
	public int getNoUser() {
		return noUser;
	}
	public void setNoUser(int noUser) {
		this.noUser = noUser;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
	public String getTourInfo() {
		return tourInfo;
	}
	public void setTourInfo(String tourInfo) {
		this.tourInfo = tourInfo;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getStartTime() {
		return startTime;
	}
	public void setStartTime(int startTime) {
		this.startTime = startTime;
	}
	public int getEndTime() {
		return endTime;
	}
	public void setEndTime(int endTime) {
		this.endTime = endTime;
	}
	public String getMeetPoint() {
		return meetPoint;
	}
	public void setMeetPoint(String meetPoint) {
		this.meetPoint = meetPoint;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	public int getTotalTime() {
		return totalTime;
	}
	public void setTotalTime(int totalTime) {
		this.totalTime = totalTime;
	}
	public int getMinimum() {
		return minimum;
	}
	public void setMinimum(int minimum) {
		this.minimum = minimum;
	}
	public int getMaximum() {
		return maximum;
	}
	public void setMaximum(int maximum) {
		this.maximum = maximum;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
