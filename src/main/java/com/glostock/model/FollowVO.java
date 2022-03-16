package com.glostock.model;

import java.sql.Timestamp;

public class FollowVO {
    private int followID;
    private String ticker;
    private String nickname;
    private Timestamp appendtime;

    public FollowVO() {
    }

    public FollowVO(int followID, String ticker, String nickname, Timestamp appendtime) {
        this.followID = followID;
        this.ticker = ticker;
        this.nickname = nickname;
        this.appendtime = appendtime;
    }

    public int getFollowID() {
        return followID;
    }

    public void setFollowID(int followNum) {
        this.followID = followNum;
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

    public Timestamp getAppendtime() {
        return appendtime;
    }

    public void setAppendtime(Timestamp timestamp) {
        this.appendtime = timestamp;
    }
}
