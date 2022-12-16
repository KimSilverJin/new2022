package com.sample.vo;

import java.util.List;

public class ReviewPageVO {
	
	List<ReviewCommentVO> list;
	
	PageMakerVO pageInfo;

	public List<ReviewCommentVO> getList() {
		return list;
	}

	public void setList(List<ReviewCommentVO> list) {
		this.list = list;
	}

	public PageMakerVO getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageMakerVO pageInfo) {
		this.pageInfo = pageInfo;
	}

	@Override
	public String toString() {
		return "ReviewPageVO [list=" + list + ", pageInfo=" + pageInfo + "]";
	}
	
	
	
	
}
