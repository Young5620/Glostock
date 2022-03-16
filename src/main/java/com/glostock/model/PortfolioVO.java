package com.glostock.model;

import java.sql.Timestamp;

public class PortfolioVO {
	private String pfname;
	private int pfnum;	
	private String ticker;
	private String nickname;
	private String transaction;
	private Timestamp regdate; 
	private String shares;
	private String price;
	
	public PortfolioVO() {}

	public PortfolioVO(String pfname, int pfnum, String ticker, String nickname, String transaction, Timestamp regdate,
			String shares, String price) {
		super();
		this.pfname = pfname;
		this.pfnum = pfnum;
		this.ticker = ticker;
		this.nickname = nickname;
		this.transaction = transaction;
		this.regdate = regdate;
		this.shares = shares;
		this.price = price;
	}

	public String getPfname() {
		return pfname;
	}

	public void setPfname(String pfname) {
		this.pfname = pfname;
	}

	public int getPfnum() {
		return pfnum;
	}

	public void setPfnum(int pfnum) {
		this.pfnum = pfnum;
	}

	public String getTicker() {
		return ticker;
	}

	public void setTicker(String ticker) {
		this.ticker = ticker;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getTransaction() {
		return transaction;
	}

	public void setTransaction(String transaction) {
		this.transaction = transaction;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getShares() {
		return shares;
	}

	public void setShares(String shares) {
		this.shares = shares;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
	
	
}
