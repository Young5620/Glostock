package com.glostock.model;

import java.sql.Timestamp;

public class PostVO {

    private int postNum;
    private String postTitle;
    private String postContent;
    private String postTag;
    private String postWriter;
    private String postType;
    private Timestamp postTime;

    public PostVO() {
    }

    public PostVO(int postNum, String postTitle, String postContent, String postTag, String postWriter, String postType, Timestamp postTime) {
        this.postNum = postNum;
        this.postTitle = postTitle;
        this.postContent = postContent;
        this.postTag = postTag;
        this.postWriter = postWriter;
        this.postType = postType;
        this.postTime = postTime;
    }

    public int getPostNum() {
        return postNum;
    }

    public void setPostNum(int postNum) {
        this.postNum = postNum;
    }

    public String getPostTitle() {
        return postTitle;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public String getPostContent() {
        return postContent;
    }

    public void setPostContent(String postContent) {
        this.postContent = postContent;
    }

    public String getPostTag() {
        return postTag;
    }

    public void setPostTag(String postTag) {
        this.postTag = postTag;
    }

    public String getPostWriter() {
        return postWriter;
    }

    public void setPostWriter(String postWriter) {
        this.postWriter = postWriter;
    }

    public String getPostType() {
        return postType;
    }

    public void setPostType(String postType) {
        this.postType = postType;
    }

    public Timestamp getPostTime() {
        return postTime;
    }

    public void setPostTime(Timestamp postTime) {
        this.postTime = postTime;
    }
}
