package com.kh.mini.chat;

import java.io.*;
import java.net.*;
import java.util.*;

public class ChatServer {
    private static final int PORT = 5678; // 서버가 실행될 포트 번호
    private static List<String> board = new ArrayList<>(); // 게시판 내용을 저장할 리스트
    private static Map<String, PrintWriter> clientWriters = new HashMap<>(); // 연결된 클라이언트의 출력을 저장할 맵

    public static void startServer() throws IOException {
        // 서버 소켓을 생성하여 클라이언트의 연결 요청을 대기
        try (ServerSocket serverSocket = new ServerSocket(PORT)) {
            // System.out.println("Chat server started..."); // 서버가 시작되었음을 콘솔에 출력 - 에러 시 확인용
            while (true) {
                Socket clientSocket = serverSocket.accept(); // 클라이언트의 연결 요청을 수락
                new ClientHandler(clientSocket).start(); // 새로운 클라이언트가 연결될 때마다 핸들러를 생성하여 시작
            }
        }
    }

    // 클라이언트의 요청을 처리하는 핸들러 클래스
    private static class ClientHandler extends Thread {
        private Socket socket;
        private PrintWriter out;
        private BufferedReader in;

        public ClientHandler(Socket socket) { // 생성자에서는 클라이언트와 연결된 소켓을 인자로 받아 필드를 초기화
            this.socket = socket; // 클라이언트 소켓을 저장합니다.
        }

        public void run() {
            try {
                // 클라이언트와의 통신을 위한 입출력 스트림을 생성
                in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
                out = new PrintWriter(socket.getOutputStream(), true);	// 클라이언트와의 통신을 위한 입력 스트림과 출력 스트림을 초기화

                String clientAddress = socket.getRemoteSocketAddress().toString(); // 클라이언트의 주소를 가져옴
                synchronized (clientWriters) {
                    clientWriters.put(clientAddress, out); // 클라이언트의 출력을 맵에 저장
                }
                // 클라이언트의 주소를 clientAddress로 저장하고, 이를 clientWriters 맵에 추가
                // synchronized 블록을 사용하여 여러 스레드가 동시에 접근할 때 발생할 수 있는 충돌을 방지

                String message;
                while ((message = in.readLine()) != null) {
                    if (message.startsWith("/post")) {
                        // 클라이언트가 게시물을 올릴 때
                        String postContent = message.substring(6); // "/post" 이후의 내용을 가져옴
                        synchronized (board) {
                            board.add(postContent); // 게시물을 리스트에 추가합니다.
                        }
                        out.println("게시물이 성공적으로 게시되었습니다."); // 클라이언트에게 성공 메시지 출력
                        
                    } else if (message.startsWith("/board")) {
                        // 클라이언트가 게시판 내용을 요청할 때
                        synchronized (board) {
                            for (String post : board) {
                                out.println(post); // 게시판 내용을 클라이언트에게 보냄
                            }
                        }
                        out.println("END_OF_BOARD"); // 게시판 내용 전송의 끝을 표시
                        
                    } else if (message.startsWith("/msg")) {
                        // 클라이언트가 개인 메시지를 보낼 때
                        String[] parts = message.split(" ", 3);
                        if (parts.length == 3) {
                            String targetClient = parts[1]; // 대상 클라이언트
                            String personalMessage = parts[2]; // 개인 메시지 내용
                            synchronized (clientWriters) {
                                PrintWriter targetWriter = clientWriters.get(targetClient);
                                if (targetWriter != null) {
                                    targetWriter.println("From " + clientAddress + ": " + personalMessage); // 개인 메시지를 대상 클라이언트에게 보냄
                                }
                            }
                        }
                    }
                }
            } catch (IOException e) {
                e.printStackTrace(); // 예외가 발생하면 스택 트레이스를 출력
            } finally {
                try {
                    socket.close(); // 소켓을 닫음
                } catch (IOException e) {
                    e.printStackTrace();
                }
                synchronized (clientWriters) {
                    clientWriters.remove(socket.getRemoteSocketAddress().toString()); // 클라이언트의 출력을 맵에서 제거
                }
            }
        }
    }
}
