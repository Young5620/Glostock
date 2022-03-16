package com.glostock.service;

import java.util.ArrayList;

import com.glostock.model.PortfolioVO;

public interface PortfolioService {
	public void insertPort(PortfolioVO vo);
	public ArrayList<PortfolioVO> getList(String pfname); //portfolio 가져오기
	public ArrayList<PortfolioVO> getList_nick(String nickname);
	public void delete(String pfname); //portfolio 삭제
}
