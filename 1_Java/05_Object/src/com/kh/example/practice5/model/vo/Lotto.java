package com.kh.example.practice5.model.vo;

import java.util.Arrays;

// import java.lang.*; <- java.lang 에 있는 모든 변수는 import 안 해도 됨

public class Lotto {
	// 필드부 (변수)
	private int[] lotto;
	
	// 초기화 블록
	{
		lotto = new int[6];	// 6개 정수데이터를 담을 배열 할당
		
		for(int i=0; i<lotto.length; i++) {
			// lotto 배열의 i 번째 위치에 랜덤값(1~45)을 저장
			lotto[i] = (int)(Math.random() * 45 + 1);

			for(int j=0; j<i; j++) {
				if (lotto[i] == lotto[j]) {
					i--;
					break;
				}
			}
		}
	}
	
	//생성자부
	public Lotto() {}
	
	// 메서드부
	public void information() {
		// 정보 출력 ==> 필드(변수)의 정보를 출력
		// Arrays.toString(배열명) : [값1, 값2, 값3, ...] 형식 출력
		System.out.println(Arrays.toString(lotto));
		
		// 향상된 for문/foreach문 : 배열의 첫번째 위치부터 마지막위치까지 순서대로 데이터에 접근
		// for (자료형 변수명 : 배열명) --> 자료형은 배열의 자료형과 일치해야 함
		System.out.println("===========================");
		for (int num : lotto) {
			System.out.print(num + ", ");
		}
	}

}