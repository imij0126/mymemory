package com.kh.hw.shape.controller;

import com.kh.hw.shape.model.vo.Shape;

public class SquareController {
	// 필드부 (변수)
	Shape s = new Shape();
	
	// 생성자부 : 생략! (기본생성자는 있을 것임)
	
	// 메소드부
	public double calcPerimeter(double height, double width) {
		// 매개변수로 넘어온 값을 Shape의 매개변수 있는 생성자에 넣어
		s = new Shape (4, height, width);
		// Shape의 필드들 초기화
		// 둘레 계산법을 통해 계산된 값 반환
		// 둘레 계산법 : 너비*2 + 높이*2
		return s.getWidth()*2 + s.getHeight()*2;
	}
	
	public double calcArea(double height, double width) {
		// 매개변수로 넘어온 값을 Shape의 매개변수 있는 생성자에 넣어
		s = new Shape(4, height, width);
		// Shape의 필드들 초기화
		// 면적 계산법을 통해 계산된 값 반환
		// 면적 계산법 : 넓이 : 너비 * 높이
		return s.getWidth() * s.getHeight();
	}
	
	public void paintColor(String color) {
		// setter를 통해 매개변수로 넘어온 값으로 변경
		s.setColor(color);
	}
	
	public String print() {
		// “사각형” + s.information()으로 삼각형의 정보 리턴
		return "사각형 " + s.information();
	}
	
}