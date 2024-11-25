package com.kh.spring.member.service;

import com.kh.spring.member.model.vo.Member;

public interface MemberService {

	/* 로그인 서비스 */
	Member loginMember(Member m);
	
	/* 회원 가입 서비스 */
	int insertMember(Member m);
	
	/* 아이디 중복체크 기능 */
	int idCheck(String id);
	
	/* 회원 정보 수정 */
	Member updateMember(Member m);
	
	/* 회원 탈퇴 */
	// int deleteMember(String id, String pwd);
	int deleteMember(String id);		// => 비밀번호 암호화로 인해 id로만 처리하도록 변경!
	
}




