package com.beeum.beeum.vo;

public class Course {
	private int noCourse;
	private int noTour;
	private int noCourseCaregory;
	private String title;
	private String fileName;
	private String content, category;
	private int demandTime;
	private int noCourseCategory;

	public Course() {
		super();
	}
	
	
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getNoCourseCategory() {
		return noCourseCategory;
	}
	public void setNoCourseCategory(int noCourseCategory) {
		this.noCourseCategory = noCourseCategory;
	}
	
	public int getNoCourse() {
		return noCourse;
	}
	public void setNoCourse(int noCourse) {
		this.noCourse = noCourse;
	}
	public int getNoTour() {
		return noTour;
	}
	public void setNoTour(int noTour) {
		this.noTour = noTour;
	}
	public int getNoCourseCaregory() {
		return noCourseCaregory;
	}
	public void setNoCourseCaregory(int noCourseCaregory) {
		this.noCourseCaregory = noCourseCaregory;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getDemandTime() {
		return demandTime;
	}
	public void setDemandTime(int demandTime) {
		this.demandTime = demandTime;
	}
	
}
