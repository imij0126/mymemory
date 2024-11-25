package com.kh.practice.map.view;

import java.util.Map.Entry;
import java.util.Scanner;
import java.util.TreeMap;

import com.kh.practice.map.controller.MemberController;
import com.kh.practice.map.model.vo.Member;

public class MemberMenu {

	private Scanner sc = new Scanner(System.in);
	private MemberController mc = new MemberController();
	
	public void mainMenu() {
		
		System.out.println("========== KH 사이트 ==========");
		while(true) {
			System.out.println("******* 메인 메뉴 *******");
			System.out.println("1. 회원가입");
			System.out.println("2. 로그인");
			System.out.println("3. 같은 이름 회원 찾기");
			System.out.println("9. 종료");
			
			System.out.print("메뉴 번호 선택 : ");
			int menu = sc.nextInt();
			sc.nextLine();
			
			switch(menu) {
			case 1:
				joinMembership(); break;
			case 2:
				logIn(); memberMenu(); break;
			case 3:
				sameName(); break;
			case 9:
				System.out.println("프로그램 종료"); return;
			default:
				System.out.println("잘못 입력하였습니다. 다시 입력해주세요."); break;
			}
		}
		
	}
	
	public void memberMenu() {
		while(true) {
			System.out.println("******* 회원 메뉴 *******");
			System.out.println("1. 비밀번호 바꾸기");
			System.out.println("2. 이름 바꾸기");
			System.out.println("3. 로그아웃");
			System.out.print("메뉴 번호 선택 : ");
			
			int menu = sc.nextInt();
			sc.nextLine();
			
			switch(menu) {
			case 1:
				changePassword(); break;
			case 2:
				changeName(); break;
			case 3:
				System.out.println("로그아웃 되었습니다."); return;
			default:
				System.out.println("잘못 입력하였습니다. 다시 입력해주세요");
			}
		}
		
	}
	
	public void joinMembership() {
//		회원가입하기 위해 아이디, 비밀번호, 이름을 받고 비밀번호와 이름은
//		Member객체에 담고 id와 객체는 MemberController(mc)의 joinMembership()로 보냄.
//		받은 결과에 따라 true면 “성공적으로 회원가입 완료하였습니다.”,
//		false면 “중복된 아이디입니다. 다시 입력해주세요.” 출력
		while(true) {
			System.out.print("아이디 : ");
			String id = sc.nextLine();
			
			System.out.print("비밀번호 : ");
			String password = sc.nextLine();
			
			System.out.print("이름 : ");
			String name = sc.nextLine();
			
			// 비밀번호와 이름은 Member 객체에 담고 --> Member(비밀번호, 이름)
			Member member = new Member(password, name);
			
			// id와 객체를 컨트롤러에게 전달
			boolean result = mc.joinMembership(id, member);
			
			if (result) {
				System.out.println("성공적으로 회원가입 완료하였습니다.");
				break;
			} else {
				System.out.println("중복된 아이디입니다. 다시 입력해주세요.");
			}
		}
		
	}
	
	public void logIn() {
		// 전달 받은 id가 존재하는지 확인 후 존재하면 Member에 저장된 비밀번호와
		// 사용자가 입력한 비밀번호가 같은지 비교.
		// 같다면 저장된 Member의 이름 반환, 그 외 모든 상황에는 null 반환
		while(true) {
			System.out.print("아이디 : ");
			String id = sc.nextLine();
			
			System.out.print("비밀번호 : ");
			String password = sc.nextLine();
			
			String name = mc.logIn(id, password);
			// login 결과 : 이름
			if (name != null) {
				System.out.println(name +"님, 환영합니다!");
				break;
			} else {
				System.out.println("틀린 아이디 또는 비밀번호입니다. 다시 입력해주세요.");
			}
		}
	}
	
	public void changePassword() {
//		아이디와 비밀번호, 변경할 비밀번호를 받아 mc의 chagePassword()로 보냄.
//		받은 결과 값이 true면 “비밀번호 변경에 성공했습니다.”,
//		false면 “비밀번호 변경에 실패했습니다. 다시 입력해주세요.” 출력 후 반복
		
		while(true) {
		System.out.print("아이디 : ");
		String id = sc.nextLine();
		
		System.out.print("현재 비밀번호 : ");
		String oldPw = sc.nextLine();
		
		System.out.print("새로운 비밀번호 : ");
		String newPw = sc.nextLine();
		
		boolean result = mc.changePassword(id, oldPw, newPw);
		if(result) {
			System.out.println("비밀번호 변경에 성공했습니다.");
			break;
		} else {
			System.out.println("비밀번호 변경에 실패했습니다. 다시 입력해주세요.");
		}
		}
	}
	
	public void changeName() {
//		아이디와 비밀번호를 받아 mc의 logIn()으로 넘겨 현재 저장되어 있는 이름을 받고
//		사용자에게 현재 저장되어 있는 이름을 출력하여 보여줌.
//		변경할 이름을 받아 mc의 chageName()로 id와 함께 넘기고
//		“이름 변경에 성공하였습니다.” 출력
//		만일 logIn()로부터 저장되어 있는 이름을 받지 못 했다면
//		“이름 변경에 실패했습니다. 다시 입력해주세요” 출력 후 반복
		while(true) {
			System.out.print("아이디 : ");
			String id = sc.nextLine();
			
			System.out.print("비밀번호 : ");
			String password = sc.nextLine();
			
			String name = mc.logIn(id, password);
			if(name != null) {
				System.out.println("현재 설정된 이름 : " + name);
				
				System.out.print("변경할 이름 : ");
				String newName = sc.nextLine();
				
				mc.changeName(id, newName);
				
				System.out.println("이름 변경에 성공하였습니다.");
				break;
			} else {
				System.out.println("이름 변경에 실패했습니다. 다시 입력해주세요.");
			}
		}
		
	}
	
	public void sameName() {
//		검색할 이름을 받고 mc의 sameName()메소드로 넘김.
//		반환 값을 가지고 entrySet()을 이용하여 ‘이름-아이디’ 형식으로 출력
		
		System.out.print("검색할 이름 : ");
		String name = sc.nextLine();
		
		TreeMap result = mc.sameName(name);
		// 검색 결과가 있는지 여부 확인
		if(result.isEmpty()) {
			System.out.println("검색 결과가 없습니다.");
		} else {
			for(Object entry: result.entrySet()) {
				Entry<String, String> e = (Entry)entry;
				// "이름"-"아이디" 형식으로 출력
				System.out.println(e.getValue() + "-" + e.getKey());
			}
			
		}
		
		
	}
	
}
