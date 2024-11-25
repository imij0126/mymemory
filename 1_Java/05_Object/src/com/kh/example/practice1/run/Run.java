package com.kh.example.practice1.run;

import com.kh.example.practice1.model.vo.Member;

public class Run {

	public static void main(String[] args) {
		// 기본 생성자를 통해 Member 타입의 객체를 생성
		com.kh.example.practice1.model.vo.Member m = new Member();
		
		// changeName을 이용해 값을 변경
		// m.meberName = "이름";	private으로 접근제한을 두었기 때문에 접근 불가!
		m.changeName("이혜인");
		
		// printName을 이용해 출력
		// System.out.println(m.memberName);
		m.printName();
	}

}
