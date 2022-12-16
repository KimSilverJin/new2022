package com.sample.vo;

import org.apache.ibatis.type.Alias;

@Alias("DataVO")
public class DataVO {
	private String place;
	private String close;
	private String ygender;
	private String xgender;
	private String day;
	private String level;
	private String mver;
	private String type;
	private int code;
	private String time;
	
	//아래 세개 나중에 정리하기
	private int game_code;
	private int user_code;
	private int team_code;
	
	private int gameCode;
	private int teamCode;
	private int userCode;

	
	private String Tselect;
	private String Tsearch;
	
	
	


	public String getTselect() {
		return Tselect;
	}
	public void setTselect(String tselect) {
		Tselect = tselect;
	}
	public String getTsearch() {
		return Tsearch;
	}
	public void setTsearch(String tsearch) {
		Tsearch = tsearch;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getMver() {
		return mver;
	}
	public void setMver(String mver) {
		this.mver = mver;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getClose() {
		return close;
	}
	public void setClose(String close) {
		this.close = close;
	}
	public String getYgender() {
		return ygender;
	}
	public void setYgender(String ygender) {
		this.ygender = ygender;
	}
	public String getXgender() {
		return xgender;
	}
	public void setXgender(String xgender) {
		this.xgender = xgender;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public int getGame_code() {
		return game_code;
	}
	public void setGame_code(int game_code) {
		this.game_code = game_code;
	}
	public int getUser_code() {
		return user_code;
	}
	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}
	public int getTeam_code() {
		return team_code;
	}
	public void setTeam_code(int team_code) {
		this.team_code = team_code;
	}
	public int getGameCode() {
		return gameCode;
	}
	public void setGameCode(int gameCode) {
		this.gameCode = gameCode;
	}
	public int getTeamCode() {
		return teamCode;
	}
	public void setTeamCode(int teamCode) {
		this.teamCode = teamCode;
	}
	public int getUserCode() {
		return userCode;
	}
	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	
}
