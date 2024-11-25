package com.kh.practice.score.view;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.EOFException;
import java.util.Scanner;

import com.kh.practice.score.controller.ScoreController;

public class ScoreMenu {
	
	private Scanner sc = new Scanner(System.in);
	private ScoreController scr = new ScoreController();
	
	public void mainMenu() {
		while(true) {
			System.out.println("1. 성적 저장");
			System.out.println("2. 성적 출력");
			System.out.println("9. 끝내기");
			System.out.print("메뉴 번호 : ");
			int menu = sc.nextInt();
			
		switch(menu) {
		case 1 : 
			saveScore();
			break;
		case 2 :
			readScore();
			break;
		case 9 :
			System.out.println("프로그램을 종료합니다.");
			return;
		default :
			System.out.println("잘못 입력하셨습니다. 다시 입력해주세요.");
		}
		}		
	}
	
	public void saveScore() {
		while(true) {
			int num = 0; // 학생 숫자를 나타낼 변수
			System.out.println(num+"번째 학생 정보 기록");
			System.out.print("이름 : ");
			String name = sc.nextLine();
			System.out.print("국어 점수 : ");
			int kor = sc.nextInt();
			System.out.print("영어 점수 : ");
			int eng = sc.nextInt();
			System.out.print("수학 점수 : ");
			int math = sc.nextInt();
		
		
			// ScoreController(scr)의 saveScore() 매개변수로 모두 넘겨 주고
			// 그 학생 점수의 합계와 평균도 함께 매개변수로 넣어줌
			int sum = kor + eng + math;
			double avg = sum / 3;
			scr.saveScore(name, kor, eng, math, sum, avg);
			
			// N이나 n을 입력하지 않으면 이름 및 점수를 받는 것을 반복함
			// N이나 n을 입력하면 사용자에게 받는 반복문을 나감
			System.out.print("그만 입력하시려면 N 또는 n 입력, 계속 하시려면 아무 키나 입력하세요 : ");
			char ch = sc.next().charAt(0);
			if(ch == 'N' && ch == 'n') {
				break;
			} else {
				return;
			}
		}
	}
	
	public void readScore()  {
		int count = 0; // 몇 명의 학생인지(반복문이 몇 번 실행됐는지) 담을 변수
		int sumAll = 0;
		double avgAll = 0.0; // 모든 학생들의 합과 평균을 담을 변수
		
		DataInputStream dis = scr.readScore() ;
		Exception EOFException;
		
		for(int i=0; i<count; i++) {
			System.out.println(dis);
		}	
		
}
}