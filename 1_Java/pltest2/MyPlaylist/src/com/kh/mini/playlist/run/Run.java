package com.kh.mini.playlist.run;

import com.kh.mini.playlist.view.PlayMenu;

import java.io.IOException;

import com.kh.mini.chat.ChatServer;

public class Run {

    public static void main(String[] args) {
        // 서버를 시작하는 스레드
        Thread serverThread = new Thread(() -> {
            try {
                ChatServer.startServer();
            } catch (IOException e) {
                e.printStackTrace();
            }
        });
        serverThread.start();
        
        // PlayMenu를 실행
        PlayMenu pm = new PlayMenu();
        pm.mainMenu();
        
        // 서버 스레드 종료 (실제 환경에서는 더 나은 종료 처리 필요)
        try {
            serverThread.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
