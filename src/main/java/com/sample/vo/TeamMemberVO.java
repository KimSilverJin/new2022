package com.sample.vo;

public class TeamMemberVO {
	
	// 팀 등록하기
	
	// 팀 고유번호
	private int teamCode;
	// 팀 이름
	private String teamName;
	// 팀원 이름 1~6
	private String tmember1;
	private String tmember2;
	private String tmember3;
	private String tmember4;
	private String tmember5;
	private String tmember6;

	//팀원의 유저코드 = db에서 불러올 예정, 팀원과 등록된 회원의 이름이 일치할경우
	private String userCode1;
	private String userCode2;
	private String userCode3;
	private String userCode4;
	private String userCode5;
	private String userCode6;
	
	public int getTeamCode() {
		return teamCode;
	}
	public void setTeamCode(int teamCode) {
		this.teamCode = teamCode;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getTmember1() {
		return tmember1;
	}
	public void setTmember1(String tmember1) {
		this.tmember1 = tmember1;
	}
	public String getTmember2() {
		return tmember2;
	}
	public void setTmember2(String tmember2) {
		this.tmember2 = tmember2;
	}
	public String getTmember3() {
		return tmember3;
	}
	public void setTmember3(String tmember3) {
		this.tmember3 = tmember3;
	}
	public String getTmember4() {
		return tmember4;
	}
	public void setTmember4(String tmember4) {
		this.tmember4 = tmember4;
	}
	public String getTmember5() {
		return tmember5;
	}
	public void setTmember5(String tmember5) {
		this.tmember5 = tmember5;
	}
	public String getTmember6() {
		return tmember6;
	}
	public void setTmember6(String tmember6) {
		this.tmember6 = tmember6;
	}
	public String getUserCode1() {
		return userCode1;
	}
	public void setUserCode1(String userCode1) {
		this.userCode1 = userCode1;
	}
	public String getUserCode2() {
		return userCode2;
	}
	public void setUserCode2(String userCode2) {
		this.userCode2 = userCode2;
	}
	public String getUserCode3() {
		return userCode3;
	}
	public void setUserCode3(String userCode3) {
		this.userCode3 = userCode3;
	}
	public String getUserCode4() {
		return userCode4;
	}
	public void setUserCode4(String userCode4) {
		this.userCode4 = userCode4;
	}
	public String getUserCode5() {
		return userCode5;
	}
	public void setUserCode5(String userCode5) {
		this.userCode5 = userCode5;
	}
	public String getUserCode6() {
		return userCode6;
	}
	public void setUserCode6(String userCode6) {
		this.userCode6 = userCode6;
	}

	
	

	
}
