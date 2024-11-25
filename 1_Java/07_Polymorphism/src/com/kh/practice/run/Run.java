package com.kh.practice.run;

import java.util.Scanner;

import com.kh.practice.model.vo.AniBook;
import com.kh.practice.model.vo.CookBook;

public class Run {

	public static void main(String[] args) {
		// AniBook 5권을 배열에 초기화
		AniBook[] aniList = {
		
				new AniBook("한번 더 해요", "미티", "원모어", 19),
				new AniBook("루피의 원피스", "루피", "japan", 12),
				new AniBook("주술회전", "고죠", "japan", 15),
				new AniBook("나루토", "나루토", "japan", 12),
				new AniBook("장송의 프리렌", "프리렌", "japan", 12)
		};
		
		// CookBook 5권을 배열에 초기화
		CookBook[] cookList = {
						new CookBook("=백종원의 집밥", "백종원", "tvN", true),
						new CookBook("=성시경의 집밥", "백종원", "tvN", true),
						new CookBook("=이혜정의 집밥", "백종원", "tvN", true),
						new CookBook("=이혜인의 집밥", "백종원", "tvN", true),
						new CookBook("=임수진의 집밥", "백종원", "tvN", true)
						};
		
		// 사용자에게 책 제목을 입력받아 책 정보를 조회해보자.
		Scanner sc = new Scanner(System.in);
		System.out.print("조회하고자 하는 책 제목 입력 : ");
		String title = sc.nextLine();
		
		boolean found = false;
		for (int i=0; i<aniList.length; i++) {
			if (aniList[i].getTitle().equals(title)) {
				System.out.println(aniList[i].toString());
				found = true;
				break;
			}
	}
		if (!found) {	// 입력된 책을 찾지 못했을 경우
			// 요리책 목록에서 찾아보기.
			for(int i=0; i<cookList.length; i++) {
				if (cookList[i].getTitle().equals(title)) {
					System.out.println(cookList[i].toString());
					found = true;
					break;
				}
			}
		}
		
		
		}
	
}
