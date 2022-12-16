package com.sample.vo;

import org.apache.ibatis.type.Alias;

@Alias("inquiryVO")
public class InquiryVO {
	// 문의코드
	private int inquiryCode;
	// 문의제목
	private String inquiryTitle;
	// 문의내용
	private String inquiryContent;
	// 문의상태
	private String inquiryState;
	// 문의작성일
	private String createDate;
	// 문의답변일
	private String answerDate;
	// 문의답변내용
	private String answerContent;
	// 유저코드
	private int userCode;
	// 유저이름
	private String userName;

	public int getInquiryCode() {
		return inquiryCode;
	}

	public void setInquiryCode(int inquiryCode) {
		this.inquiryCode = inquiryCode;
	}

	public String getInquiryTitle() {
		return inquiryTitle;
	}

	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}

	public String getInquiryContent() {
		return inquiryContent;
	}

	public void setInquiryContent(String inquiryContent) {
		this.inquiryContent = inquiryContent;
	}

	public String getInquiryState() {
		return inquiryState;
	}

	public void setInquiryState(String inquiryState) {
		this.inquiryState = inquiryState;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getAnswerDate() {
		return answerDate;
	}

	public void setAnswerDate(String answerDate) {
		this.answerDate = answerDate;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

}
