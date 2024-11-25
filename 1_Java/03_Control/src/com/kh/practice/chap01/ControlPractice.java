package com.kh.practice.chap01;

import java.util.Scanner;

public class ControlPractice {
	
	public void practice1() {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("1. 입력");
		System.out.println("2. 수정");
		System.out.println("3. 조회");
		System.out.println("4. 삭제");
		System.out.println("7. 종료");
		
		System.out.print("메뉴 번호를 입력하세요 : ");
		int menu = sc.nextInt();
		
		//메뉴 1을 선택했을 때, => menu 변수의 값이 1과 같다면
		if (menu == 1) {
			System.out.println("입력 메뉴입니다.");
		} //메뉴 2를 선택했을 때, => menu 변수의 값이 2와 같다면
		else if (menu ==2) {
			System.out.println("수정 메뉴입니다.");
		} //메뉴 3을 선택했을 때, => menu 변수의 값이 3과 같다면
		else if (menu == 3) {
			System.out.println("조회 메뉴입니다.");
		} //메뉴 4를 선택했을 때, => menu 변수의 값이 4와 같다면
		else if (menu == 4) {
			System.out.println("삭제 메뉴입니다.");
		} // 메뉴 7을 선택했을 때, => menu 변수의 값이 7이라면
		else if (menu == 7) {
			System.out.println("프로그램이 종료됩니다.");
		}
		else {
			System.out.println("프로그램이 종료됩니다.");
		}
	}

	//=============================================
	
	public void practice2() {
		Scanner sc = new Scanner(System.in);
		
		System.out.print("숫자를 한 개 입력하세요 : ");
		
		int num = sc.nextInt();
		
		//입력받은 값 (num 변수)이 양수인지
		if (num > 0) {
			//입력받은 값이 짝수인지
			if (num % 2 == 0) {
				System.out.println("짝수다");
			}
				else { //홀수인 경우
					System.out.println("홀수다");
				}
			} else { //그렇지 않으면 (0, 음수)
				System.out.println("양수만 입력해주세요.");
			}
			}

	/*if (num > 0 && num % 2 == 0) {
		System.out.println("짝수다");
	} else if (num > 0 && num % 2 != 0) {;
		System.out.println("홀수다");
	} else if (num <= 0) {
		System.out.println("양수만 입력해주세요.");
			}
		}
*/

	//==========================================
	
		public void practice3() {
			Scanner sc = new Scanner(System.in);
			
			System.out.print("국어점수 : ");
			int k = sc.nextInt();
			
			System.out.print("수학점수 : ");
			int m = sc.nextInt();
			
			System.out.print("영어점수 : ");
			int e = sc.nextInt();
			
/*			if (k >= 40) {
				if (m >= 40) {
					if (e >= 40) {
						if ((k+m+e) / 3 > 60)
							
							System.out.println("국어 : " + k);
							System.out.println("수학 : " + m);
							System.out.println("영어 : " + e);
							System.out.println("합계 : " + (k+m+e));
							System.out.println("평균 : " + (double)((k+m+e)/3));
							System.out.println("축하합니다, 합격입니다!");
					}
						else {
							System.out.println("불합격입니다.");
						}
					}
				}
				*/
			
			if (k >= 40 && m >= 40 && e >= 40) {
				
				int total = k + m + e;
				double avg = total / 3;
				
				if (avg >= 60) {
					System.out.println("국어: " + k);
					System.out.println("수학: " + m);
					System.out.println("영어: " + e);
					System.out.println("합계: " + total);
					System.out.println("평균 : " + avg);
					System.out.println("축하합니다, 합격입니다!");
				} else {
					System.out.println("불합격입니다.");
				}
						
			} else {
				System.out.println("불합격입니다.");
			}
			
			}
		
	//===============================================
		
