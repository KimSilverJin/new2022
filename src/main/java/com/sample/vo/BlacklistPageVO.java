package com.sample.vo;

public class BlacklistPageVO {
	// 현재 페이지
	private int nowPage;
	// 시작 페이지
	private int startPage;
	// 종료 페이지
	private int endPage;
	// 전체 페이지
	private int totalPage;
	// 총 row 개수
	private int total;
	// 블럭당 페이지 개수
	private int cntPerPage;
	// 마지막 페이지
	private int lastPage;
	// 처음 row
	private int start;
	// 끝 row
	private int end;
	// 처음 블록
	private int startBlock;
	// 마지막 블록
	private int endBlock;
	// 현재 블록
	private int nowBlock;
	// 블록 당 페이지
	private int cntPerBlock;

	private String blacklistLocal;
	
	public String getBlacklistLocal() {
		return blacklistLocal;
	}

	public void setBlacklistLocal(String blacklistLocal) {
		this.blacklistLocal = blacklistLocal;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCntPerPage() {
		return cntPerPage;
	}

	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getStartBlock() {
		return startBlock;
	}

	public void setStartBlock(int startBlock) {
		this.startBlock = startBlock;
	}

	public int getEndBlock() {
		return endBlock;
	}

	public void setEndBlock(int endBlock) {
		this.endBlock = endBlock;
	}

	public int getNowBlock() {
		return nowBlock;
	}

	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}

	public int getCntPerBlock() {
		return cntPerBlock;
	}

	public void setCntPerBlock(int cntPerBlock) {
		this.cntPerBlock = cntPerBlock;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
}
