package com.kh.practice.student.controller;

import com.kh.practice.student.model.vo.Student;

public class StudentController {
	// 필드부
	private Student[] sArr = new Student[5];
	public static final int CUT_LINE = 60;
	
	// 생성자
	public StudentController() {
		// 방법1
		sArr[0] = new Student("김길동", "자바", 100);
		sArr[1] = new Student("박길동", "디비", 50);
		sArr[2] = new Student("이길동", "화면", 85);
		sArr[3] = new Student("정길동", "서버", 60);
		sArr[4] = new Student("홍길동", "자바", 20);
		
		// 방법2
		/*
		Student[] init = {
				new Student("김길동", "자바", 100),
				new Student("박길동", "디비", 50),
				new Student("이길동", "화면", 85),
				new Student("정길동", "서버", 60),
				new Student("홍길동", "자바", 20)
				};
		sArr = init;
		*/
	}
	
	// 메소드
	// getter의 역할을 하는 메소드
	public Student[] printStudent() {
		return sArr;
	}
	
	public int sumScore() {
		// 객체 배열의 점수의 합을 반환
		// Student 클래스에 점수를 저장하는 변수: score
		int total = 0;
		
		// 방법1
		for (int i=0; i<sArr.length; i++) {
			total += sArr[i].getScore();
		}
		
		return total;
		
		// 방법2 :향상된 for문
		/*	// 첫번째 방법과 동일하게 동작될 것.
		int t2 = 0;
		for (Student s : sArr) {
			t2 += s.getScore();
		}
		*/
	}
	
	public double[] avgScore() {
		// 1. double 배열을 만들기
		double[] avg = new double[2];
		
		// 2. sumScore의 리턴 값을 0번째 인덱스에 저장
		int total = sumScore();
		avg[0] = total;
		
		// 3. 합의 평균을 1번째 인덱스에 저장
		//     평균 = 총합 / 총개수;
		avg[1] = total / sArr.length;
		
		// 4. 배열 리턴
		return avg;
	}
}




