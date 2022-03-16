package com.glostock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.glostock.mapper.UserMapper;
import com.glostock.model.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper mapper; 
	
	
	@Override 
	public int join(UserVO vo) {
		
		int result=mapper.join(vo);
	
	
		return result;
	}
	
	
	@Override
	public int login(UserVO vo) {
		int result= mapper.login(vo);
		
		
		
		return result;
	}
	
	@Override
	public UserVO mypage(String email) {
		UserVO vo=mapper.mypage(email);
		
		return vo;
	}
	
	
	@Override
	public void update(UserVO vo) {
		boolean bool= mapper.update(vo);
		
		
	}
	
	@Override
	public void passwordchange(UserVO vo) {
		boolean bool= mapper.passwordchange(vo);
		
		
	}
	
	
	@Override
	public void userleave(UserVO vo) {
		boolean bool= mapper.userleave(vo);
		
		
	}
	
	
	
	
	
	
	
	
}
