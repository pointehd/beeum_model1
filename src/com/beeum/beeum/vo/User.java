package com.beeum.beeum.vo;

import java.util.List;

public class User {
	private int noUser;
	private String email;
	private String password;
	private String name;
	
	private String fileName;
	
	private int age, lCnt, tlrScore, tCnt, ttrScore;
	private String gender;
	private String city;
	private List<AvalLang> languageList; 
	private List<AvalBee> beeList;
	private List<MyArea> noCity;
	
	public User() {
	}
	
	public User(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}
	
	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getlCnt() {
		return lCnt;
	}

	public void setlCnt(int lCnt) {
		this.lCnt = lCnt;
	}

	public int getTlrScore() {
		return tlrScore;
	}

	public void setTlrScore(int tlrScore) {
		this.tlrScore = tlrScore;
	}

	public int gettCnt() {
		return tCnt;
	}

	public void settCnt(int tCnt) {
		this.tCnt = tCnt;
	}

	public int getTtrScore() {
		return ttrScore;
	}

	public void setTtrScore(int ttrScore) {
		this.ttrScore = ttrScore;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public List<AvalLang> getLanguageList() {
		return languageList;
	}

	public void setLanguageList(List<AvalLang> languageList) {
		this.languageList = languageList;
	}

	public List<AvalBee> getBeeList() {
		return beeList;
	}

	public void setBeeList(List<AvalBee> beeList) {
		this.beeList = beeList;
	}

	public List<MyArea> getNoCity() {
		return noCity;
	}

	public void setNoCity(List<MyArea> noCity) {
		this.noCity = noCity;
	}

	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public int getNoUser() {
		return noUser;
	}
	public void setNoUser(int noUser) {
		this.noUser = noUser;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
