package com.beeum.beeum.vo;

public class License {
	private int noLicense;
	private int noUser;
	private String license;
	
	
	public License() {
		super();
	}
	public int getNoLicense() {
		return noLicense;
	}
	public void setNoLicense(int noLicense) {
		this.noLicense = noLicense;
	}
	public int getNoUser() {
		return noUser;
	}
	public void setNoUser(int noUser) {
		this.noUser = noUser;
	}
	public String getLicense() {
		return license;
	}
	public void setLicense(String license) {
		this.license = license;
	}
	
}
