package com.beeum.beeum.vo;

import java.sql.Date;

public class FilterVO {

	private int pax;
	private String gender;
	private String theme;//배열형
	private Date start, end;
	private String region;
	private int age;
	//private String age;
	private int price;
	private int pstart, pend;
	private String order;
	
	public FilterVO() {
		// TODO Auto-generated constructor stub
	}
	
	/////////////////////
	
	public int getPax() {
		return pax;
	}
	
	public int getPstart() {
		return pstart;
	}
	
	public void setPstart(int pstart) {
		this.pstart = pstart;
	}
	
	public int getPend() {
		return pend;
	}
	
	public void setPax(int pax) {
		this.pax = pax;
	}
	
	public FilterVO(int pageNo, int numPage) {
		
		pend = pageNo*numPage;
		pstart = pend - (numPage-1);
		//this.order = "reg_date";
		
	}
	
	///////////////////////

	public void setPend(int pend) {
		this.pend = pend;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public Date getStart() {
		return start;
	}

	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}

	public void setStart(Date start) {
		this.start = start;
	}

	public Date getEnd() {
		return end;
	}

	public void setEnd(Date end) {
		this.end = end;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	
	/*	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}*/
	
	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}
	
	
}//FilterVO end
