package com.beeum.beeum.vo;

import java.sql.Timestamp;
import java.util.List;

import com.beeum.beeum.util.NumberUtil;

public class RequestTour {
	private int noReqTour;
	private int noUser;
	private Integer noTarget; // null 은 전체에게
	private int noCity;
	private Timestamp startDate;
	private Timestamp endDate;
	private String meetPoint;
	private int budget;
	
	
	/*****************/
	
	private String name, city, fileName;
	
	private double score;
	private int cnt;
	private List<String> beeListStr;
	private List<String> themeListStr;
	private List<TravelersDetail> travList;
	
	// 요청한 투어에 대한 제안 투어
	private List<Tour> sugTourList;
	/*****************/
	
	
	/****************/
	private int hive;
	private List<AvalBee> beeList;
	private String budgetStr;
	private List<RequestTheme> themeList;
	private List<TravelersDetail> travelers;
	private String upCity;
	
	/****************/
	
	
	
	public RequestTour() {
	}
	
	
	public List<String> getBeeListStr() {
		return beeListStr;
	}


	public void setBeeListStr(List<String> beeListStr) {
		this.beeListStr = beeListStr;
	}


	public List<String> getThemeListStr() {
		return themeListStr;
	}


	public void setThemeListStr(List<String> themeListStr) {
		this.themeListStr = themeListStr;
	}


	public int getHive() {
		return hive;
	}


	public void setHive(int hive) {
		this.hive = hive;
	}


	public List<AvalBee> getBeeList() {
		return beeList;
	}


	public void setBeeList(List<AvalBee> beeList) {
		this.beeList = beeList;
	}


	public String getBudgetStr() {
		return budgetStr;
	}


	public void setBudgetStr(String budgetStr) {
		this.budgetStr = budgetStr;
	}

	
	

	public List<RequestTheme> getThemeList() {
		return themeList;
	}


	public void setThemeList(List<RequestTheme> themeList) {
		this.themeList = themeList;
	}


	public List<TravelersDetail> getTravelers() {
		return travelers;
	}


	public void setTravelers(List<TravelersDetail> travelers) {
		this.travelers = travelers;
	}


	public String getUpCity() {
		return upCity;
	}


	public void setUpCity(String upCity) {
		this.upCity = upCity;
	}


	public List<Tour> getSugTourList() {
		return sugTourList;
	}
	public void setSugTourList(List<Tour> sugTourList) {
		this.sugTourList = sugTourList;
	}
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	
	
	public List<TravelersDetail> getTravList() {
		return travList;
	}
	public void setTravList(List<TravelersDetail> travList) {
		this.travList = travList;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getNoReqTour() {
		return noReqTour;
	}
	public void setNoReqTour(int noReqTour) {
		this.noReqTour = noReqTour;
	}
	public int getNoUser() {
		return noUser;
	}
	public void setNoUser(int noUser) {
		this.noUser = noUser;
	}
	public Integer getNoTarget() {
		return noTarget;
	}
	public void setNoTarget(Integer noTarget) {
		this.noTarget = noTarget;
	}
	public int getNoCity() {
		return noCity;
	}
	public void setNoCity(int noCity) {
		this.noCity = noCity;
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
	public String getMeetPoint() {
		return meetPoint;
	}
	public void setMeetPoint(String meetPoint) {
		this.meetPoint = meetPoint;
	}
	public int getBudget() {
		return budget;
	}
	public void setBudget(int budget) {
		setBudgetStr(NumberUtil.toNumFormat(budget));
		this.budget = budget;
	}
	
}
