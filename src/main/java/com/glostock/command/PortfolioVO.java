package com.glostock.command;

import java.security.Timestamp;

public class PortfolioVO {
	private String pf_name;
	private int num;
	private String ticker;
	private String transaction;
	private Timestamp date; 
	private String shares;
	private String price;
	
	public PortfolioVO() {}

	public PortfolioVO(String pf_name, int num, String ticker, String transaction, Timestamp date, String shares,
			String price) {
		super();
		this.pf_name = pf_name;
		this.num = num;
		this.ticker = ticker;
		this.transaction = transaction;
		this.date = date;
		this.shares = shares;
		this.price = price;
	}

	public String getPf_name() {
		return pf_name;
	}

	public void setPf_name(String pf_name) {
		this.pf_name = pf_name;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTicker() {
		return ticker;
	}

	public void setTicker(String ticker) {
		this.ticker = ticker;
	}

	public String getTransaction() {
		return transaction;
	}

	public void setTransaction(String transaction) {
		this.transaction = transaction;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
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
