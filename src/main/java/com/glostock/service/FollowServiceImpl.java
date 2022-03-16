package com.glostock.service;

import com.glostock.mapper.FollowMapper;
import com.glostock.model.FollowDAO;
import com.glostock.model.FollowVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service("followService")
public class FollowServiceImpl implements FollowService {

    @Autowired
    private FollowMapper mapper;

    FollowDAO dao = FollowDAO.getInstance();

    @Override
    public void follow(String nickname, String ticker) {

        dao.addFollow(nickname, ticker);
    }

    @Override
    public ArrayList<FollowVO> getFollowList(String nickname) {
        ArrayList<FollowVO> resultList = new ArrayList<>();
        resultList = dao.getFollowList(nickname);

        return resultList;
    }

    @Override
    public void unfollow(String nickname, String ticker) {

        int result = dao.unfollow("TestNickname", "TSLA");

    }
}
