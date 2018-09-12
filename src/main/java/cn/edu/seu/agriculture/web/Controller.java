package cn.edu.seu.agriculture.web;

import cn.edu.seu.agriculture.entity.DatePrice;
import cn.edu.seu.agriculture.service.*;
import cn.edu.seu.agriculture.service.DatePriceService;
import cn.edu.seu.agriculture.service.ReTypeService;
import cn.edu.seu.agriculture.service.TocSearchService;
import cn.edu.seu.agriculture.service.CountryViewService;
import cn.edu.seu.agriculture.service.AuthenticateService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

@org.springframework.stereotype.Controller
public class Controller {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private DatePriceService datePriceService;
    @Autowired
    private ReTypeService reTypeService;
    @Autowired
    private TocSearchService tocSearchService;
    @Autowired
    private CountryViewService countryViewService;
    @Autowired
    private PriceForecastService priceForecastService;
    @Autowired
    private AuthenticateService authenticateService;
    @Autowired
    private UserInfoService userInfoService;


    /**
     * 认证私有工具函数
     * @param request
     * @return 一个表示状态的int
     */
    private static final int NO_LOGIN = -1;
    private static final int LOGIN_SUCCESS = 0;
    private static final int NO_USERNAME = 1;
    private static final int PASSWD_ERROR = 2;

