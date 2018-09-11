package cn.edu.seu.agriculture.service.impl;

import cn.edu.seu.agriculture.dao.UserInfoMapper;
import cn.edu.seu.agriculture.entity.UserInfo;
import cn.edu.seu.agriculture.entity.UserInfoExample;
import cn.edu.seu.agriculture.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

public class UserInfoServiceImpl implements UserInfoService {
    @Autowired
    private UserInfoMapper userInfoMapper;
    @Override
    public List<String> getLikeList(int userId) {
        UserInfo userInfo =  userInfoMapper.selectByPrimaryKey(userId);
        List<String> reList = new ArrayList<>();
        reList.add(userInfo.getProvince());
        reList.add(userInfo.getMarket());
        reList.add(userInfo.getType());
        reList.add(userInfo.getName());
        return reList;
    }

    @Override
    public int insertLiked(int userId, String province, String market, String type, String name) {
        UserInfo userInfo = new UserInfo();
        userInfo.setUserid(userId);
        userInfo.setProvince(province);
        userInfo.setMarket(market);
        userInfo.setType(type);
        userInfo.setName(name);
        UserInfoExample example = new UserInfoExample();
        example.createCriteria().andUseridEqualTo(userId);
        userInfoMapper.updateByExample(userInfo,example);
        return 0;
    }
}
