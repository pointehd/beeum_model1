package com.beeum.beeum.vo;

public class AvalBee {
	public static final String TOUR_BEE = "T";
	public static final String KO_BEE = "K";
	public static final String HONEY_BEE = "H";
	public static final String BUMBLE_BEE = "B";
	public static final String WASP = "W";
	
	private int noAvalBee;
	private int noUser;
	private String type;
	
	
	public AvalBee() {
		super();
	}
	public int getNoAvalBee() {
		return noAvalBee;
	}
	public void setNoAvalBee(int noAvalBee) {
		this.noAvalBee = noAvalBee;
	}
	public int getNoUser() {
		return noUser;
	}
	public void setNoUser(int noUser) {
		this.noUser = noUser;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
