package com.sample.vo;

import org.apache.ibatis.type.Alias;

@Alias("SjoinVO")
public class SjoinVO {
	private int gameNum;
	private int userCode;
	public int getGameNum() {
		return gameNum;
	}
	public void setGameNum(int gameNum) {
		this.gameNum = gameNum;
	}
	public int getUserCode() {
		return userCode;
	}
	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}
	
}
