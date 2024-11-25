package com.kh.practice;

import java.util.Scanner;

public class ControlPractice2 {
	public static void main(String[] args) {
		
		// Q2. 월을 입력받아 입력받은 월의 마지막 날을 출력하기
		// 1, 3, 5, 7, 8, 10, 12 => 31일
		// 4, 6, 9, 11            => 30일
		// 2                       => 28일 또는 29일 (둘 중 하나의 값을 출력!)
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("월을 입력해 주세요 : ");
		int month = sc.nextInt();
		
		switch(month) {
		case 1: case 3: case 5: case 7: case 8: case 10: case 12:
			System.out.println("마지막 날은 31일입니다.");
			break;
		case 4: case 6: case 9: case 11:
			System.out.println("마지막 날은 30일입니다.");
		case 2:
			System.out.println("마지막 날은 29일입니다.");
		default:
			System.out.println("잘못 입력했습니다.");
		}
		
	}

}
