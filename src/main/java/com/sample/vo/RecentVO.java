package com.sample.vo;

import org.apache.ibatis.type.Alias;

@Alias("recentVO")
public class RecentVO {
	private int searchNum;
	private String searchData;
	// 유저정보에서 받아온 코드
	private int userCode;

	public int getSearchNum() {
		return searchNum;
	}

	public void setSearchNum(int searchNum) {
		this.searchNum = searchNum;
	}

	public String getSearchData() {
		return searchData;
	}

	public void setSearchData(String searchData) {
		this.searchData = searchData;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

}
