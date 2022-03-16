package com.glostock.mapper;

import java.util.ArrayList;

import com.glostock.model.BoardVO;

public interface BoardMapper {

	public BoardVO mypage(String email); //닉네임 가젹오기
	public void insertfeed(BoardVO vo); //게시물 등록
	public ArrayList<BoardVO> getfeed();//게시물 가져오기
	public ArrayList<BoardVO> myfeed(String nickname);//내 게시글가져오기
	
	
	
}
