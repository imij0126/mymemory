package com.kh.mini.playlist.view;

import java.util.Scanner;

import com.kh.mini.playlist.Music;
import com.kh.mini.playlist.controller.PlayController;

public class PlayMenu {
	private Scanner sc = new Scanner(System.in);
	private PlayController pc = new PlayController();
	
	public void mainMenu() {
		System.out.print("이름을 입력해 주세요 : ");
		String name = sc.nextLine();
		
		System.out.println(" ===== " + name + "'s Playlist ♪ ===== ");
		System.out.println();
		
		while(true) {
			System.out.println("===== 메인 메뉴 =====");
			System.out.println("1. 새 음악 추가");
			System.out.println("2. 플레이리스트 전체 조회");
			System.out.println("3. 음악 검색 조회");
			System.out.println("4. 음악 삭제");
			System.out.println("5. 제목 오름차순 정렬");
			System.out.println("6. 음악 재생");
			System.out.println("7. 나의 플레이리스트 저장");
			System.out.println("0. 종료");
			System.out.print("메뉴 번호 : ");
			
			int menu = sc.nextInt();
			sc.nextLine();
			
			switch(menu) {
			case 1:
				InsertMusic(); break;
			case 2:
				selectList(); break;
			case 3:
				searchMusic(); break;
			case 4:
				deleteMusic(); break;
			case 5:
				ascMusic(); break;
			case 6:
				playMusic(); break;
			case 7:
				/** 플레이리스트 파일로 저장 / 가져오기 내용 위에 구현해 보고
				 * 추가할지 말지 결정하기. 너무 길어질 것 같으면 빼자...
				 */
			case 0:
				System.out.println("프로그램을 종료합니다.");
				return;
			default:
				System.out.println("잘못 입력했습니다. 다시 입력해 주세요.");
			}
		}
	}
	public void InsertMusic() {
		
		System.out.println("♬ 새 음악 추가 ♬");
		System.out.println("음악 정보를 입력해 주세요.");
		System.out.print("제목 : ");
		String title = sc.nextLine();
		System.out.print("아티스트명 : ");
		String artist = sc.nextLine();
		System.out.println("장르 : ");
		String genre = sc.nextLine();
		
		Music m = new Music(title, artist, genre);
		pc.insertMusic(m);
		
	}
	
	public void selectList() {
		
	}

	public void searchMusic() {
		
	}
	
	public void deleteMusic() {
		
	}
	
	public void ascMusic() {
		
	}
	
	public void playMusic() {
		
	}
	
	public void fileSave() {
		
	}
	
	public void fileOpen() {
		
	}
	
	public void fileEdit() {
		
	}
	
}
