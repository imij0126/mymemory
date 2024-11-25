package com.kh.example.practice4.model.vo;

public class Student {
	// 변수부(필드부)
	private static int grade;			// 학년
	private int classroom;		// 반
	private String name;		// 이름
	private double height;		// 키
	private char gender;		// 성별
	
	// 초기화 블록 - 보통 변수부와 생성자부 사이에 작성, 초기값으로 넣어 주고자 하는 값 넣기
//	{
//		grade = 1;
//		classroom = 7;
//		name = "이혜인";
//		height = 169.2;
//		gender = '여';
//	}
	
	public Student() {}
	
	public Student(int classroom, String name, double height, char gender) {
		this.classroom = classroom;
		this.name = name;
		this.height = height;
		this.gender = gender;
	}

	public void information() {
		System.out.println(
				"grade=" + grade + ", classroom=" + classroom
				+ ", name=" + name + ", height=" + height
				+ ", gender=" + gender
				);
	}
	
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	public int getClassroom() {
		return classroom;
	}
	public void setClassroom(int classroom) {
		this.classroom = classroom;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public double getHeight() {
		return height;
	}
	public void setHeight(double height) {
		this.height = height;
	}
	
	public char getGender() {
		return gender;
	}
	public void setGender(char gener) {
		this.gender = gender;
	}

}