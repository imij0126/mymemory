package com.kh.view;

import java.util.Scanner;

import com.kh.controller.PlayController;
import com.kh.model.vo.User;

public class DisplayMenu {

	private Scanner sc = new Scanner(System.in);
	private PlayController pc = new PlayController();
	private User user = new User();
	
	public void mainMenu() {
		// 내용 출력 및 컨트롤러의 메소드 호출
		
		while(true) {
			System.out.println("===== Console Game =====");
			System.out.println("1. Up & Down");
			System.out.println("2. 가위바위보");
			System.out.println("3. 숫자 야구");
			System.out.println("9. 점수 조회");
			System.out.println("0. 게임 종료");
			System.out.println("=========================");
			System.out.print("메뉴 번호 : ");
			int menu = sc.nextInt();
			sc.nextLine();
			
			switch(menu) {
			case 1:
				pc.game01();
				break;
			case 2:
				pc.game02();
			case 3:
			case 9:
				user.toString();
			case 0:
				return;
			}
		}
		
	}
	
	
}
