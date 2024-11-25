package com.kh.controller;

import java.util.Scanner;

import com.kh.model.vo.User;

public class PlayController {

	
	private Scanner sc = new Scanner(System.in);
	private User user = new User();
	
	public void game01() {
		// 1 ~ 50 사이의 랜덤값을 추출해서 저장하고 사용자로부터 정수를 입력받은 뒤
		// 랜덤값보다 크면 "Down" 출력, 작으면 "Up" 출력
		// 같은값이면 "Catch" 출력 후 User 에 점수 10점 추가 (단, 5번 기회안에 성공해야 점수 획득)
		
		int score = 0;
		int num = (int)(Math.random() * 50 + 1);
		int count = 0;
		
		while(count < 5) {
			System.out.println("정수를 입력하세요(1 ~ 50 사이) : ");
			int userNum = sc.nextInt();
			
			if (userNum>num) {
				System.out.println("Down");
				
			} else if (userNum<num) {
				System.out.println("Up");
				
			} else if (userNum == num) {
				System.out.println("Catch");
				score += 10;
				count++;
				System.out.println("정답은 " + num + "입니다.");
				user.setScore(user.getScore() + score);
				return;
			}
			count++;
		}
			System.out.println("기회가 끝났습니다. 정답은 " + num + "입니다.");
	}
	
	public void game02() {
		/*
		랜덤값 (1, 2, 3) 을 뽑아서 [1인 경우 가위, 2인 경우 바위, 3인 경우 보] 라고 규칙을 정하자.
		사용자로부터 가위 / 바위 / 보 를 입력받아 랜덤값과 비교하여 
		  이긴 경우 + 10점
		  진 경우 - 10점
		 */
		
		int num = (int)(Math.random() * 3 + 1);
		System.out.print("가위 / 바위 / 보 를 입력하세요 : ");
		String rsp = sc.nextLine();
	}
}
