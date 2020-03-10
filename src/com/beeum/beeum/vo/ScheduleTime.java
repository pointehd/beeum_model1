package com.beeum.beeum.vo;

import java.sql.Timestamp;

public class ScheduleTime {
	private int noScheTime;
	private int noUser;
	private Timestamp startTime;
	private Timestamp endTime;
	
	
	public ScheduleTime() {
	}
	public int getNoScheTime() {
		return noScheTime;
	}
	public void setNoScheTime(int noScheTime) {
		this.noScheTime = noScheTime;
	}
	public int getNoUser() {
		return noUser;
	}
	public void setNoUser(int noUser) {
		this.noUser = noUser;
	}
	public Timestamp getStartTime() {
		return startTime;
	}
	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}
	public Timestamp getEndTime() {
		return endTime;
	}
	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}
	
	
}
