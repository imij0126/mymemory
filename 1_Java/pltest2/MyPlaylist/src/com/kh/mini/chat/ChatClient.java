package com.kh.mini.chat;

import java.io.*;
import java.net.*;

public class ChatClient {
    private Socket socket;
    private PrintWriter out;
    private BufferedReader in;

    public ChatClient(String host, int port) throws IOException {
        // 서버에 연결하기 위해 소켓을 생성
        socket = new Socket(host, port);
        // 서버와의 통신을 위한 출력 스트림을 생성
        out = new PrintWriter(socket.getOutputStream(), true);
        // 서버로부터의 응답을 받기 위한 입력 스트림을 생성
        in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
    }

    // 서버로 메시지를 전송
    public void sendMessage(String message) {
        out.println(message);
    }

    // 서버로부터 메시지를 수신
    public String receiveMessage() throws IOException {
        return in.readLine();
    }

    // 클라이언트 소켓과 스트림을 닫음
    public void close() throws IOException {
        in.close();
        out.close();
        socket.close();
    }
}
