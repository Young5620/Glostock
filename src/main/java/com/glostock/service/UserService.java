package com.glostock.service;

import com.glostock.model.UserVO;

public interface UserService {

	public int join(UserVO vo); //회원가입
	public int login(UserVO vo); //회원로그인
	public UserVO mypage(String email); //마이페이지
	public void update(UserVO vo);//회원정보변경
	public void passwordchange(UserVO vo);//비밀번호변경
	public void userleave(UserVO vo);//회원탈퇴
	
}
