package com.sample.vo;

public class GameFieldInfoVO {
	
	// 구장번호  
	private int fieldCode;
	// 경기 장소
	private String gamePlace;
	// 구장이름
	private String fieldName;
	// 구장주소
	private String fieldAddress;
	// 구장연락처
	private String fieldCall;
	// 구장대여비
	private int fieldRentalfee;
	// 구장형태
	private String fieldType;
	// 구장사진 1,2,3,4, 5
	private String fieldImg1;
	private String fieldImg2;
	private String fieldImg3;
	private String fieldImg4; 
	private String fieldImg5;
	
	private String address;
	
	
	private String fieldSize;
	private String fieldInOut;
	private String fieldGrass;
	
	//private MultipartFile[] mediaFile;
	
	
	
	
//	public MultipartFile[] getMediaFile() {
//		return mediaFile;
//	}
//	public void setMediaFile(MultipartFile[] mediaFile) {
//		this.mediaFile = mediaFile;
//	}
	public String getGamePlace() {
		return gamePlace;
	}
	public void setGamePlace(String gamePlace) {
		this.gamePlace = gamePlace;
	}
	public String getFieldSize() {
		return fieldSize;
	}
	public void setFieldSize(String fieldSize) {
		this.fieldSize = fieldSize;
	}
	public String getFieldInOut() {
		return fieldInOut;
	}
	public void setFieldInOut(String fieldInOut) {
		this.fieldInOut = fieldInOut;
	}
	public String getFieldGrass() {
		return fieldGrass;
	}
	public void setFieldGrass(String fieldGrass) {
		this.fieldGrass = fieldGrass;
	}
	
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
	public void setFieldRentalfee(int fieldRentalFee) {
		this.fieldRentalfee = fieldRentalFee;
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
	
}
