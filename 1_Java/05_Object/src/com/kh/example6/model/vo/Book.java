package com.kh.example6.model.vo;

public class Book {
	
	//필드부 (변수)
	private String title;
	private String publisher;
	private String author;
	private int price;
	private double discountRate;
	
	// 생성자부
	public Book() {}	// 기본 생성자 : 초기화할 데이터 없이 객체 생성
	
	// 매개변수가 3개인 생성자 : 전달된 데이터를 변수에 초기화하여 객체 생성
	public Book(String title, String publisher, String author) {
		this.title = title;
		this.publisher = publisher;
		this.author = author;
	}
	
	// 매개변수가 5개인 생성자
	public Book(String title, String publisher, String author, int price, double discountRate) {
		this.title = title;
		this.publisher = publisher;
		this.author = author;
		this.price = price;
		this.discountRate = discountRate;
	}
	
	// 메소드부
	public void inform() {	//toString
		// 정보를 출력 : 현재 클래스의 필드(변수)의 값을 출력
		System.out.printf("title=%s, publisher=%s, author=%s, price=%d, discountRate=%f\n"
						, title, publisher, author, price, discountRate);
		/*
		System.out.println(title);
		System.out.println(publisher);
		System.out.println(author);
		System.out.println(price);
		System.out.println(discountRate);
		*/
	}

}