    @RequestMapping(value = "/datePrice/{province}/{market}/{type}/{name}",method = RequestMethod.GET,produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String datePriceHandler(HttpServletRequest request ,
                                       @PathVariable("province")String province,
                                       @PathVariable("market")String market,
                                       @PathVariable("type")String type,
                                       @PathVariable("name")String name
                                        ) {
        int id = authenticateService.authenticate(request);
        if (id != -1){
            logger.info("正在记录用户价格查询操作，用户id:"+String.valueOf(id)+province+market+type+name);
            userInfoService.insertLiked(id,province,market,type,name);
        }else{
            logger.info("正在记录用户价格查询操作，用户cookie验证失败");
        }
        List<Map<String,Object>> reList = datePriceService.getPriceListByInfo(
                province,market,type,name);

        return reTypeService.toJson(reList).toString();
    }

    //下拉栏获取市场名
    @RequestMapping(value = "/getMarket",method = RequestMethod.GET,produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String getMarket(String province) {
        System.out.println(province);
        ArrayList reList = tocSearchService.getMarketByProvince(province);
        logger.info(reList.toString());
        System.out.println(reList.toString());
        return reList.toString().replace(" ","");
    }

    //下拉栏获取品类名
    @RequestMapping(value = "/getType",method = RequestMethod.GET,produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String getType(String province, String market) {
        System.out.println(market+" "+province);
        ArrayList reList = tocSearchService.getTypeByArea(province,market);
        logger.info(reList.toString());
        System.out.println(reList.toString());
        return reList.toString().replace(" ","");
    }

    //下拉栏获取品种名
    @RequestMapping(value = "/getName",method = RequestMethod.GET,produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String getName(String province, String market, String type) {
        System.out.println(type+" "+market+" "+province);
        ArrayList reList = tocSearchService.getNameByAreaAndType(province,market,type);
        logger.info(reList.toString());
        System.out.println(reList.toString());
        return reList.toString().replace(" ","");
    }

    //获取监控的抓取数据
    @RequestMapping(value="/monitor",method =RequestMethod.GET,produces = {"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String Monitor(){
        logger.info("monitor正在搜集数据************************");
        List<DatePrice> datePrices =  datePriceService.getNewPriceList();
        logger.info(datePrices.toString());
        logger.info("monitor正在返回数据************************");
        return reTypeService.toCsv(datePrices).toString();
    }
    //获取name,market,price,date
    @RequestMapping(value = "/AllData",method = RequestMethod.GET,produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String AllData() {
        List<String> AllDataList = datePriceService.getRecentlyCounter();
        return AllDataList.toString().replace(" ","");
    }

    //用于比较页面查询相应数据
    @RequestMapping(value = "/getDataForContrast",method = RequestMethod.GET,produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String getDataForContrast(String province, String market, String type, String name, String startDate,String endDate) {
        System.out.println(type+" "+market+" "+province+" "+name+" "+startDate+" "+endDate+"正在对比查询查询******");
        List<DatePrice> reList = datePriceService.getDetailPriceListByInfo(province,market,type,name,startDate,endDate);
        return reTypeService.toCsv(reList).toString();
    }


    //获取区域行情品名
    @RequestMapping(value = "/areaGetName",method = RequestMethod.GET,produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String areaGetName(String type,String date) {
        ArrayList reList = tocSearchService.getNameByType(date,type);
        logger.info(reList.toString());
        return reList.toString().replace(" ","");
    }

    //获取局域数据
    @RequestMapping(value = "/areaGetAllData",method = RequestMethod.GET,produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String areaGetAllData(String date,String type, String name){
        return countryViewService.getCountryViewPrice(date,type,name);
    }

    //获取过去30天及未来7天的预测价格
    @RequestMapping(value = "/getForecastPrice",method = RequestMethod.GET,produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String getForecast(HttpServletRequest request, String province,String market,String type,String name ) {
        int id = authenticateService.authenticate(request);
        if (id != -1){
            logger.info("正在记录用户价格预测操作，用户id:"+String.valueOf(id)+province+market+type+name);
            userInfoService.insertLiked(id,province,market,type,name);
        }else{
            logger.info("正在记录用户价格预测操作，用户cookie验证失败");
        }
        List<Map<String, Object>> reList = null;
        try{
            reList = priceForecastService.forecast(province, market, type, name);
        }catch (ParseException exception){
            System.out.println("价格预测服务出错");
            exception.printStackTrace();
        }
        logger.info(reList.toString());
        return reTypeService.toJson(reList).toString();
    }

    //监控市场
    @RequestMapping(value = "/getMarketCount",method = RequestMethod.GET,produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String getMarketCount(String province,String market,String type){
        return reTypeService.toJson(datePriceService.getCounter(province,market,type)).toString();
    }

    //登录请求
    @RequestMapping(value = "/doLogin",method = RequestMethod.POST, produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String doLogin(HttpServletRequest request, HttpServletResponse response, String log, String pwd){
        System.out.println("Controller doing login:"+log+" "+pwd);
        int re = authenticateService.login(log ,pwd ,response);
        if(re == NO_USERNAME){
            return "没有此用户";
        }else if(re == PASSWD_ERROR)
        {
            return "密码错误";
        }else {
            return "登录成功";
        }
    }

    //注册请求
    @RequestMapping(value = "/doRegister",method = RequestMethod.POST, produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String doRegister(HttpServletResponse response, String username, String password){
        logger.info("Controller doing register:"+username+" "+password);
        int re = authenticateService.register(username,password);
        if(re == 0){
            logger.info("注册结果：注册成功");
            return "注册成功";
        }else{
            logger.info("注册结果：用户名已存在");
            return "用户名已存在";
        }
    }

    //退出请求
    @RequestMapping(value = "/doLogout",method = RequestMethod.GET, produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String logout(HttpServletRequest request, HttpServletResponse response,String method){
//        System.out.println("Controller doing logout");
        int re = authenticateService.logout(request, response);
        logger.info("Controller doing logout");
        if(re == 1){
            logger.error("failed");
            return "注销失败";
        }
        return "退出登录成功";
    }


    //监控界面的跳转
    @RequestMapping(value = "/control",method = RequestMethod.GET,produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public ModelAndView controlPage(HttpServletRequest request){
        if (authenticateService.authenticate(request)!=NO_LOGIN){
            ModelAndView retMap = new ModelAndView();  //返回新的ModelAndView
            retMap.setViewName("control");
            return retMap;
        }else{
            ModelAndView retMap = new ModelAndView();  //返回新的ModelAndView
            retMap.setViewName("register");
            return retMap;
        }
    }


    //对比界面的跳转
    @RequestMapping(value = "/contrast",method = RequestMethod.GET,produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public ModelAndView contrastPage(HttpServletRequest request){
        if (authenticateService.authenticate(request)!=NO_LOGIN){
            ModelAndView retMap = new ModelAndView();  //返回新的ModelAndView
            retMap.setViewName("contrast");
            return retMap;
        }else{
            ModelAndView retMap = new ModelAndView();  //返回新的ModelAndView
            retMap.setViewName("register");
            return retMap;
        }

    }

    //预测界面的跳转
    @RequestMapping(value = "/forecast",method = RequestMethod.GET,produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public ModelAndView forecastPage(HttpServletRequest request){
        if (authenticateService.authenticate(request)!=NO_LOGIN){
            ModelAndView retMap = new ModelAndView();  //返回新的ModelAndView
            retMap.setViewName("forecast");
            return retMap;
        }else{
            ModelAndView retMap = new ModelAndView();  //返回新的ModelAndView
            retMap.setViewName("register");
            return retMap;
        }
    }


    //企业地图界面的跳转
    @RequestMapping(value = "/EnterpriseMap",method = RequestMethod.GET,produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public ModelAndView EnterpriseMapPage(HttpServletRequest request ,HttpServletResponse response){
        if (authenticateService.authenticate(request)!=NO_LOGIN ){
            ModelAndView retMap = new ModelAndView();  //返回新的ModelAndView
            retMap.setViewName("EnterpriseMap");
            return retMap;
        }else{
            ModelAndView retMap = new ModelAndView();  //返回新的ModelAndView
            retMap.setViewName("register");
            return retMap;
        }
    }

    //获取用户历史操作数据
    @RequestMapping(value = "/getHistory",method = RequestMethod.GET,produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String getHistory(HttpServletRequest request){
        int id = authenticateService.authenticate(request);
        return userInfoService.getLikeList(id).toString().replace(" ","");
    }
}
