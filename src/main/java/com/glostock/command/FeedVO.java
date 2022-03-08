package com.glostock.command;

public class FeedVO {
	private String title;
	private String source;
	private String tag;
	private String content;
	private String writer;
	public FeedVO() {}
	public FeedVO(String title, String source, String tag, String content, String writer) {
		super();
		this.title = title;
		this.source = source;
		this.tag = tag;
		this.content = content;
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
}
