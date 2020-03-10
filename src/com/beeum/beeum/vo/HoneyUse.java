package com.beeum.beeum.vo;

import java.sql.Timestamp;

public class HoneyUse {
	private int noUse;
	private int numHoney;
	private String useName;
	private Timestamp regDate;
	
	
	
	public HoneyUse() {
		super();
	}
	public int getNoUse() {
		return noUse;
	}
	public void setNoUse(int noUse) {
		this.noUse = noUse;
	}
	public int getNumHoney() {
		return numHoney;
	}
	public void setNumHoney(int numHoney) {
		this.numHoney = numHoney;
	}
	public String getUseName() {
		return useName;
	}
	public void setUseName(String useName) {
		this.useName = useName;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	
}
