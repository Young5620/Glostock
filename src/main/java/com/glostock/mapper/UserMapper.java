package com.glostock.mapper;

import java.util.ArrayList;

import com.glostock.model.UserVO;

public interface UserMapper {

	public int join(UserVO vo);//회원가입
	public int login(UserVO vo);//로그인
	public UserVO mypage(String email);//마이페이지내정보불러오기
	public boolean update(UserVO vo);//내정보변경
	public boolean passwordchange(UserVO vo);//비밀번호변경
	public boolean userleave(UserVO vo);//비밀번호변경
}
