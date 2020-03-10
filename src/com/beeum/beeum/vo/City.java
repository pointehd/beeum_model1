package com.beeum.beeum.vo;

public class City {
	private int noCity;
	private String city;
	private Integer noUpCity;  // 상위 지역 번호가 들어감 ex ) 1 서울특별시 -> null
	                          // ex ) 2 구로구 -> 1
	/************/
	
	private String upCity;
	
	
	/************/
	
	public String getUpCity() {
		return upCity;
	}
	public void setUpCity(String upCity) {
		this.upCity = upCity;
	}
	
	/*****************/
	
	
	
	public City() {
		super();
	}
	public int getNoCity() {
		return noCity;
	}
	public void setNoCity(int noCity) {
		this.noCity = noCity;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public Integer getNoUpCity() {
		return noUpCity;
	}
	public void setNoUpCity(Integer noUpCity) {
		this.noUpCity = noUpCity;
	}
	
	
	
}
