package cn.edu.seu.agriculture.service;

import java.util.List;

public interface UserInfoService {

    /**
     * 得到用户的查询偏好
     * @return  [省， 市，  种类  , 名字]
     * @Author 郑浩
     */
    public List<String> getLikeList(int userId);

    /**
     * 增加一条用户喜爱的记录
     * @param userId
     * @param province
     * @param market
     * @param type
     * @param name
     * @return
     */
    public int insertLiked(int userId,
                           String province,
                           String market,
                           String type,
                           String name);
}
