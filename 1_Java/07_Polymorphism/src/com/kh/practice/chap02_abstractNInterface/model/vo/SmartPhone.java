package com.kh.practice.chap02_abstractNInterface.model.vo;

public abstract class SmartPhone implements CellPhone, TouchDisplay {
	
	private String maker;
	
	public SmartPhone() {}
	
	// 추상메소드 : 6개 (CellPhone - 4, TouchDisplay 0 1, 본인 것(SmartPhone) - 1)
	public abstract String printInformation();
	
	public void setMaker(String maker) {
		this.maker = maker;
	}

	public String getMaker() {
		return maker;
	}
	
}
