package com.beeum.beeum.vo;

public class AvalLang {
	private int noAvalLang;
	private int noUser;
	private int noLang, avalLangCnt;
	private String language;
	

	
	/********수창********/
	
	
	/****************/
	
	public AvalLang() {
	}
	
	public int getAvalLangCnt() {
		return avalLangCnt;
	}

	public void setAvalLangCnt(int avalLangCnt) {
		this.avalLangCnt = avalLangCnt;
	}

	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	
	
	public int getNoAvalLang() {
		return noAvalLang;
	}
	public void setNoAvalLang(int noAvalLang) {
		this.noAvalLang = noAvalLang;
	}
	public int getNoUser() {
		return noUser;
	}
	public void setNoUser(int noUser) {
		this.noUser = noUser;
	}
	public int getNoLang() {
		return noLang;
	}
	public void setNoLang(int noLang) {
		this.noLang = noLang;
	}	
}