		public void practice4() {
			Scanner sc = new Scanner(System.in);
			
			System.out.print("1~12 사이의 정수 입력 : ");
			int month = sc.nextInt();
			
			//1~12 사이의 값인지 체크
				String season = "";
				switch(month) {
				case 1:
				case 2:
				case 12:
					season = "겨울";
					break;
				case 3:
				case 4:
				case 5:
					season = "봄";
					break;
				case 6:
				case 7:
				case 8:
					season = "여름";
					break;
				case 9:
				case 10:
				case 11:
					season = "가을";
					break;
					default:
						season = "해당하는 계절이 없습니다.";
				}
				if (month >= 1 && month <= 12) {
				System.out.println(month + "월은" + season + "입니다.");
			} else
				System.out.println(month + "월은 잘못 입력된 달입니다.");
			}
			
			
			
			
			
			
			/*int n = sc.nextInt();
			
			switch(n) {
				
			case 3:
			case 4:
			case 5:	
				System.out.println(n + "월은 봄입니다.");
				break;
			case 6:
			case 7:
			case 8:
				System.out.println(n + "월은 여름입니다.");
				break;
			case 9:
			case 10:
			case 11:
				System.out.println(n + "월은 가을입니다.");
			case 1:
			case 2:
			case 12:
				System.out.println(n + "월은 겨울입니다.");
				break;
				
			default:
				System.out.println(n + "월은 잘못 입력된 달입니다.");
			}
		}
		*/
		
		//====================================================
		
		public void practice5() {
			//문자열은 동등 비교가 되지 않는다, equals
		Scanner sc = new Scanner(System.in);
		
		System.out.print("아이디 : ");
		String id = sc.nextLine();
		
		System.out.print("비밀번호 : ");
		String pw = sc.nextLine();
		
		//입력된 아이디 값이 "myId"이고, 입력된 비밀번호 값이 "myPassword12"인 경우 => 로그인 성공
		if (id.equals("myId") && pw.equals("myPassword12")) {
			System.out.println("로그인 성공");
		} else if (!id.equals("myId")) {
			System.out.println("아이디가 틀렸습니다.");
		} else {
			System.out.println("비밀번호가 틀렸습니다.");
		}
		//---------------------------------------------
	/*	if (!id.equals("myId")) {
			System.out.println("아이디가 틀렸습니다.");
		} else if (!pw.equals("myPassword12")) {
			System.out.println("비밀번호가 틀렸습니다.");
		} else {
			System.out.println("로그인 성공");
		}
		*/
		/*if (id.equals("myId")) {
					
			if (pw.equals("myPassword12")) {
				System.out.println("로그인 성공");
			} else
				System.out.println("비밀번호가 틀렸습니다.");
			
		} else
			System.out.println("아이디가 틀렸습니다.");
		}*/
		}
		//====================================================
		
		public void practice6() {
			
			Scanner sc = new Scanner(System.in);
			
			System.out.print("권한을 확인하고자 하는 회원 등급 : ");
			String grade = sc.next();
			
			/*
			 * 관리자 : 회원관리, 게시글 관리, 게시글 작성, 게시글 조회, 댓글 작성
			 * 회원 : 게시글 작성, 게시글 조회, 댓글 작성
			 * 비회원 : 게시글 조회
			 */
			
			//선생님이 작성한 코드
/*			if (grade.equals("관리자") ) {
				System.out.println("회원관리, 게시글 관리, 게시글 작성, 게시글 조회, 댓글 작성");
			} else if (grade.equals("회원")) {
				System.out.println("게시글 작성, 게시글 조회, 댓글 작성");
			} else if (grade.equals("비회원")) {
				System.out.println("게시글 조회");
			} else {
				System.out.println("잘못 입력했습니다.");
			}/*
			
			//내가 작성한 코드
			/*String a = "회원 관리, 게시글 관리";
			String b = "게시글 작성, 게시글 조회";
			String c = "게시글 조회";
					
			if (grade.equals("관리자")) {
				System.out.println(a + ", " + b + ", " + c);
			} else if(grade.equals("회원")) {
				System.out.println(b + ", "+ c);
			} else if(grade.equals("비회원")) {
				System.out.println(c);
			} else {
				System.out.println("잘못 입력했습니다.");
			}
			*/
			
//			switch문으로도 가능, 바꿔 보기
			
			//선생님이 작성한 코드 switch로 바꿈
			switch (grade) {
			case "관리자":
				System.out.println("회원관리, 게시글 관리, 게시글 작성, 게시글 조회, 댓글 작성");
				break;
			case "회원":
				System.out.println("게시글 작성, 게시글 조회, 댓글 작성");
				break;
			case "비회원":
				System.out.println("게시글 조회");
				break;
			default:
				System.out.println("잘못 입력했습니다.");
			}
		}
		
