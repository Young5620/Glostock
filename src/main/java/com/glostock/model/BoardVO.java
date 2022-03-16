package com.glostock.model;

import java.sql.Timestamp;

public class BoardVO {

	    private int postnum; 
	    private String title; 
	    private String nickname; 
	    private String content; 
	    private String ticker; 
	    private Timestamp regdate; 
	    private Timestamp updatedate;
	    private String email;

		public BoardVO() {
		
		}

		public BoardVO(int postnum, String title, String nickname, String content, String ticker, Timestamp regdate,
				Timestamp updatedate, String email) {

			this.postnum = postnum;
			this.title = title;
			this.nickname = nickname;
			this.content = content;
			this.ticker = ticker;
			this.regdate = regdate;
			this.updatedate = updatedate;
			this.email=email; 
		}

		

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public int getPostnum() {
			return postnum;
		}

		public void setPostnum(int postnum) {
			this.postnum = postnum;
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String getNickname() {
			return nickname;
		}
		

		public void setNickname(String nickname) {
			this.nickname = nickname;
		}

		public String getContent() {
			return content;
		}

		public void setContent(String content) {
			this.content = content;
		}

		public String getTicker() {
			return ticker;
		}

		public void setTicker(String ticker) {
			this.ticker = ticker;
		}

		public Timestamp getRegdate() {
			return regdate;
		}

		public void setRegdate(Timestamp regdate) {
			this.regdate = regdate;
		}

		public Timestamp getUpdatedate() {
			return updatedate;
		}

		public void setUpdatedate(Timestamp updatedate) {
			this.updatedate = updatedate;
		}
	    
	    
	
	
	
	
	
	
	
	
}
