package com.glostock.service;

import java.util.ArrayList;

import com.glostock.model.BoardVO;

public interface BoardService {

public BoardVO mypage(String email);//마이페이지닉네임가져오기
public void insertfeed(BoardVO vo); //피드삽입
public ArrayList<BoardVO> getfeed(); //피드가져오기
public ArrayList<BoardVO> myfeed(String nickname);//내 게시글가져오기
	
}
