package com.sample.vo;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

@Alias("commentVO")
public class ReviewCommentVO {
  private int reviewCode;
  private String userName;
  private String content;
  private String createDate;
  private int userCode;

  
  
  public int getUserCode() {
	return userCode;
}

public void setUserCode(int userCode) {
	this.userCode = userCode;
}

public String getCreateDate() {
    return createDate;
  }

  public void setCreateDate(String createDate) {
    this.createDate = createDate;
  }


  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

public String getUserName() {
	return userName;
}

public void setUserName(String userName) {
	this.userName = userName;
}

public int getReviewCode() {
	return reviewCode;
}

public void setReviewCode(int reviewCode) {
	this.reviewCode = reviewCode;
}

@Override
public String toString() {
	return "ReviewCommentVO [reviewCode=" + reviewCode + ", userName=" + userName + ", content=" + content
			+ ", createDate=" + createDate + ", userCode=" + userCode + "]";
}



  
  

}