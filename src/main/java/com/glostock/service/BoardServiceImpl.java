package com.glostock.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.glostock.mapper.BoardMapper;
import com.glostock.model.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper; 
	
	
	@Override
	public BoardVO mypage(String email) {
		
		BoardVO vo= mapper.mypage(email);
		
		return vo;
	}
	
	@Override
	public void insertfeed(BoardVO vo) {
		
		mapper.insertfeed(vo);
		
		
		
	}
	
@Override
public ArrayList<BoardVO> getfeed() {
	
	ArrayList<BoardVO> list= mapper.getfeed();
	
	return list;
}
	
@Override
public ArrayList<BoardVO> myfeed(String nickname) {
	
	
	ArrayList<BoardVO> list= mapper.myfeed(nickname);
	
	
	return list;
}

	
	
}
