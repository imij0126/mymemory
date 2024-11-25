package com.kh.chap01_beforeVSafter.after.model.vo;

public class Product {
	
// Product라는 이름의 클래스의 Desktop, Tv, SamrtPhone 클래스들의 공통적인 필드/메소드를 작성해보자.
	
	// 필드부 -> Desktop, Tv, SmartPhone 클래스의 공통되는 필드들 정의
	private String brand;
	private String code;
	private String name;
	private int price;
	
	// 생성자부
	// 기본 생성자
	public Product() {}
	
	//모든 필드를 매개변수로 갖는 생성자
	public Product(String brand, String code, String name, int price) {
		this.brand = brand;
		this.code = code;
		this.name = name;
		this.price = price;
	}
	
	// 메소드부
	public String information() {
		return "brand=" + brand
				+ ", code=" + code
				+ ", name=" + name
				+ ", price=" + price;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
}
