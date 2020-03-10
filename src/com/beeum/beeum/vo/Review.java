package com.beeum.beeum.vo;

import java.sql.Timestamp;
import java.util.List;

public class Review {
	private int getterNo, senderNo, hive;
	private String getterName, getterFile, content, senderName, senderFile, title,
		 	theme, city, tourFile;
	private Timestamp regDate;
	
	private List<String> senderBees;
	private List<String> getterBees;
	
	public Review() {
		super();
	}
	
	public String getTourFile() {
		return tourFile;
	}

	public void setTourFile(String tourFile) {
		this.tourFile = tourFile;
	}

	public int getGetterNo() {
		return getterNo;
	}
	public void setGetterNo(int getterNo) {
		this.getterNo = getterNo;
	}
	public int getSenderNo() {
		return senderNo;
	}
	public void setSenderNo(int senderNo) {
		this.senderNo = senderNo;
	}
	public int getHive() {
		return hive;
	}
	public void setHive(int hive) {
		this.hive = hive;
	}
	public String getGetterName() {
		return getterName;
	}
	public void setGetterName(String getterName) {
		this.getterName = getterName;
	}
	public String getGetterFile() {
		return getterFile;
	}
	public void setGetterFile(String getterFile) {
		this.getterFile = getterFile;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSenderName() {
		return senderName;
	}
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	public String getSenderFile() {
		return senderFile;
	}
	public void setSenderFile(String senderFile) {
		this.senderFile = senderFile;
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
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public List<String> getSenderBees() {
		return senderBees;
	}
	public void setSenderBees(List<String> senderBees) {
		this.senderBees = senderBees;
	}
	public List<String> getGetterBees() {
		return getterBees;
	}
	public void setGetterBees(List<String> getterBees) {
		this.getterBees = getterBees;
	}
	
}
