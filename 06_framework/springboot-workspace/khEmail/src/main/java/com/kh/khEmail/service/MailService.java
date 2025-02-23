package com.kh.khEmail.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class MailService {
	//JavaMailSender 주입! => 생성자 주입방식 사용.
	private final JavaMailSender sender;
	
	// {이메일, 코드} --> Map
	private Map<String, String> authInfo = new HashMap<>();
	
	// @Autowired
	public MailService(JavaMailSender sender) {
		this.sender = sender;
	}

	/**
	 * 
	 * @param subject 메일 제목
	 * @param text 메일 내용
	 * @param to 수신자
	 */
	public void sendMail(String subject, String text, String[] to) {
		// 메일 제목, 메일 내용, 수신자
		SimpleMailMessage message = new SimpleMailMessage();
		
		message.setSubject(subject);
		message.setText(text);
		message.setTo(to);
		
		// JavaMailSender 를 통해 메일 전송
		sender.send(message);
	}
	
	/**
	 * HTML 형식의 메일 전송
	 * @param subject 제목
	 * @param text 내용
	 * @param to 수신자
	 * @throws MessagingException
	 */
	public void sendHTMLMail(String subject, String text, String[] to) throws MessagingException {
		// MimeMessage를 사용
		MimeMessage mm = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mm, true);
		
		helper.setSubject(subject);
		helper.setText(text, true);
		helper.setTo(to);
		
		sender.send(mm);
	}
	
	public void sendCode(String email) throws MessagingException {
		// 랜덤 코드 생성
		String code = makeRandomCode("");  // ex) 1e2a5q
		
		String subject = "[KH]인증코드";
		// String text = "인증코드 : " + code;
		String text = "<p>아래의 인증코드를 입력해주세요. </p>" + "<h3>" + code + "</h3>" 
						+ "<p>인증 코드는 3분간 유효합니다.</p>";
		String[] to = { email };
		
		// 이메일(email)에 생성된 코드값을 Map에 저장
		authInfo.put(email, code);
		//sendMail(subject, text, to);
		sendHTMLMail(subject, text, to);
	}
	
	private String makeRandomCode(String code) {
		// 랜덤한 값(숫자, 문자)을 6자리 생성
		int ran = (int)(Math.random()*6+1);
		// code의 길이가 6 일 때 해당 값을 반환
		if(code.length() == 6) {
			return code;
			
		}else {
			int random = (int)(Math.random()*10);
			if(random % 2 == 0) {
				int ran2 = (int)(Math.random() * ('z' - 'a' + 1) + 'a');
				code += (char)ran2;
			}else {
				code += random;
			}
			return makeRandomCode(code);
		}
	}

	/**
	 * 해당 이메일에 발송된 인증코드와 전달받은 인증코드가 같은 값인지 확인
	 * @param email 이메일
	 * @param code 사용자가 전달한 인증코드
	 * @return
	 */
	public boolean checkCode(String email, String code) {
		// Map에서 email에 해당하는 코드를 찾아
		// 전달된 code 값과 동일한지 확인하여 결과를 반환
		
		String authCode = authInfo.get(email);
		
		if(authCode == null) return false;  // 이메일에 대한 발급코드가 없을 경우 => false
		
		boolean result = authCode.equals(code);   // 같으면 true, 다르면 false
		if(result) {
			// 인증코드 검증이 성공했을 때 Map에서 해당 이메일에 대한 정보 제거
			authInfo.remove(email);
			
		}
		return result;
	}
}
