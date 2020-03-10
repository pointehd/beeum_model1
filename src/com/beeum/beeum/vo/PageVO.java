package com.beeum.beeum.vo;

public class PageVO {

	private int start, end;
	private String order, cityNos, region, bee, theme;
	private String[] themes;
	
	public PageVO() {
	}
	
	public PageVO(int pageNo, int numPage) {
		end = pageNo*numPage;
		start = end - (numPage-1);
		//this.order = "reg_date";
	}
	
	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getBee() {
		return bee;
	}

	public void setBee(String bee) {
		this.bee = bee;
	}

	public String[] getThemes() {
		return themes;
	}

	public void setThemes(String[] themes) {
		this.themes = themes;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getCityNos() {
		return cityNos;
	}

	public void setCityNos(String cityNos) {
		this.cityNos = cityNos;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}
	
	
	
}//PageVO end
