package com.beeum.beeum.vo;

public class CourseCategory {
	private int noCourseCategory;
	private String category;
	private Integer noUpCategory; // null 이들어올수 있어서 Integer
	
	
	public CourseCategory() {
		super();
	}
	public int getNoCourseCategory() {
		return noCourseCategory;
	}
	public void setNoCourseCategory(int noCourseCategory) {
		this.noCourseCategory = noCourseCategory;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Integer getNoUpCategory() {
		return noUpCategory;
	}
	public void setNoUpCategory(Integer noUpCategory) {
		this.noUpCategory = noUpCategory;
	}
	
}