		public void practice7() {
			Scanner sc = new Scanner(System.in);
			
			System.out.print("키(m)를 입력해 주세요 : ");
			double height = sc.nextDouble();
			System.out.print("몸무게(kg)를 입력해 주세요 : ");
			double weight = sc.nextDouble();
			
			double bmi = weight / (height * height);
			System.out.println("BMI 지수 : " + bmi);
			
			if (bmi < 18.5) {
				System.out.println("저체중");
			} else if (bmi >= 18.5 && bmi < 23) {
				System.out.println("정상체중");
			} else if (bmi >= 23 && bmi < 25) {
				System.out.println("과체중");
			} else if (bmi >= 25 && bmi < 30) {
				System.out.println("비만");
			} else {
				System.out.println("고도 비만");
			}
		}
		
		//===============================================
		
		public void practice8() {
			
			Scanner sc = new Scanner(System.in);
			
			System.out.print("피연산자1 입력 : ");
			int num1 = sc.nextInt();
			
			System.out.print("피연산자2 입력 : ");
			int num2 = sc.nextInt();
			
			System.out.print("연산자를 입력 : ");
			String op = sc.next();
			
			if (num1 > 0 && num2 > 0) {
				
				switch(op) {
				case "+":		//op.equals("+"+ =? true
					System.out.printf("%d %s %d = %d", 
							num1, op, num2, (num1 + num2));
					break;
				case "-":
					System.out.printf("%d %s %d = %d,",
							num1, op, num2, (num1 - num2));
					break;
				case "*":
					System.out.printf("%d %s %d = %d",
							num1, op, num2, (num1 * num2));
					break;
				case "/":
					System.out.printf("%d %s %d = %f",
							num1, op, num2, ((double)num1 / num2));
					break;
				case "%":
					System.out.printf("%d %s %d = %f",
							num1, op, num2, ((double)num1 % num2));
					break;
					default:
						System.out.println("잘못 입력하셨습니다. 프로그램을 종료합니다.");
				}
				
				/*if (op == "+") {
					System.out.println(n1 + " + " + n2 + " = " + (n1+n2));
				} else if (op == "-") {
					System.out.println(n1 + " - " + n2 + " = " + (n1-n2));
				} else if  (op == "*") {
					System.out.println(n1 + " * " + n2 + " = " + (n1*n2));
				} else if (op == "/") {
					System.out.println(n1 + " / " + n2 + " = " + (n1/n2));
				} else if (op == "%") {
					System.out.println(n1 + " % " + n2 + " = " + (n1%n2));
				} */
				
			}else {
					System.out.println("잘못 입력하셨습니다. 프로그램을 종료합니다.");
				}
				
			}
				
//		=======================================================
		
		public void practice9() {
			
			Scanner sc = new Scanner(System.in);
			
			System.out.print("중간 고사 점수 : ");
			int mid = sc.nextInt();
			
			System.out.print("기말 고사 점수 : ");
			int fin = sc.nextInt();
			
			System.out.print("과제 점수 : ");
			int hw = sc.nextInt();
			
			System.out.print("출석 회수 : ");
			int at = sc.nextInt();
			
			System.out.println("========결과========");
			
			double midP = mid * 0.2;
			double finP = fin * 0.3;
			double hwP = hw * 0.3;
			double atP = at;
					
			double total = midP + finP + hwP + atP;
			
			// 전체 강의의 30% 이상 결석 => 70% 초과 출석 시 통과
			// 20 * 0.7
			int passAt = (int)(20 * 0.7);
			if (passAt >= at) {		//14 > at
				System.out.println("Fail [출석 회수 부족(" + at + "/20)]");
			} else {
				
				System.out.println("중간 고사 점수(20) : " + midP);
				System.out.println("기말 고사 점수(30) : " + finP);
				System.out.println("과제 점수(30) : " + hwP);
				System.out.println("출석 점수(20) : " + atP);
				System.out.println("총점 : " + total);
				
				if (total >= 70) {
					System.out.println("PASS");
				} else {
					System.out.println("Fail [점수 미달]");
				}
			}
			
			for(int i = 0; i < 5; i++) {
				System.out.println("Happy");
				}
			
	}
}
		
		

