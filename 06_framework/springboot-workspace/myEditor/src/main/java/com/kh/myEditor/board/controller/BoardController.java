package com.kh.myEditor.board.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.myEditor.model.vo.Board;
import com.kh.myEditor.service.BoardService;
import com.kh.myEditor.service.myEditorService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequiredArgsConstructor
public class BoardController {
	private final BoardService bService;
	@GetMapping("/board")
	public String showenrollBoard() {
		return "board/enrollBoard";
	}
	
	// ------------------------
	@ResponseBody
	@PostMapping("/board")
	public String insertBoard(Board board, HttpSession session) {
		log.info("data --> {}", board);
		int result = bService.insertBoard(board);
		return result > 0 ? "ok" : "fail";
	}
	
	/**
	 * 전달된 이미지파일들을 서버에 저장한 후 해당 파일들의 이름 목록을 반환
	 * @param imgList 이미지 파일 목록
	 * @return 이미지 파일명 목록
	 */
	
	@ResponseBody
	@PostMapping(value="/upload", produces="application/json;charset=UTF-8")
	public String uploadImage(List<MultipartFile> imgList) {
		
		log.info("{}", imgList);
		
		List<String> changeNameList = new ArrayList<>();
		
		for(MultipartFile file : imgList) {
			String changeName = saveFile(file);
			log.info("change name : {}", changeName);
			changeNameList.add(changeName);
		}
		
		return new Gson().toJson(changeNameList);  // ArrayList -> JSONArray
	}
	
	//------------------------
	private String saveFile(MultipartFile upfile) {
		// 파일명을 변경하여 저장
		//   변경 파일명 => yyyyMMddHHmmss + xxxxx(랜덤값) + .확장자
		
		//  * 현재 날짜 시간 정보
		String currTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		//  * 5자리 랜덤값 ( 10000 ~ 99999 )
		int random = (int)(Math.random() * (99999-10000+1)) + 10000;
		//  * 확장자 (.txt, .java, .png, ...)
		String orgName = upfile.getOriginalFilename();		// "test.png", "test.2024.png"
		String ext = orgName.substring( orgName.lastIndexOf(".") );
		String chgName = currTime + random + ext;		
				
		String uploadDir = "./uploads/";
		Path savePath = Paths.get(uploadDir + chgName) ; // "./uploads/202411061018
		
		try {
			
			Files.createDirectories(savePath.getParent()); // 상위 디렉토리가 없을 경우 생성
			Files.write(savePath, upfile.getBytes());	   // 파일을 서버에 저장
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		return uploadDir + chgName;
	}
}
