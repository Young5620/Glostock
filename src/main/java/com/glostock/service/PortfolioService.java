package com.glostock.service;

import java.util.ArrayList;

import com.glostock.command.PortfolioVO;

public interface PortfolioService {
	public int insertPort(String pfname, String ticker, String transaction, String shares, String nickname,String price);
	public ArrayList<PortfolioVO> getList(); //portfolio 가져오기
	public void delete(String pfname); //portfolio 삭제
}
