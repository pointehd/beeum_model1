package com.beeum.beeum.vo;

import java.sql.Date;

public class Profile {
	public static final String MALE = "M";
	public static final String FEMALE = "F";
	
	
	private int noUser;
	private String gender;
	private Date birthDate;
	private String shortIntro;
	private String longIntro;
	private int point;
	private int honey;
	private String profilePic;
	
	/**추가된 멤버 필드**/
	private String name;
	private int localScore, travelScore, lReviewCnt, tReviewCnt;
	
	
	/****/
	
	
	public Profile() {
	}
	
	
	public String getProfilePic() {
		return profilePic;
	}


	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}


	public int getLocalScore() {
		return localScore;
	}

	public void setLocalScore(int localScore) {
		this.localScore = localScore;
	}

	public int getTravelScore() {
		return travelScore;
	}

	public void setTravelScore(int travelScore) {
		this.travelScore = travelScore;
	}

	public int getlReviewCnt() {
		return lReviewCnt;
	}

	public void setlReviewCnt(int lReviewCnt) {
		this.lReviewCnt = lReviewCnt;
	}

	public int gettReviewCnt() {
		return tReviewCnt;
	}

	public void settReviewCnt(int tReviewCnt) {
		this.tReviewCnt = tReviewCnt;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	public int getNoUser() {
		return noUser;
	}
	public void setNoUser(int noUser) {
		this.noUser = noUser;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}
	public String getShortIntro() {
		return shortIntro;
	}
	public void setShortIntro(String shortIntro) {
		this.shortIntro = shortIntro;
	}
	public String getLongIntro() {
		return longIntro;
	}
	public void setLongIntro(String longIntro) {
		this.longIntro = longIntro;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getHoney() {
		return honey;
	}
	public void setHoney(int honey) {
		this.honey = honey;
	}
	
}
