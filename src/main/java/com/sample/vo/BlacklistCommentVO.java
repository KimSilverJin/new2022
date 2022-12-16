package com.sample.vo;

import org.apache.ibatis.type.Alias;

@Alias("BlacklistcommentVO")
public class BlacklistCommentVO{
	private int commentCode;
	private int blackCode;
	private int userCode;
	private String userName;
	private String content;
	private String bcomentCreateDate;
	private int orderCode;
	private int isDelete;
	
	public int getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}
	public int getCommentCode() {
		return commentCode;
	}
	public void setCommentCode(int commentCode) {
		this.commentCode = commentCode;
	}
	public int getBlackCode() {
		return blackCode;
	}
	public void setBlackCode(int blackCode) {
		this.blackCode = blackCode;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getBcomentCreateDate() {
		return bcomentCreateDate;
	}
	public void setBcomentCreateDate(String bcomentCreateDate) {
		this.bcomentCreateDate = bcomentCreateDate;
	}
	public int getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}
	

	
	
	
}

