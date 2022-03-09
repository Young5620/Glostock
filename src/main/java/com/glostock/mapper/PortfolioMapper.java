package com.glostock.mapper;

import java.util.ArrayList;

import com.glostock.command.PortfolioVO;

public interface PortfolioMapper {
	public int insert(PortfolioVO vo);
	public ArrayList<PortfolioVO> select();
	public void delete(String pfname);
}
