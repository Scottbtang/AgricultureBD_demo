package cn.edu.seu.agriculture.service.impl;

import cn.edu.seu.agriculture.dao.UserPasswdMapper;
import cn.edu.seu.agriculture.entity.UserInfo;
import cn.edu.seu.agriculture.entity.UserPasswd;
import cn.edu.seu.agriculture.entity.UserPasswdExample;
import cn.edu.seu.agriculture.service.AuthenticateService;
import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTCreationException;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.DecodedJWT;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Service
public class AuthenicateServiceImpl implements AuthenticateService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private UserPasswdMapper userPasswdMapper;
    private static final int SECONDs = 300;
    private static final Algorithm ALGORITHM = Algorithm.HMAC256("I_LOVE_U");

    @Override
    public int login(String username, String password, HttpServletResponse response) {
        UserPasswdExample example = new UserPasswdExample();
        example.createCriteria()
                .andUsernameEqualTo(username);
        List<UserPasswd> query = userPasswdMapper.selectByExample(example);
        if(query.size() <= 0)
        {
            logger.error("查询错误");
            return 1;
        }

        UserPasswd userPasswd = query.get(0);
        if(!userPasswd.getPassword().equals(password))
        {
            logger.error("密码不相等");
            return 2;
        }


        /**
         * TODO  add token in cookie;
         */
        String token = null;
        try {
            Date expaireTime = new Date(System.currentTimeMillis() + 1000 * SECONDs);
            token = JWT.create()
                    .withIssuer("SEU")
                    .withClaim("userId",userPasswd.getUserid())
                    .withExpiresAt(expaireTime)
                    .sign(ALGORITHM);
        } catch (JWTCreationException exception){
            logger.error("JWT CREATE ERROR");
        }
        System.out.println(token);
        Cookie cookie = new Cookie("jwt",token);
        response.addCookie(cookie);
        return 0;
    }

    @Override
    public int authenticate(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        String cookieValue = null;
        for(Cookie cookie : cookies){
            if(cookie.getName().equals("jwt")){
                cookieValue = cookie.getValue();
            }
        }
        DecodedJWT jwt = null;
        try {
            JWTVerifier verifier = JWT.require(ALGORITHM)
                    .withIssuer("SEU")
                    .build(); //Reusable verifier instance
            jwt = verifier.verify(cookieValue);
        } catch (JWTVerificationException | IllegalArgumentException exception){
            return -1;
        }
        int userId = jwt.getClaim("userId").asInt();
        if(userId > 1000)
            return userId;
        else
            return -1;
    }

    @Override
    public int logout(HttpServletRequest request, HttpServletResponse response) {
        Cookie[] cookies = request.getCookies();
        int userId = 0;
        for(Cookie cookie : cookies){
            if(cookie.getName().equals("jwt")){
                String token = cookie.getValue();
                DecodedJWT jwt = JWT.decode(token);
                logger.info("before token  : " + jwt.getToken());
                userId = jwt.getClaim("userId").asInt();
            }
        }
        // Get a new token
        String token = null;
        try {
            Date expaireTime = new Date(System.currentTimeMillis());   // 直接过期来达到注销的目
            token = JWT.create()
                    .withIssuer("SEU")
                    .withClaim("userId",userId)
                    .withExpiresAt(expaireTime)
                    .sign(ALGORITHM);
        } catch (JWTCreationException exception){
            return 1;
        }
        Cookie cookie = new Cookie("jwt",token);
        response.addCookie(cookie);
        logger.info("after token  : " + token);
        return 0;
    }

    @Override
    public int register(String username, String password) {
        UserPasswd userPasswd = new UserPasswd();
        userPasswd.setUsername(username);
        userPasswd.setPassword(password);

        UserPasswdExample example = new UserPasswdExample();
        example.setOrderByClause("userId DESC");
        List<UserPasswd> query =  userPasswdMapper.selectByExample(example);
        int newId = query.get(0).getUserid() + 2;
        userPasswd.setUserid(newId);
        try{
            userPasswdMapper.insert(userPasswd);
        }catch (Exception e)
        {
            return 1;
        }
        return 0;
    }
}
