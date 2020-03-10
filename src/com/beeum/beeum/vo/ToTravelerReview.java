package com.beeum.beeum.vo;

import java.sql.Date;
import java.util.List;

/**
 * @author Administrator
 *
 */
public class ToTravelerReview {
	private int noTtr;
	private int noReservation;
	private int noTour;
	private String content,title,tFileName,tName,lFileName,lName,rFileName;
	private int hive;
	private Date regDate;
	
	/************/
	private List<AvalBee> beeList;
	private List<AvalBee> beeListTwo;
	private int lNoUser, tNoUser;
	
	/************/
	
	public ToTravelerReview() {
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

	public int getNoTtr() {
		return noTtr;
	}
	
	public void setNoTtr(int noTtr) {
		this.noTtr = noTtr;
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
	
	public int getHive() {
		return hive;
	}
	
	public void setHive(int hive) {
		this.hive = hive;
	}
	
}
