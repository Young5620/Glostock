package com.glostock.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.glostock.command.PortfolioVO;
import com.glostock.mapper.PortfolioMapper;
@Service
public class PortfolioServiceImpl implements PortfolioService {
	
	@Autowired
	private PortfolioMapper mapper;
	
	@Override
	public ArrayList<PortfolioVO> getList() {
		ArrayList<PortfolioVO> list = mapper.select();
		return list;
	}

	@Override
	public void delete(String pfname) {
		mapper.delete(pfname);

	}
	
	@Override
	public int insertPort(String pfname, String ticker, String transaction, String shares,String nickname,String price) {
		PortfolioVO vo = new PortfolioVO();
		vo.setPfname(pfname);
		vo.setTicker(ticker);
		vo.setTransaction(transaction);
		vo.setShares(shares);
		vo.setNickname(nickname);
		vo.setPrice(price);

		int result = mapper.insert(vo);
		return result;
	}
}
