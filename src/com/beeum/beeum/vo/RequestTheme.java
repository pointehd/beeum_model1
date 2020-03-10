package com.beeum.beeum.vo;

public class RequestTheme {
	public static final String HISTORY = "H";
	public static final String LOCAL = "L";
	public static final String NATURE = "N";
	public static final String EXPERIENCE = "E";
	public static final String LEPORT = "P";
	public static final String SHOPPING = "S";
	
	private int noReqTheme;
	private int noReqTour;
	private String theme; // L || S || H || N || E || P
	
	
	public RequestTheme() {
	}
	public int getNoReqTheme() {
		return noReqTheme;
	}
	public void setNoReqTheme(int noReqTheme) {
		this.noReqTheme = noReqTheme;
	}
	public int getNoReqTour() {
		return noReqTour;
	}
	public void setNoReqTour(int noReqTour) {
		this.noReqTour = noReqTour;
	}
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
	
}
