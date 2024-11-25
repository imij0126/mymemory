package com.kh.practice.chap01_poly.view;

import java.util.Scanner;

import com.kh.practice.chap01_poly.controller.LibraryController;
import com.kh.practice.chap01_poly.model.vo.Book;

public class LibraryMenu {
	
	private LibraryController lc = new LibraryController();
	private Scanner sc = new Scanner(System.in);
	
	public void mainMenu() {
		
		System.out.print("이름 : ");
		String name = sc.next();
		System.out.print("나이 : ");
		int age = sc.nextInt();
		System.out.print("성별 : ");
		char gender = sc.next().charAt(0);
		
		Member m = new Member(name, age, gender);
		lc.insertMember(m);
		
		while(true) {
			System.out.println("==== 메뉴 ====");
			System.out.println("1. 마이페이지");
			System.out.println("2. 도서 전체 조회");
			System.out.println("3. 도서 검색");
			System.out.println("4. 도서 대여하기");
			System.out.println("9. 프로그램 종료하기");
			System.out.print("메뉴 번호 : ");
			int menu = sc.nextInt();
			
			switch(menu) {
			case 1:
				lc.myInfo();
			case 2:
				selectAll();
			case 3:
				searchBook();
			case 4:
				rentBook();
			case 9:
				return;
			}
		}
		
	}
	
	public void selectAll() {
		Book[] bList = lc.selectAll();
		
		for (int i=0; i<bList.length; i++) {
			System.out.println(i + "번도서 : " + bList[i]);
		}
		
	}
	
	public void searchBook() {
		
	}
	
	public void rentBook() {
		
	}

}
