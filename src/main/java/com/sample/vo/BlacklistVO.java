package com.sample.vo;

import org.apache.ibatis.type.Alias;

@Alias("BlacklistVO")
public class BlacklistVO {
	private int blacklistCode;
	private String userId;
	private String buserName;
	private int userCode;
	private String blacklistTitle;
	private String blacklistContent;
	private String blacklistCreateDate;
	private String blacklistLocal;
	private int isDelete;
	private int blackuserCode;
	private String userName;
	private int count;
	private String userBlack;
	
	private String suserCode;
	private String sblackuserCode;

	
	
	public String getSuserCode() {
		return suserCode;
	}
	public void setSuserCode(String suserCode) {
		this.suserCode = suserCode;
	}
	public String getSblackuserCode() {
		return sblackuserCode;
	}
	public void setSblackuserCode(String sblackuserCode) {
		this.sblackuserCode = sblackuserCode;
	}
	public String getUserBlack() {
		return userBlack;
	}
	public void setUserBlack(String userBlack) {
		this.userBlack = userBlack;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getBlackuserCode() {
		return blackuserCode;
	}
	public void setBlackuserCode(int blackuserCode) {
		this.blackuserCode = blackuserCode;
	}
	public int getBlacklistCode() {
		return blacklistCode;
	}
	public void setBlacklistCode(int blacklistCode) {
		this.blacklistCode = blacklistCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getBuserName() {
		return buserName;
	}
	public void setBuserName(String buserName) {
		this.buserName = buserName;
	}
	public String getBlacklistTitle() {
		return blacklistTitle;
	}
	public void setBlacklistTitle(String blacklistTitle) {
		this.blacklistTitle = blacklistTitle;
	}
	public String getBlacklistContent() {
		return blacklistContent;
	}
	public void setBlacklistContent(String blacklistContent) {
		this.blacklistContent = blacklistContent;
	}
	public String getBlacklistCreateDate() {
		return blacklistCreateDate;
	}
	public void setBlacklistCreateDate(String blacklistCreateDate) {
		this.blacklistCreateDate = blacklistCreateDate;
	}
	public String getBlacklistLocal() {
		return blacklistLocal;
	}
	public void setBlacklistLocal(String blacklistLocal) {
		this.blacklistLocal = blacklistLocal;
	}
	public int getUserCode() {
		return userCode;
	}
	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}
	public int getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}


	

}
