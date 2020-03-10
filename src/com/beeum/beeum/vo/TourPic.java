package com.beeum.beeum.vo;

public class TourPic {
	public static final String MEET = "M";
	public static final String TOUR = "T";
	public static final String SIGN = "S";
	
	private int noTourPic;
	private int noTour;
	private String type; // M || T || S
	private String fileName;
	
	
	
	public TourPic() {
	}
	public int getNoTourPic() {
		return noTourPic;
	}
	public void setNoTourPic(int noTourPic) {
		this.noTourPic = noTourPic;
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
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
}
