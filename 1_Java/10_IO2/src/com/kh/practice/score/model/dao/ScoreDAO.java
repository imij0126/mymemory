package com.kh.practice.score.model.dao;

import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;

public class ScoreDAO {
		
	public void saveScore(String name, int kor, int eng, int math, int sum, double avg) {
		
		try{// 출력 파일 객체 생성
			File f = new File("./resource/score.txt");
			
			// 데이터 출력 스트림 선언
			DataOutputStream dos  = new DataOutputStream(
					new BufferedOutputStream(
						new FileOutputStream(f)
					));
			f.
			
			dos.flush();
			dos.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
		
		
	}
	
	public DataInputStream readScore() {
		return null;
		//throws FileNotFoundException
	}

}
