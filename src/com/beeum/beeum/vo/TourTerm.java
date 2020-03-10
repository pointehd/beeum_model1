package com.beeum.beeum.vo;

public class TourTerm {
	public static final String INCLUDE = "I";
	public static final String EXCLUDE = "E";
	public static final String MUST = "M";
	
	private int noTourTerms;
	private int noTour;
	private String type;
	private String content;
	
	
	
	public TourTerm() {
	}
	public int getNoTourTerms() {
		return noTourTerms;
	}
	public void setNoTourTerms(int noTourTerms) {
		this.noTourTerms = noTourTerms;
	}
	public int getNoTour() {
		return noTour;
	}
	public void setNoTour(int noTour) {
		this.noTour = noTour;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
