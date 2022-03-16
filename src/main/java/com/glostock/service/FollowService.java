package com.glostock.service;

import com.glostock.model.FollowVO;

import java.util.ArrayList;

public interface FollowService {

    public void follow(String nickname, String ticker);
    public ArrayList<FollowVO> getFollowList(String nickname);
    public void unfollow(String nickname, String ticker);

}
