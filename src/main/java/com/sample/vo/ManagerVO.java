package com.sample.vo;

import org.apache.ibatis.type.Alias;

@Alias("managerVO")
public class ManagerVO {
	private int mgrCode;
	private String preferArea;
	private String mgrContent;
	private String mgrDate;
	private String mgrState;
	private int userCode;

	private int fieldCode;

	private String userName;

	public int getMgrCode() {
		return mgrCode;
	}

	public void setMgrCode(int mgrCode) {
		this.mgrCode = mgrCode;
	}

	public String getPreferArea() {
		return preferArea;
	}

	public void setPreferArea(String preferArea) {
		this.preferArea = preferArea;
	}

	public String getMgrContent() {
		return mgrContent;
	}

	public void setMgrContent(String mgrContent) {
		this.mgrContent = mgrContent;
	}

	public String getMgrDate() {
		return mgrDate;
	}

	public void setMgrDate(String mgrDate) {
		this.mgrDate = mgrDate;
	}

	public String getMgrState() {
		return mgrState;
	}

	public void setMgrState(String mgrState) {
		this.mgrState = mgrState;
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

	public int getFieldCode() {
		return fieldCode;
	}

	public void setFieldCode(int fieldCode) {
		this.fieldCode = fieldCode;
	}

}
