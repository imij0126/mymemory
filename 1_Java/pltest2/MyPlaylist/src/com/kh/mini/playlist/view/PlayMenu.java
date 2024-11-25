package com.kh.mini.playlist.view;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;

import com.kh.mini.chat.ChatClient;
import com.kh.mini.chat.ChatServer;
import com.kh.mini.playlist.controller.PlayController;
import com.kh.mini.playlist.model.vo.Music;

public class PlayMenu {
    private Scanner sc = new Scanner(System.in);
    private PlayController pc = new PlayController();
    private ChatClient chatClient;

    public void mainMenu() {
        // 서버 연결
        try {
            chatClient = new ChatClient("localhost", 5678);
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("서버에 연결할 수 없습니다.");
            return;
        }
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
			System.out.println("7. 나의 플레이리스트를 파일로 저장");
			System.out.println("8. 나의 플레이리스트 파일에서 불러오기");
			System.out.println("9. 게시판에 게시하기");
			System.out.println("10. 게시판 조회하기");
			System.out.println("11. 일대일 채팅 시작하기");
			System.out.println("0. 종료");
			System.out.print("메뉴 번호 : ");
			
			 int menu;
	            if (sc.hasNextInt()) {
	                menu = sc.nextInt();
	                sc.nextLine();  // 개행 문자 소비
	            } else {
	                System.out.println("잘못된 입력입니다. 숫자를 입력해 주세요.");
	                sc.next();  // 잘못된 입력 폐기
	                continue;
	            }
			
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
				fileSave(); break;
			case 8:
				fileOpen(); break;
			case 9:
                postToBoard(); break;
            case 10:
                viewBoard(); break;
            case 11:
                startChat(); break;
            case 0:
                System.out.println("프로그램을 종료합니다.");
                try {
                    chatClient.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
				return;
			default:
				System.out.println("잘못 입력했습니다. 다시 입력해 주세요.");
			}
		}
	}
	/**
	 * 새 음악 추가용 메소드
	*/
	public void InsertMusic() {
		
		System.out.println("♬ 새 음악 추가 ♬");
		System.out.println("음악 정보를 입력해 주세요.");
		System.out.print("제목 : ");
		String title = sc.nextLine();
		System.out.print("아티스트명 : ");
		String artist = sc.nextLine();
		System.out.print("장르 : ");
		String genre = sc.nextLine();
		
		Music m = new Music(title, artist, genre);
		pc.insertMusic(m);
		
	}
	/**
	 * 전체 플레이리스트 조회용 메소드
	 */
	public void selectList() {
		ArrayList<Music> playlist = new ArrayList<>(pc.selectList());
		
		if(playlist.isEmpty()) {
			System.out.println("조회할 음악이 없습니다. 음악을 추가해 주세요.");
		} else {
			System.out.println("─── 。..。:+* playlist *+:。.. 。───");
			for(int i=0; i<playlist.size(); i++) {
				System.out.println(playlist.get(i));
			}
			System.out.println("───✱*.｡:｡✱*.:｡✧*.｡✰*.:｡✧*.｡:｡*.｡✱ ───");
		}
		
	}
	
	/**
	 * 음악 검색용 메소드
	 */
	public void searchMusic() {
		System.out.print("검색할 키워드를 입력하세요 : ");
		String keyword = sc.nextLine();
		
		ArrayList<Music> searchList = pc.searchMusic(keyword);
		if(searchList.isEmpty()) {
			System.out.println("음악 검색 결과가 없습니다.");
		} else {
			for(int i=0; i<searchList.size(); i++) {
				System.out.println(searchList.get(i));
			}
		}
	}
	
	/**
	 * 음악 삭제용 메소드
	 */
	public void deleteMusic() {
		System.out.print("삭제할 음악의 제목 : ");
		String title = sc.nextLine();
		
		System.out.print("삭제할 음악의 아티스트명 : ");
		String artist = sc.nextLine();
		
		Music remove = pc.deleteMusic(title, artist);
		if (remove != null) {
			System.out.println("음악이 삭제되었습니다.");
		} else {
			System.out.println("삭제할 음악을 찾지 못했습니다.");
		}
	}
	/**
	 * 음악 제목으로 오름차순 정렬 메소드
	 */
	public void ascMusic() {
		int result = pc.ascMusic();
		if (result == 1) {
			System.out.println("성공적으로 정렬되었습니다.");
		} else {
			System.out.println("정렬에 실패하였습니다.");
		}
	}
	
	public void playMusic() {
		System.out.print("재생할 음악의 제목을 입력하세요 : ");
		String keyword = sc.nextLine();
		pc.playMusic(keyword);
	}
	
	public void fileSave() {
		System.out.print("저장할 파일명을 입력하세요 : ");
		String filePath = sc.nextLine();
		pc.fileSave(filePath);
	}
	
	public void fileOpen() {
		System.out.print("불러올 파일명을 입력하세요 : ");
		String filePath = sc.nextLine();
		pc.fileOpen(filePath);
	}

	// 게시판에 게시하는 메소드
    public void postToBoard() {
        System.out.println("게시판에 게시할 내용을 입력해 주세요.");
        System.out.print("닉네임: ");
        String nickname = sc.nextLine();
        System.out.print("선호하는 음악 장르: ");
        String genre = sc.nextLine();
        System.out.print("메모: ");
        String memo = sc.nextLine();

        String postMessage = nickname + " / " + genre + " / " + memo;
        chatClient.sendMessage("/post " + postMessage);
        try {
            String response = chatClient.receiveMessage();
            System.out.println(response);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // 게시판 내용을 조회하는 메소드
    public void viewBoard() {
        chatClient.sendMessage("/board");
        try {
            String message;
            while (!(message = chatClient.receiveMessage()).equals("END_OF_BOARD")) {
                System.out.println(message);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void startChat() {
        System.out.print("채팅할 상대의 닉네임을 입력해 주세요 : ");
        String targetNickname = sc.nextLine().trim();

        chatClient.sendMessage("/msg " + targetNickname + " 채팅을 시작합니다.");

        try {
            String response = chatClient.receiveMessage();
            if (response.startsWith("From")) {
                System.out.println(response);
            } else {
                System.out.println("채팅 요청이 성공적으로 전송되었습니다.");
                chatWith(targetNickname);  // 채팅 시작 시 채팅 대기 상태로 전환
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void chatWith(String targetNickname) {  // 채팅 대기 상태 유지
        try {
            while (true) {
                System.out.print("나: ");
                String message = sc.nextLine();
                if (message.equalsIgnoreCase("exit")) {
                    break;
                }
                chatClient.sendMessage("/msg " + targetNickname + " " + message);
                String reply = chatClient.receiveMessage();
                System.out.println(reply);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
	
    }
