package com.sample.vo;

import org.apache.ibatis.type.Alias;

@Alias("searchVO")
public class SearchVO {
	// 경기장 번호
	private int fieldCode;
	// 경기장 이름
	private String fieldName;
	// 경기장 주소
	private String fieldAddress;
	// 경기장 휴대폰번호
	private String fieldCall;
	// 경기장 비용
	private int fieldRentalfee;
	// 경기장 타입
	private String fieldType;
	// 경기장 이미지 1,2,3,4,5
	private String fieldImg1;
	private String fieldImg2;
	private String fieldImg3;
	private String fieldImg4;
	private String fieldImg5;

	// 검색어 자동완성 텍스트
	private String searchText;
	// 팀 매치 작성 지도사용
	
	private String address;
	

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}


	public int getFieldCode() {
		return fieldCode;
	}

	public void setFieldCode(int fieldCode) {
		this.fieldCode = fieldCode;
	}

	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public String getFieldAddress() {
		return fieldAddress;
	}

	public void setFieldAddress(String fieldAddress) {
		this.fieldAddress = fieldAddress;
	}

	public String getFieldCall() {
		return fieldCall;
	}

	public void setFieldCall(String fieldCall) {
		this.fieldCall = fieldCall;
	}

	public int getFieldRentalfee() {
		return fieldRentalfee;
	}

	public void setFieldRentalfee(int fieldRentalfee) {
		this.fieldRentalfee = fieldRentalfee;
	}

	public String getFieldType() {
		return fieldType;
	}

	public void setFieldType(String fieldType) {
		this.fieldType = fieldType;
	}

	public String getFieldImg1() {
		return fieldImg1;
	}

	public void setFieldImg1(String fieldImg1) {
		this.fieldImg1 = fieldImg1;
	}

	public String getFieldImg2() {
		return fieldImg2;
	}

	public void setFieldImg2(String fieldImg2) {
		this.fieldImg2 = fieldImg2;
	}

	public String getFieldImg3() {
		return fieldImg3;
	}

	public void setFieldImg3(String fieldImg3) {
		this.fieldImg3 = fieldImg3;
	}

	public String getFieldImg4() {
		return fieldImg4;
	}

	public void setFieldImg4(String fieldImg4) {
		this.fieldImg4 = fieldImg4;
	}

	public String getFieldImg5() {
		return fieldImg5;
	}

	public void setFieldImg5(String fieldImg5) {
		this.fieldImg5 = fieldImg5;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
}
