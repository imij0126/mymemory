package com.kh.practice;

public class ObjectRun {
	// 자바 프로그램 실행 시 필요한 메소드 : main
	public static void main(String[] args) {
		// 학생을 대상으로 프로그래밍을 해본다면..
		// "학생"을 객체로 선정!
		// 정보 -> 학번 이름 나이 성별
		// 기능 -> 정보 조회
		
		// 변수를 사용하여 학생의 정보를 관리한다면..
		int no1 = 100;				// 학번
		String name1 = "이혜인";		// 이름
		int age1 = 20;				// 나이
		char gender1 = '여';			// 성별
		
		int no2 = 101;
		String name2 = "카리나";
		int age2 = 26;
		char gender2 = '여';
		
		int no3 = 102;
		String name3 = "엄희윤";
		int age3 = 30;
		char gender3 = '남';
		// 너무 많은 변수가 사용되었다... 12개...
		
		// 배열을 사용해보자 (각 정보를 담을 배열)
		int[] noArr = {100, 101, 102};			 // 학번 정보를 담을 배열
		String[] nameArr = {"이혜인", "카리나", "엄희윤"};	// 이름 정보를 담을 배열
		int[] ageArr = {20, 26, 30};			// 나이 정보를 담을 배열
		char[] genderArr = {'여', '여', '남'};		// 성별 정보를 담을 배열
		
		/*
		// 첫번째 학생 정보
		noArr[0] = 100;
		nameArr[0] = "이혜인";
		ageArr[0] = 20;
		genderArr[0] = '여';
		*/
		
		// 클래스를 사용해보자 (서로다른 종류의 데이터를 한 공간에 저장)
		Student s1 = new Student();		// 클래스를 사용하려면 생성이라는 것을 해야 함. 클래스 이름과 똑같이 new! 
										//Student라는 클래스가 가지고 있는 변수들을 사용할 수 있게 된다.
//		s1.no = 100; 	// 클래스에 선언해 놓은 변수의 이름으로 접근
//		s1.name = "이혜인";
//		s1.age = 20;
//		s1.gender = '여';
		
		Student s2 = new Student();
//		s2.no = 200;
//		s2.name = "카리나";
		
		Student s3 = new Student("윈터");
		s3.getName();
		
//		s3.name = "윈터2";
		s3.setName("윈터2");
		
	}
	
}
