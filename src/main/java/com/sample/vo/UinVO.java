package com.sample.vo;

import org.apache.ibatis.type.Alias;

@Alias("UinVO")
public class UinVO {
	private int userCode;
	private String userName;
	private String userGender;
	private String userGroup;
	private double userVr;
	private String userLevel;
	private int teamCode;
	private int userScore;
	
	
	public int getUserScore() {
		return userScore;
	}
	public void setUserScore(int userScore) {
		this.userScore = userScore;
	}
	public int getUserCode() {
		return userCode;
	}
	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserGroup() {
		return userGroup;
	}
	public void setUserGroup(String userGroup) {
		this.userGroup = userGroup;
	}
	public double getUserVr() {
		return userVr;
	}
	public void setUserVr(double userVr) {
		this.userVr = userVr;
	}
	public String getUserLevel() {
		return userLevel;
	}
	public void setUserLevel(String userLevel) {
		this.userLevel = userLevel;
	}
	public int getTeamCode() {
		return teamCode;
	}
	public void setTeamCode(int teamCode) {
		this.teamCode = teamCode;
	}
	
	
}
