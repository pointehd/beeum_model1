package com.beeum.beeum.vo;

import java.sql.Date;
import java.util.List;

public class ToLocalReview {
	 
	private int noTlr;
	private int noReservation;
	private int noTour;
	private String content, title, tFileName, tName, lFileName, lName, rFileName;
	private int courseScore;
	private int priceScore;
	private int mannerScore;
	private int langScore;
	private int matchScore;
	private Date regDate;
	
	
	/**************/
	private int lNoUser, tNoUser;
	private List<AvalBee> beeList;
	private List<AvalBee> beeListTwo;
	private int hive;
	/**************/
	
	
	public ToLocalReview() {
	}
	
	public int getlNoUser() {
		return lNoUser;
	}

	public void setlNoUser(int lNoUser) {
		this.lNoUser = lNoUser;
	}

	public int gettNoUser() {
		return tNoUser;
	}

	public void settNoUser(int tNoUser) {
		this.tNoUser = tNoUser;
	}

	public List<AvalBee> getBeeList() {
		return beeList;
	}

	public void setBeeList(List<AvalBee> beeList) {
		this.beeList = beeList;
	}

	public List<AvalBee> getBeeListTwo() {
		return beeListTwo;
	}

	public void setBeeListTwo(List<AvalBee> beeListTwo) {
		this.beeListTwo = beeListTwo;
	}

	public int getHive() {
		return hive;
	}

	public void setHive(int hive) {
		this.hive = hive;
	}

	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String gettFileName() {
		return tFileName;
	}
	
	public void settFileName(String tFileName) {
		this.tFileName = tFileName;
	}
	
	public String gettName() {
		return tName;
	}
	
	public void settName(String tName) {
		this.tName = tName;
	}
	
	public String getlFileName() {
		return lFileName;
	}
	
	public void setlFileName(String lFileName) {
		this.lFileName = lFileName;
	}
	
	public String getlName() {
		return lName;
	}
	
	public void setlName(String lName) {
		this.lName = lName;
	}
	
	public String getrFileName() {
		return rFileName;
	}
	
	public void setrFileName(String rFileName) {
		this.rFileName = rFileName;
	}
	
	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getNoTlr() {
		return noTlr;
	}
	
	public void setNoTlr(int noTlr) {
		this.noTlr = noTlr;
	}
	
	public int getNoReservation() {
		return noReservation;
	}
	
	public void setNoReservation(int noReservation) {
		this.noReservation = noReservation;
	}
	
	public int getNoTour() {
		return noTour;
	}
	
	public void setNoTour(int noTour) {
		this.noTour = noTour;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
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
	
}
